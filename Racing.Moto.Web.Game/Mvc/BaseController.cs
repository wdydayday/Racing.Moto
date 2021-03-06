﻿using App.Core.OnlineStat;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using NLog;
using Racing.Moto.Core.Utils;
using Racing.Moto.Game.Data.Constants;
using Racing.Moto.Game.Data.Entities;
using Racing.Moto.Game.Data.Membership;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Racing.Moto.Game.Web.Mvc
{
    public class BaseController : Controller
    {
        private ILogger _logger = LogManager.GetCurrentClassLogger();

        private User _loginUser = null;
        public User LoginUser
        {
            get
            {
                return _loginUser;
            }
        }

        protected override void OnAuthorization(AuthorizationContext filterContext)
        {
            base.OnAuthorization(filterContext);

            try
            {
                var rawUrl = filterContext.RequestContext.HttpContext.Request.RawUrl.ToLower();
                if (IsAllowAnonymousUrl(rawUrl) || filterContext.RouteData.Values["controller"].ToString().ToLower() == "home")
                {
                    if (HttpContext.User.Identity.IsAuthenticated)
                    {
                        if (PKBag.OnlineUserRecorder == null)
                        {
                            System.Web.Security.FormsAuthentication.SignOut();
                            PKBag.Clear();
                        }
                        else
                        {
                            var guid = AuthenticationUtil.GetLoginUserGuid();
                            if (PKBag.OnlineUserRecorder.GetUserByAuthenticationId(guid) == null)
                            {
                                System.Web.Security.FormsAuthentication.SignOut();
                                PKBag.Clear();
                            }
                        }
                    }
                    return;
                }

                //_logger.Info(string.Format("IsAuthenticated: {0} {1}", HttpContext.User.Identity.IsAuthenticated, DateTime.Now.ToString(DateFormatConst.yMd_Hms)));

                // 踢出
                if (PKBag.OnlineUserRecorder != null)
                {
                    var guid = AuthenticationUtil.GetLoginUserGuid();
                    if (HttpContext.User.Identity.IsAuthenticated && PKBag.OnlineUserRecorder.GetUserByAuthenticationId(guid) == null)
                    {
                        //_logger.Info(string.Format("Kick Out: {0} at {1}", HttpContext.User.Identity.Name, DateTime.Now.ToString(DateFormatConst.yMd_Hms)));

                        System.Web.Security.FormsAuthentication.SignOut();
                        PKBag.Clear();
                        SetRedirect(filterContext);

                        return;
                    }

                    //if (HttpContext.User.Identity.IsAuthenticated && PKBag.OnlineUserRecorder.GetUser(HttpContext.User.Identity.Name) == null)
                    //{
                    //    //_logger.Info(string.Format("Kick Out: {0} at {1}", HttpContext.User.Identity.Name, DateTime.Now.ToString(DateFormatConst.yMd_Hms)));
                    //    System.Web.Security.FormsAuthentication.SignOut();

                    //    PKBag.Clear();
                    //    SetRedirect(filterContext);

                    //    return;
                    //}
                }

                if (HttpContext.User.Identity.IsAuthenticated)
                {
                    if (_loginUser == null)
                    {
                        if (System.Web.HttpContext.Current.Session[SessionConst.LoginUser] == null)
                        {
                            _loginUser = SqlMembershipProvider.Provider.GetUser(HttpContext.User.Identity.Name, true);
                            //_loginUser.UserExtension = new UserExtensionService().GetUserExtension(_loginUser.UserId);

                            // LoginUser session
                            System.Web.HttpContext.Current.Session[SessionConst.LoginUser] = _loginUser;
                        }
                        else
                        {
                            _loginUser = System.Web.HttpContext.Current.Session[SessionConst.LoginUser] as User;
                        }
                    }
                }
                else
                {
                    SetRedirect(filterContext);

                    ViewBag.ReturnUrl = filterContext.HttpContext.Request.Url.ToString();
                }

                ViewBag.CurrentUser = _loginUser;
            }
            catch (Exception ex)
            {
                _logger.Info(ex.Message);
            }
        }

        private bool IsAllowAnonymousUrl(string url)
        {
            var isAllowAnonymousUrl = false;

            var allowAnonymousUrls = new List<string> { "/account/login", "/account/register" };
            foreach (var allowAnonymousUrl in allowAnonymousUrls)
            {
                if (url.Contains(allowAnonymousUrl))
                {
                    isAllowAnonymousUrl = true;
                    break;
                }
            }

            return isAllowAnonymousUrl;
        }


        protected void SetRedirect(AuthorizationContext filterContext)
        {
            try
            {
                var returnUrl = filterContext.RequestContext.HttpContext.Request.RawUrl.ToLower().TrimEnd('/');
                //var isManageUrl = returnUrl.Contains("/manage/") || returnUrl.Contains("/moto/bet");
                //var loginUrl = isManageUrl ? "/Admin/Account/Login" : "/Account/Login";

                var loginUrl = "/Account/Login";
                var rdm = Guid.NewGuid().ToString("N");//防止浏览器缓存登录页面
                var url = !string.IsNullOrEmpty(returnUrl)
                    ? loginUrl + "?returnUrl=" + HttpUtility.UrlEncode(returnUrl + "&r=" + rdm)
                    : loginUrl + "?r=" + rdm;

                filterContext.HttpContext.Response.Redirect(url);
            }
            catch (Exception ex)
            {
                _logger.Info(ex.Message);
            }
        }

        protected override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            base.OnActionExecuted(filterContext);

            try
            {
                //if (System.Web.HttpContext.Current.Session[SessionConst.LoginUser] != null)
                //{
                //    //在线用户统计
                //    OnlineHttpModule.ProcessRequest();
                //}
            }
            catch (Exception ex)
            {
                _logger.Info(ex.Message);
            }
        }

        protected override JsonResult Json(object data, string contentType, Encoding contentEncoding, JsonRequestBehavior behavior)
        {
            return new NewJsonResult
            {
                Data = data,
                ContentType = contentType,
                ContentEncoding = contentEncoding,
                JsonRequestBehavior = behavior
            };
        }

        protected JsonResult Json(object data, List<string> excludeProperty, JsonRequestBehavior behavior = JsonRequestBehavior.DenyGet)
        {
            return new NewJsonResult(excludeProperty)
            {
                Data = data,
                JsonRequestBehavior = behavior
            };
        }
    }

    public static class PKBag
    {
        public static User LoginUser
        {
            get
            {
                return System.Web.HttpContext.Current.Session[SessionConst.LoginUser] as User;
            }
        }

        /// <summary>
        /// 在线用户
        /// </summary>
        public static OnlineUserRecorder OnlineUserRecorder
        {
            get
            {
                return HttpContext.Current != null ? HttpContext.Current.Cache[SessionConst.OnlineUserRecorderCacheKey] as OnlineUserRecorder : null;
            }
        }


        public static void Clear()
        {
            if (LoginUser != null)
            {
                var guid = AuthenticationUtil.GetLoginUserGuid();
                var user = PKBag.OnlineUserRecorder.GetUserByAuthenticationId(guid);
                PKBag.OnlineUserRecorder.Delete(user);
            }

            System.Web.HttpContext.Current.Session.Remove(SessionConst.LoginUser);
            System.Web.HttpContext.Current.Session.Remove(SessionConst.Menus);
        }
    }


    #region JsonResult

    public class NewJsonResult : JsonResult
    {
        private JsonSerializerSettings Settings { get; set; }

        public NewJsonResult()
        {
            Settings = new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                NullValueHandling = NullValueHandling.Include
            };
        }

        public NewJsonResult(List<string> excludeProperty)
        {
            Settings = new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                NullValueHandling = NullValueHandling.Include,
                ContractResolver = new ExcludePropertiesContractResolver(excludeProperty)
            };
        }

        public override void ExecuteResult(ControllerContext context)
        {
            if (context == null)
                throw new ArgumentNullException("context");

            if (this.JsonRequestBehavior == JsonRequestBehavior.DenyGet && string.Equals(context.HttpContext.Request.HttpMethod, "GET", StringComparison.OrdinalIgnoreCase))
                throw new InvalidOperationException("JSON GET is not allowed");

            HttpResponseBase response = context.HttpContext.Response;

            response.ContentType = string.IsNullOrEmpty(this.ContentType) ? "application/json" : this.ContentType;

            if (this.ContentEncoding != null)
                response.ContentEncoding = this.ContentEncoding;

            if (this.Data == null)
                return;

            response.Write(JsonConvert.SerializeObject(Data, Formatting.Indented, this.Settings));
        }
    }

    /// <summary>
    /// 排除某些属性
    /// </summary>
    public class ExcludePropertiesContractResolver : DefaultContractResolver
    {
        private List<string> ExcludeProperty { get; set; }

        public ExcludePropertiesContractResolver(List<string> excludeProperty)
        {
            ExcludeProperty = excludeProperty;
        }

        protected override JsonProperty CreateProperty(MemberInfo member, MemberSerialization memberSerialization)
        {
            if (ExcludeProperty.Contains(member.Name))
            {
                return null;
            }
            return base.CreateProperty(member, memberSerialization);
        }
    }

    #endregion
}
