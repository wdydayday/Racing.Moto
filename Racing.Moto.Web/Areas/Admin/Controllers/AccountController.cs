﻿using NLog;
using Racing.Moto.Core.Captcha;
using Racing.Moto.Core.Utils;
using Racing.Moto.Data.Entities;
using Racing.Moto.Data.Enums;
using Racing.Moto.Data.Membership;
using Racing.Moto.Data.Models;
using Racing.Moto.Services;
using Racing.Moto.Services.Constants;
using Racing.Moto.Services.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Racing.Moto.Web.Areas.Admin.Controllers
{
    [Authorize]
    public class AccountController : AdminBaseController
    {
        private ILogger _logger = LogManager.GetCurrentClassLogger();
        private MembershipProvider _memberProvider = SqlMembershipProvider.Provider;

        #region login

        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        //[ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel model, string returnUrl)
        {
            try
            {
                // 验证码
                if (!CheckCaptcha(model.Captcha))
                {
                    ModelState.AddModelError("", "验证码错误");
                    return View(model);
                }

                if (!string.IsNullOrEmpty(model.UserName) && !string.IsNullOrEmpty(model.Password))
                {
                    // 判断是否为会员 , 非会员禁止登录
                    var isMember = new UserRoleService().IsMember(model.UserName);
                    if (!isMember)
                    {
                        ModelState.AddModelError("", "用户名或密码错误.");
                        return View(model);
                    }


                    if (_memberProvider.SignIn(model.UserName, model.Password, model.RememberMe) == LoginStatus.Success)
                    {

                        #region LoginUser session

                        var loginUser = _memberProvider.GetUser(model.UserName, true);
                        loginUser.UserExtension = new UserExtensionService().GetUserExtension(loginUser.UserId);
                        System.Web.HttpContext.Current.Session[SessionConst.LoginUser] = loginUser;

                        #endregion

                        #region 登录日志

                        //MonIPUtil.Load(Server.MapPath("~/App_Data/17monipdb.dat"));
                        //var ip = IPUtil.GetHostAddress();
                        ////var ipAddress = MonIPUtil.Find(ip);
                        //var loginLog = new LoginLog
                        //{
                        //    IP = ip,
                        //    Address = MonIPUtil.FindAddress(ip),
                        //    UserId = loginUser.UserId
                        //};
                        //new LoginLogService().AddLoginLog(loginLog);

                        #endregion

                        //在线用户统计
                        OnlineHttpModule.ProcessRequest();

                        //if (Url.IsLocalUrl(returnUrl))
                        //{
                        //    return Redirect(HttpUtility.UrlDecode(returnUrl));
                        //}
                        //else
                        //{
                        //    return Redirect("/Admin/News/Index");
                        //}
                        //return Redirect("/Admin/News/Index");

                        return Redirect("/Account/Agreement2");
                    }

                    ModelState.AddModelError("", "用户名或密码错误.");
                }
                else
                {
                    ModelState.AddModelError("", "请输入用户名,密码.");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", MessageConst.System_Error);

                _logger.Info(ex);
            }

            return View(model);
        }

        private bool CheckCaptcha(string captcha)
        {
            return Session[CaptchaConst.REG_CAPTCHA_SESSION] != null && Session[CaptchaConst.REG_CAPTCHA_SESSION].ToString().ToLower() == captcha.ToLower();
        }

        #endregion

        #region logout

        //[AllowAnonymous]
        [HttpGet]
        public ActionResult LogOut()
        {
            _memberProvider.SignOut();
            //System.Web.HttpContext.Current.Session.Remove(nameof(LoginUser));
            PKBag.Clear();

            return Redirect("/Admin/Account/Login");
        }
        #endregion

        #region register


        //
        // GET: /Account/Register

        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        //
        // POST: /Account/Register

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterModel model)
        {
            try
            {
                if (ModelState.IsValid && CheckUser(model.UserName))
                {
                    var user = InitUser(model);
                    _memberProvider.CreateUser(user);
                    System.Web.Security.FormsAuthentication.SetAuthCookie(user.UserName, false);

                    return RedirectToAction("Index", "Home");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", MessageConst.System_Error);

                _logger.Info(ex);
            }

            return View(model);
        }

        private User InitUser(RegisterModel model)
        {
            var user = new User();

            user.UserName = model.UserName.Trim();
            //user.Email = model.Email;
            user.Password = model.Password;
            user.IsLocked = false;
            user.Enabled = true;

            return user;
        }

        private bool CheckUser(string userName)
        {
            if (_memberProvider.Exsits(userName.Trim()))
            {
                ModelState.AddModelError("", "该用户已存在");
                return false;
            }
            return true;
        }

        #endregion

        #region ChangePassword

        // GET: /Account/ChangePassword
        public ActionResult ChangePassword()
        {
            return View();
        }

        // POST: /Account/ChangePassword
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    int status = _memberProvider.ChangePassword(User.Identity.Name, model.OldPassword, model.NewPassword);

                    switch (status)
                    {
                        case 0:
                            //return RedirectToAction("Index", "Home");
                            ModelState.AddModelError("", "修改成功");
                            break;
                        case 2:
                            ModelState.AddModelError("", "原始密碼错误");
                            break;
                    }

                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", MessageConst.System_Error);

                    _logger.Info(ex);
                }
            }

            return View(model);
        }

        #endregion
    }
}