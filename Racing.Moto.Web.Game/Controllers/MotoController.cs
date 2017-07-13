﻿using NLog;
using Racing.Moto.Game.Data.Constants;
using Racing.Moto.Game.Data.Models;
using Racing.Moto.Game.Web.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Racing.Moto.Web.Game.Controllers
{
    public class MotoController : BaseController
    {
        private ILogger _logger = LogManager.GetCurrentClassLogger();

        #region 房间
        public ActionResult Room(int id)
        {
            ViewBag.RoomId = id;
            return View();
        }

        /// <summary>
        /// 进入房间
        /// </summary>
        /// <param name="model">room model</param>
        /// <returns></returns>
        public JsonResult Join(RoomUserModel model)
        {
            var result = new ResponseResult();

            try
            {
                var maxMembers = 10;    //最多人数

                var deskUsers = PKBag.OnlineUserRecorder.GetUserList().Where(u => u.RoomLevel == model.RoomLevel && u.DeskNo == model.DeskNo);
                var memberCount = deskUsers.Count();
                if (memberCount == maxMembers)
                {
                    result.Success = false;
                    result.Message = "房间已满";
                }
                else
                {
                    var user = PKBag.OnlineUserRecorder.GetUser(PKBag.LoginUser.UserName);
                    user.RoomLevel = model.RoomLevel;
                    user.DeskNo = model.DeskNo;

                    // 取最小的 还未在房间中 使用的车号
                    var motoNums = OnlineHttpModule.GetMinMotoNum(model.RoomLevel, model.DeskNo);
                    user.Num = motoNums;
                }
            }
            catch (Exception ex)
            {
                result.Success = false;
                result.Message = MessageConst.System_Error;

                _logger.Info(ex);
            }

            return Json(result);
        }

        //// 取最小的 还未在房间中 使用的车号
        //private int GetMinMotoNum(int roomLevel, int deskNo)
        //{
        //    var minNums = 1;

        //    var deskUsers = PKBag.OnlineUserRecorder.GetUserList().Where(u => u.RoomLevel == roomLevel && u.DeskNo == deskNo);
        //    for (int num = 1; num <= 10; num++)
        //    {
        //        if (!deskUsers.Where(u => u.Num == num).Any())
        //        {
        //            minNums = num;
        //            break;
        //        }
        //    }

        //    return minNums;
        //}

        #endregion

        // 竞技场
        [AllowAnonymous]
        public ActionResult Arena()
        {
            if (PKBag.LoginUser != null)
            {
                var user = PKBag.OnlineUserRecorder.GetUser(PKBag.LoginUser.UserName);
                if (user.Num > 0)
                {
                    ViewBag.MyMotoNum = user.Num;
                }
            }

            return View();
        }
    }
}