﻿using Racing.Moto.Data;
using Racing.Moto.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Racing.Moto.Services
{
    public class UserExtensionService : BaseServcice
    {
        public UserExtension GetUserExtension(int userId)
        {
            using (var db = new RacingDbContext())
            {
                var userExtend = db.UserExtension.Where(u => u.UserId == userId).FirstOrDefault();
                if (userExtend == null)
                {
                    userExtend = new UserExtension
                    {
                        UserId = userId,
                        Amount = 0
                    };

                    db.UserExtension.Add(userExtend);
                    db.SaveChanges();
                }
                return userExtend;
            }
        }

        public UserExtension GetUserExtension(string userName)
        {
            using (var db = new RacingDbContext())
            {
                var userId = db.User.Where(u => u.UserName == userName).Select(u => u.UserId).FirstOrDefault();
                if (userId > 0)
                {
                    return GetUserExtension(userId);
                }
                else
                {
                    return null;
                }
            }
        }

        public decimal GetUserAmount(int userId)
        {
            decimal amount = 0M;

            using (var db = new RacingDbContext())
            {
                amount = db.UserExtension.Where(u => u.UserId == userId).Select(u => u.Amount).FirstOrDefault();
            }

            return amount;
        }

        /// <summary>
        /// 增加账户金额
        /// </summary>
        public void AddAmount(int userId, decimal amount)
        {
            using (var db = new RacingDbContext())
            {
                var userExtend = db.UserExtension.Where(u => u.UserId == userId).FirstOrDefault();
                if (userExtend == null)
                {
                    userExtend = new UserExtension
                    {
                        UserId = userId,
                        Amount = amount
                    };

                    db.UserExtension.Add(userExtend);
                }
                else
                {
                    userExtend.Amount += amount;
                }
                db.SaveChanges();
            }
        }

        /// <summary>
        /// 减少账户金额
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="amount"></param>
        public void MinusAmount(int userId, decimal amount)
        {
            using (var db = new RacingDbContext())
            {
                var userExtend = db.UserExtension.Where(u => u.UserId == userId).FirstOrDefault();
                userExtend.Amount = userExtend.Amount - amount;
                db.SaveChanges();
            }
        }

        /// <summary>
        /// 取账户余额
        /// </summary>
        /// <param name="userId"></param>
        public decimal GetBalance(int userId)
        {
            using (var db = new RacingDbContext())
            {
                var balance = db.UserExtension.Where(u => u.UserId == userId).Select(u => (decimal?)u.Amount ?? 0).FirstOrDefault();
                return Math.Round(balance, 2);
            }
        }

        /// <summary>
        /// 保存 找回密码时系统生成的验证码
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="validateCode"></param>
        public void SaveValidateCode(string userName, string validateCode)
        {
            using (var db = new RacingDbContext())
            {
                var userExtention = db.UserExtension.Where(u => u.User.UserName == userName).FirstOrDefault();
                if (userExtention != null)
                {
                    userExtention.ValidateCodeForForgetPwd = validateCode;
                    userExtention.ValidateCodeCreateDate = DateTime.Now;

                    db.SaveChanges();
                }
            }
        }

        public bool CheckValidateCodeForForgetPwd(string userName, string code)
        {
            using (var db = new RacingDbContext())
            {
                var extention = db.UserExtension.Where(u => u.User.UserName == userName && u.ValidateCodeForForgetPwd == code).FirstOrDefault();
                if (extention != null)
                {
                    extention.ValidateCodeForForgetPwd = null;
                    extention.ValidateCodeCreateDate = null;

                    db.SaveChanges();
                }
                return extention != null;
            }
        }
    }
}
