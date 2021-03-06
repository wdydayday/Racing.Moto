﻿using App.Core.OnlineStat;
using NLog;
using Racing.Moto.Core.Utils;
using Racing.Moto.Game.Data.Constants;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;

namespace Racing.Moto.Game.Web.Mvc
{
    public class OnlineHttpModule
    {
        private static ILogger _logger = LogManager.GetCurrentClassLogger();

        // 缓存键
        //public static readonly string g_onlineUserRecorderCacheKey = "__OnlineUserRecorder";

        public static void Register()
        {
            try
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
                    factory.StatisticEventInterval = 0; // 禁止修改

                    // 创建记录器
                    recorder = factory.Create();

                    // 缓存记录器
                    HttpContext.Current.Cache.Insert(SessionConst.OnlineUserRecorderCacheKey, recorder);
                }
            }
            catch (Exception ex)
            {
                _logger.Info(ex);
            }
        }

        #region IHttpHandler 成员
        public static void ProcessRequest()
        {
            try
            {
                // 获取在线用户记录器
                OnlineUserRecorder recorder = HttpContext.Current.Cache[SessionConst.OnlineUserRecorderCacheKey] as OnlineUserRecorder;

                if (recorder == null)
                {
                    Register();
                    recorder = HttpContext.Current.Cache[SessionConst.OnlineUserRecorderCacheKey] as OnlineUserRecorder;
                }

                OnlineUser onlineUser = new OnlineUser();

                //注意session的名称是和登录保存的名称一致
                Data.Entities.User user = (Data.Entities.User)HttpContext.Current.Session[SessionConst.LoginUser];

                //用于限制用户只能在一处登录
                onlineUser.AuthenticationId = AuthenticationUtil.GetLoginUserGuid();

                onlineUser.UniqueID = user.UserId;
                //父级UserName
                onlineUser.ParentUserId = user.ParentUserId;
                //祖父级UserName
                //if (user.ParentUserId.HasValue)
                //{
                //    onlineUser.GrandUserId = new UserService().GetParentUserId(user.ParentUserId.Value);
                //}

                // 用户名称                                                        
                onlineUser.UserName = user.UserName;
                // 用户头像 
                onlineUser.Avatar = user.Avatar;
                // 用户角色
                //onlineUser.UserDegree = user.UserRoles.First().RoleId;
                // SessionID
                onlineUser.SessionID = HttpContext.Current.Session.SessionID;
                // IP 地址
                //onlineUser.ClientIP = IPUtil.GetHostAddress();
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
            catch (Exception ex)
            {
                _logger.Info(ex);
            }
        }
        #endregion

        public static void AddOnlineUser(OnlineUser onlineUser)
        {
            try
            {
                // 获取在线用户记录器
                OnlineUserRecorder recorder = HttpContext.Current.Cache[SessionConst.OnlineUserRecorderCacheKey] as OnlineUserRecorder;

                if (recorder == null)
                {
                    Register();
                    recorder = HttpContext.Current.Cache[SessionConst.OnlineUserRecorderCacheKey] as OnlineUserRecorder;
                }


                //用于限制用户只能在一处登录
                onlineUser.AuthenticationId = AuthenticationUtil.GetLoginUserGuid();

                // 用户角色
                //onlineUser.UserDegree = user.UserRoles.First().RoleId;
                // SessionID
                onlineUser.SessionID = HttpContext.Current.Session != null ? HttpContext.Current.Session.SessionID : onlineUser.UserName;
                // IP 地址
                //onlineUser.ClientIP = IPUtil.GetHostAddress();
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
                recorder.AddUser(onlineUser);

            }
            catch (Exception ex)
            {
                _logger.Info(ex);
            }
        }

        public static int GetDummyUniqueID(int minId)
        {
            // 获取在线用户记录器
            OnlineUserRecorder recorder = HttpContext.Current.Cache[SessionConst.OnlineUserRecorderCacheKey] as OnlineUserRecorder;

            if (recorder == null)
            {
                Register();
                recorder = HttpContext.Current.Cache[SessionConst.OnlineUserRecorderCacheKey] as OnlineUserRecorder;
            }

            int minDummyUniqueID = minId;

            var dummyUsers = recorder.GetUserList().Where(u => u.UniqueID >= minId).OrderBy(u => u.UniqueID).ToList();
            for (var i = 0; i < dummyUsers.Count; i++)
            {
                if (i < dummyUsers.Count - 1)
                {
                    // 两个用户之间的UniqueID差 > 1
                    if (dummyUsers[i + 1].UniqueID - dummyUsers[i].UniqueID > 1)
                    {
                        minDummyUniqueID = dummyUsers[i].UniqueID;
                        break;
                    }
                }
                else
                {
                    minDummyUniqueID = dummyUsers[i].UniqueID;
                }
            }

            return minDummyUniqueID + 1;
        }


        // 取最小的 还未在房间中 使用的车号
        public static int GetMinMotoNum(int roomLevel, int deskNo)
        {
            var minNums = 1;

            OnlineUserRecorder recorder = HttpContext.Current.Cache[SessionConst.OnlineUserRecorderCacheKey] as OnlineUserRecorder;

            var deskUsers = recorder.GetUsers(roomLevel, deskNo);
            for (int num = 1; num <= 10; num++)
            {
                if (!deskUsers.Where(u => u.Num == num).Any())
                {
                    minNums = num;
                    break;
                }
            }

            return minNums;
        }

    }
}
