﻿using App.Core.OnlineStat;
using Racing.Moto.Core.Utils;
using Racing.Moto.Services.Constants;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;

namespace Racing.Moto.Services.Mvc
{
    public class OnlineHttpModule
    {
        // 缓存键
        //public static readonly string g_onlineUserRecorderCacheKey = "__OnlineUserRecorder";

        public static void Register()
        {
            // 获取在线用户记录器
            OnlineUserRecorder recorder = HttpContext.Current.Cache[SessionConst.OnlineUserRecorderCacheKey] as OnlineUserRecorder;

            if (recorder == null)
            {
                // 创建记录器工厂
                OnlineUserRecorderFactory factory = new OnlineUserRecorderFactory();

                // 设置用户超时时间
                var authConfig = (AuthenticationSection)ConfigurationManager.GetSection("system.web/authentication");
                factory.UserTimeOutMinute = (int)authConfig.Forms.Timeout.TotalMinutes;
                // 统计时间间隔
                factory.StatisticEventInterval = 30;

                // 创建记录器
                recorder = factory.Create();

                // 缓存记录器
                HttpContext.Current.Cache.Insert(SessionConst.OnlineUserRecorderCacheKey, recorder);
            }
        }

        #region IHttpHandler 成员
        public static void ProcessRequest()
        {
            // 获取在线用户记录器
            OnlineUserRecorder recorder = HttpContext.Current.Cache[SessionConst.OnlineUserRecorderCacheKey] as OnlineUserRecorder;

            if(recorder == null)
            {
                Register();
                recorder = HttpContext.Current.Cache[SessionConst.OnlineUserRecorderCacheKey] as OnlineUserRecorder;
            }

            OnlineUser onlineUser = new OnlineUser();

            Data.Entities.User user = (Data.Entities.User)HttpContext.Current.Session[SessionConst.LoginUser];//注意session的名称是和登录保存的名称一致
            // 用户名称
            onlineUser.UserName = Convert.ToString(user.UserName);
            // 用户角色
            onlineUser.UserDegree = user.UserRoles.First().RoleId;
            // SessionID
            onlineUser.SessionID = HttpContext.Current.Session.SessionID;
            // IP 地址
            onlineUser.ClientIP = IPUtil.GetHostAddress();
            // 登录时间
            if (!onlineUser.LoginTime.HasValue)
            {
                onlineUser.LoginTime = DateTime.Now;
            }
            // 最后活动时间
            onlineUser.ActiveTime = DateTime.Now;
            // 最后请求地址
            onlineUser.RequestURL = HttpContext.Current.Request.RawUrl;

            // 保存用户信息
            recorder.Persist(onlineUser);
        }
        #endregion
    }
}
