USE [Racing.Moto]
GO
SET IDENTITY_INSERT [dbo].[User] ON 

GO
INSERT [dbo].[User] ([UserId], [UserName], [Email], [Password], [Enabled], [LastLoginDate], [IsLocked], [LockedDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [CreateDate], [ParentUserId]) VALUES (1, N'Admin', NULL, N'c+7XiqAHP51xuOhQ6ZhFZNxC7hZiIi5P', 1, CAST(N'2017-02-05T16:52:29.943' AS DateTime), 0, NULL, 0, CAST(N'2017-02-05T09:51:45.537' AS DateTime), CAST(N'2017-02-05T09:51:45.537' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserExtend] ([UserId], [Amount]) VALUES (1, CAST(100000000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'管理员')
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'总代理')
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'代理')
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (4, N'会员')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

GO
INSERT [dbo].[UserRole] ([UserRoleId], [RoleId], [UserId]) VALUES (1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

GO
INSERT [dbo].[Post] ([PostId], [Title], [PostContent], [PostStatus], [CreateTime], [UserId]) VALUES (1, N'公告', N'<h1 style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;">公告</h1><p><span style="color: rgb(37, 37, 37); font-family: 宋体, sans-serif; text-align: justify; text-indent: 32px; background-color: rgb(255, 255, 255);">一年又一年，落脚迎春天。每逢春节之际，习近平总要深入基层，慰问普通百姓、看望困难群众，带去新方略、送去新年货。这五年，他送出的 “年货”有啥深意？</span><strong style="color: rgb(37, 37, 37); font-family: 宋体, sans-serif; text-align: justify; text-indent: 32px; background-color: rgb(255, 255, 255); margin: 0px; padding: 0px; max-width: 100%; line-height: 24px; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">请随“学习中国”一起学习。</strong></p>', 1, CAST(N'2017-02-05T09:51:45.563' AS DateTime), 1)
GO
INSERT [dbo].[Post] ([PostId], [Title], [PostContent], [PostStatus], [CreateTime], [UserId]) VALUES (2, N'跑马灯', N'跑马灯
跑马灯1', 1, CAST(N'2017-02-05T09:51:45.563' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[AppConfig] ON 

GO
INSERT [dbo].[AppConfig] ([AppConfigId], [Name], [Value]) VALUES (1, N'Racing_Opening_Seconds', N'480')
GO
INSERT [dbo].[AppConfig] ([AppConfigId], [Name], [Value]) VALUES (2, N'Racing_Close_Seconds', N'60')
GO
INSERT [dbo].[AppConfig] ([AppConfigId], [Name], [Value]) VALUES (3, N'Racing_Game_Seconds', N'50')
GO
INSERT [dbo].[AppConfig] ([AppConfigId], [Name], [Value]) VALUES (4, N'Racing_Lottery_Seconds', N'10')
GO
INSERT [dbo].[AppConfig] ([AppConfigId], [Name], [Value]) VALUES (5, N'Rate_Admin', N'0.2')
GO
INSERT [dbo].[AppConfig] ([AppConfigId], [Name], [Value]) VALUES (6, N'Rate_Return', N'0.04')
GO
INSERT [dbo].[AppConfig] ([AppConfigId], [Name], [Value]) VALUES (7, N'News_Announcement', N'1')
GO
INSERT [dbo].[AppConfig] ([AppConfigId], [Name], [Value]) VALUES (8, N'News_Marquee', N'2')
GO
SET IDENTITY_INSERT [dbo].[AppConfig] OFF
GO
SET IDENTITY_INSERT [dbo].[Rate] ON 

GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (1, 1, CAST(1.80 AS Decimal(18, 2)), CAST(1.80 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (2, 2, CAST(1.80 AS Decimal(18, 2)), CAST(1.80 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (3, 3, CAST(1.80 AS Decimal(18, 2)), CAST(1.80 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (4, 4, CAST(1.80 AS Decimal(18, 2)), CAST(1.80 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (5, 5, CAST(1.80 AS Decimal(18, 2)), CAST(1.80 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (6, 6, CAST(1.80 AS Decimal(18, 2)), CAST(1.80 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (7, 7, CAST(1.80 AS Decimal(18, 2)), CAST(1.80 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (8, 8, CAST(1.80 AS Decimal(18, 2)), CAST(1.80 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (9, 9, CAST(1.80 AS Decimal(18, 2)), CAST(1.80 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (10, 10, CAST(1.80 AS Decimal(18, 2)), CAST(1.80 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), CAST(9.40 AS Decimal(18, 2)), 0)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (11, 1, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (12, 2, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (13, 3, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (14, 4, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (15, 5, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (16, 6, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (17, 7, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (18, 8, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (19, 9, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (20, 10, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), CAST(9.50 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (21, 1, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (22, 2, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (23, 3, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (24, 4, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (25, 5, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (26, 6, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (27, 7, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (28, 8, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (29, 9, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (30, 10, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (31, 1, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (32, 2, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (33, 3, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (34, 4, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (35, 5, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (36, 6, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (37, 7, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (38, 8, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (39, 9, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Big], [Small], [Odd], [Even], [Rate1], [Rate2], [Rate3], [Rate4], [Rate5], [Rate6], [Rate7], [Rate8], [Rate9], [Rate10], [RateType]) VALUES (40, 10, CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), CAST(9.70 AS Decimal(18, 2)), 3)
GO
SET IDENTITY_INSERT [dbo].[Rate] OFF
GO
