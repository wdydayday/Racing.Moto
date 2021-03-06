﻿using NLog;
using Racing.Moto.Core.Utils;
using Racing.Moto.Game.Data.Constants;
using Racing.Moto.Game.Data.Entities;
using Racing.Moto.Game.Data.Enums;
using Racing.Moto.Game.Data.Membership;
using Racing.Moto.Game.Data.Models;
using Racing.Moto.Game.Data.Services;
using Racing.Moto.Game.Web.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Racing.Moto.Game.Web.Controllers
{
    [Authorize]
    public class AccountController : BaseController
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
                if (!string.IsNullOrEmpty(model.UserName) && !string.IsNullOrEmpty(model.Password))
                {
                    var loginSuccess = Login(model);
                    if (loginSuccess)
                    {
                        return Redirect("/");
                        //return RedirectToAction("Index", "Home");
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

        #endregion

        #region logout

        //[AllowAnonymous]
        [HttpGet]
        public ActionResult LogOut()
        {
            _memberProvider.SignOut();
            //System.Web.HttpContext.Current.Session.Remove(nameof(LoginUser));
            PKBag.Clear();

            return Redirect("/Account/Login");
        }
        #endregion

        /// <summary>
        /// 用户登录成后, 设置登录session等信息
        /// </summary>
        /// <param name="userName"></param>
        private User SetLoginInfo(string userName)
        {
            var loginUser = _memberProvider.GetUser(userName, true);
            System.Web.HttpContext.Current.Session[SessionConst.LoginUser] = loginUser;

            return loginUser;
        }

        private bool Login(LoginModel model)
        {
            var loginStatus = _memberProvider.SignIn(model.UserName, model.Password, model.RememberMe);
            var loginSuccess = loginStatus == LoginStatus.Success;

            if (loginSuccess)
            {
                var loginUser = SetLoginInfo(model.UserName);

                //在线用户统计
                OnlineHttpModule.ProcessRequest();
            }

            return loginSuccess;
        }

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
                    // 注册
                    var user = InitUser(model);
                    _memberProvider.CreateUser(user);

                    // 生成头像
                    new UserService().SaveAvatar(user.UserName);

                    // 登录
                    var loginModel = new LoginModel
                    {
                        UserName = model.UserName,
                        Password = model.Password
                    };

                    var loginSuccess = Login(loginModel);

                    if (loginSuccess)
                    {
                        return Redirect("/");
                    }
                    else
                    {
                        return RedirectToAction("Login", "Account");
                    }
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
                            return RedirectToAction("Index", "Home");
                        case 2:
                            ModelState.AddModelError("", "旧密码错误");
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

        #region forget password

        [AllowAnonymous]
        public ActionResult ForgetPassword()
        {
            return View();
        }

        #region 获取验证码
        /// <summary>
        /// 获取验证码
        /// </summary>
        //[AllowAnonymous]
        //public JsonResult GetValidateCodeForForgetPwd(string userName, string email)
        //{
        //    var result = new ResponseResult();

        //    try
        //    {
        //        var user = new UserService().GetUserByUserName(userName);
        //        if (user.Email != email)
        //        {

        //            result.Success = false;
        //            result.Message = MessageConst.USER_EMAIL_USERNAME_NOT_MATTCHING;
        //        }
        //        else
        //        {
        //            //生成随机验证码
        //            var code = RandomUtil.GetRandomCode(6);

        //            // 发送邮件
        //            SendEmail(email, code);

        //            // 保存至数据库
        //            new UserExtensionService().SaveValidateCode(userName, code);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        result.Success = false;
        //        result.Message = MessageConst.System_Error;
        //        _logger.Info(ex);
        //    }

        //    return Json(result);
        //}

        [AllowAnonymous]
        private void SendEmail(string email, string validateCode)
        {
            EmailUtil emailUtil = new EmailUtil();

            var webName = System.Configuration.ConfigurationManager.AppSettings["WebName"];
            var smptHost = System.Configuration.ConfigurationManager.AppSettings["SmptHost"];
            var smtpEmail = System.Configuration.ConfigurationManager.AppSettings["SmtpEmail"];
            var smptPassword = System.Configuration.ConfigurationManager.AppSettings["SmptPassword"];

            var smtp = new SMTP();
            smtp.Host = smptHost;
            smtp.Port = 25;
            smtp.Email = smtpEmail;
            smtp.Password = smptPassword;


            var body = "尊敬的用户,您好！<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;您的验证码是: {0}<br/>【{1}】";

            body = string.Format(body, validateCode, webName);

            emailUtil.SendEmail(smtp, smtp.Email, webName, email, null, webName + "验证码", body, true);
        }
        #endregion


        /// <summary>
        /// 验证 验证码, 成功后重置密码为 123456
        /// </summary>
        //[AllowAnonymous]
        //public JsonResult CheckValidateCodeForForgetPwd(string userName, string email, string code)
        //{
        //    var result = new ResponseResult();

        //    try
        //    {
        //        // 验证
        //        var isValidCode = new UserExtensionService().CheckValidateCodeForForgetPwd(userName, code);

        //        if (isValidCode)
        //        {
        //            // 重置密码为 123456
        //            new UserService().ChangePassword(userName, DBConst.User_Reset_Password);

        //            result.Data = DBConst.User_Reset_Password;
        //        }
        //        else
        //        {
        //            result.Success = false;
        //            result.Message = MessageConst.USER_INVALID_CODE;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        result.Success = false;
        //        result.Message = MessageConst.System_Error;
        //        _logger.Info(ex);
        //    }

        //    return Json(result);
        //}

        #endregion
    }
}