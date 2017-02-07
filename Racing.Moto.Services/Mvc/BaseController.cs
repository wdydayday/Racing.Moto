﻿using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using Racing.Moto.Data.Entities;
using Racing.Moto.Data.Membership;
using Racing.Moto.Services.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Racing.Moto.Services.Mvc
{
    public class BaseController : Controller
    {
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

            // chrome浏览器设置 从上次停下的地方继续 时, 关闭浏览器不会删除cookie, 此处判断如果session失效则强制删除cookie
            if (HttpContext.User.Identity.IsAuthenticated && System.Web.HttpContext.Current.Session[nameof(LoginUser)] == null)
            {
                System.Web.Security.FormsAuthentication.SignOut();
                System.Web.HttpContext.Current.Session.Remove(nameof(LoginUser));
                var returnUrl = filterContext.RequestContext.HttpContext.Request.RawUrl;
                var loginUrl = "/Account/Login";
                var url = !string.IsNullOrEmpty(returnUrl) ? loginUrl + "?returnUrl=" + returnUrl : loginUrl;
                filterContext.HttpContext.Response.Redirect(url);
            }

            if (HttpContext.User.Identity.IsAuthenticated && _loginUser == null)
            {
                if (System.Web.HttpContext.Current.Session[nameof(LoginUser)] == null)
                {
                    _loginUser = SqlMembershipProvider.Provider.GetUser(HttpContext.User.Identity.Name, true);
                    _loginUser.UserExtend = new UserExtendService().GetUserExtend(_loginUser.UserId);

                    // LoginUser session
                    System.Web.HttpContext.Current.Session[nameof(LoginUser)] = _loginUser;
                }
                else
                {
                    _loginUser = System.Web.HttpContext.Current.Session[nameof(LoginUser)] as User;
                }

                // menus
                if (System.Web.HttpContext.Current.Session[SessionConst.Menus] == null)
                {
                    var roleIds = _loginUser.UserRoles.Select(ur => ur.RoleId).ToList();
                    var menus = new MenuService().GetMenuByRoles(roleIds);

                    System.Web.HttpContext.Current.Session[SessionConst.Menus] = menus;
                }
            }
            else
            {
                ViewBag.ReturnUrl = filterContext.HttpContext.Request.Url.ToString();
            }

            ViewBag.CurrentUser = _loginUser;
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
                return System.Web.HttpContext.Current.Session[nameof(LoginUser)] as User;
            }
        }

        public static List<Menu> Menus
        {
            get
            {
                return System.Web.HttpContext.Current.Session[SessionConst.Menus] as List<Menu>;
            }
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
