/****** Object:  Table [dbo].[AppConfig]    Script Date: 2017/1/24 23:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppConfig](
	[AppConfigId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[Value] [nvarchar](1000) NULL,
 CONSTRAINT [PK_dbo.AppConfig] PRIMARY KEY CLUSTERED 
(
	[AppConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bet]    Script Date: 2017/1/24 23:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bet](
	[BetId] [int] IDENTITY(1,1) NOT NULL,
	[Rank] [int] NOT NULL,
	[Num] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[UserId] [int] NOT NULL,
	[PKId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Bet] PRIMARY KEY CLUSTERED 
(
	[BetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BetItem]    Script Date: 2017/1/24 23:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BetItem](
	[BetItemId] [int] IDENTITY(1,1) NOT NULL,
	[Rank] [int] NOT NULL,
	[Num] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[BetId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.BetItem] PRIMARY KEY CLUSTERED 
(
	[BetItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PK]    Script Date: 2017/1/24 23:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PK](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[BeginTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[OpeningSeconds] [int] NOT NULL,
	[CloseSeconds] [int] NOT NULL,
	[GameSeconds] [int] NOT NULL,
	[LotterySeconds] [int] NOT NULL,
	[Ranks] [nvarchar](100) NULL,
	[IsBonused] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PK] PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PKBonus]    Script Date: 2017/1/24 23:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PKBonus](
	[PKBonusId] [int] IDENTITY(1,1) NOT NULL,
	[Rank] [int] NOT NULL,
	[Num] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[UserId] [int] NOT NULL,
	[PKId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PKBonus] PRIMARY KEY CLUSTERED 
(
	[PKBonusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PKLog]    Script Date: 2017/1/24 23:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PKLog](
	[PKLogId] [int] IDENTITY(1,1) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Origin] [nvarchar](300) NULL,
	[LogLevel] [nvarchar](300) NULL,
	[Logger] [nvarchar](300) NULL,
	[Message] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
	[StackTrace] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PKLog] PRIMARY KEY CLUSTERED 
(
	[PKLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PKRate]    Script Date: 2017/1/24 23:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PKRate](
	[PKRateId] [int] IDENTITY(1,1) NOT NULL,
	[Rank] [int] NOT NULL,
	[Num] [int] NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[PKId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PKRate] PRIMARY KEY CLUSTERED 
(
	[PKRateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 2017/1/24 23:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NULL,
	[PostContent] [nvarchar](max) NULL,
	[PostStatus] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Post] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rate]    Script Date: 2017/1/24 23:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[RateId] [int] IDENTITY(1,1) NOT NULL,
	[Rank] [int] NOT NULL,
	[Number1] [decimal](18, 2) NOT NULL,
	[Number2] [decimal](18, 2) NOT NULL,
	[Number3] [decimal](18, 2) NOT NULL,
	[Number4] [decimal](18, 2) NOT NULL,
	[Number5] [decimal](18, 2) NOT NULL,
	[Number6] [decimal](18, 2) NOT NULL,
	[Number7] [decimal](18, 2) NOT NULL,
	[Number8] [decimal](18, 2) NOT NULL,
	[Number9] [decimal](18, 2) NOT NULL,
	[Number10] [decimal](18, 2) NOT NULL,
	[Big] [decimal](18, 2) NOT NULL,
	[Small] [decimal](18, 2) NOT NULL,
	[Odd] [decimal](18, 2) NOT NULL,
	[Even] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Rate] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 2017/1/24 23:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](300) NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2017/1/24 23:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](300) NULL,
	[Email] [nvarchar](300) NULL,
	[Password] [nvarchar](300) NULL,
	[Enabled] [bit] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[IsLocked] [bit] NOT NULL,
	[LockedDate] [datetime] NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ParentUserId] [int] NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserExtend]    Script Date: 2017/1/24 23:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserExtend](
	[UserId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.UserExtend] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2017/1/24 23:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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
SET IDENTITY_INSERT [dbo].[AppConfig] OFF
GO
SET IDENTITY_INSERT [dbo].[Rate] ON 

GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Number1], [Number2], [Number3], [Number4], [Number5], [Number6], [Number7], [Number8], [Number9], [Number10], [Big], [Small], [Odd], [Even]) VALUES (1, 1, CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Number1], [Number2], [Number3], [Number4], [Number5], [Number6], [Number7], [Number8], [Number9], [Number10], [Big], [Small], [Odd], [Even]) VALUES (2, 2, CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Number1], [Number2], [Number3], [Number4], [Number5], [Number6], [Number7], [Number8], [Number9], [Number10], [Big], [Small], [Odd], [Even]) VALUES (3, 3, CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Number1], [Number2], [Number3], [Number4], [Number5], [Number6], [Number7], [Number8], [Number9], [Number10], [Big], [Small], [Odd], [Even]) VALUES (4, 4, CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Number1], [Number2], [Number3], [Number4], [Number5], [Number6], [Number7], [Number8], [Number9], [Number10], [Big], [Small], [Odd], [Even]) VALUES (5, 5, CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Number1], [Number2], [Number3], [Number4], [Number5], [Number6], [Number7], [Number8], [Number9], [Number10], [Big], [Small], [Odd], [Even]) VALUES (6, 6, CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Number1], [Number2], [Number3], [Number4], [Number5], [Number6], [Number7], [Number8], [Number9], [Number10], [Big], [Small], [Odd], [Even]) VALUES (7, 7, CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Number1], [Number2], [Number3], [Number4], [Number5], [Number6], [Number7], [Number8], [Number9], [Number10], [Big], [Small], [Odd], [Even]) VALUES (8, 8, CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Number1], [Number2], [Number3], [Number4], [Number5], [Number6], [Number7], [Number8], [Number9], [Number10], [Big], [Small], [Odd], [Even]) VALUES (9, 9, CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Rate] ([RateId], [Rank], [Number1], [Number2], [Number3], [Number4], [Number5], [Number6], [Number7], [Number8], [Number9], [Number10], [Big], [Small], [Odd], [Even]) VALUES (10, 10, CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(9.60 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)), CAST(1.90 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Rate] OFF
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
SET IDENTITY_INSERT [dbo].[User] ON 

GO
INSERT [dbo].[User] ([UserId], [UserName], [Email], [Password], [Enabled], [LastLoginDate], [IsLocked], [LockedDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [CreateDate], [ParentUserId]) VALUES (1, N'Admin', NULL, N'shLnCv9tb3W22p7zrEVv/D2YlL2KWcKu', 1, NULL, 0, NULL, 0, CAST(N'2017-01-24T23:49:01.893' AS DateTime), CAST(N'2017-01-24T23:49:01.893' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserExtend] ([UserId], [Amount]) VALUES (1, CAST(100000000.00 AS Decimal(18, 2)))
GO
ALTER TABLE [dbo].[Bet]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bet_dbo.PK_PKId] FOREIGN KEY([PKId])
REFERENCES [dbo].[PK] ([PKId])
GO
ALTER TABLE [dbo].[Bet] CHECK CONSTRAINT [FK_dbo.Bet_dbo.PK_PKId]
GO
ALTER TABLE [dbo].[Bet]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bet_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Bet] CHECK CONSTRAINT [FK_dbo.Bet_dbo.User_UserId]
GO
ALTER TABLE [dbo].[BetItem]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BetItem_dbo.Bet_BetId] FOREIGN KEY([BetId])
REFERENCES [dbo].[Bet] ([BetId])
GO
ALTER TABLE [dbo].[BetItem] CHECK CONSTRAINT [FK_dbo.BetItem_dbo.Bet_BetId]
GO
ALTER TABLE [dbo].[PKBonus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PKBonus_dbo.PK_PKId] FOREIGN KEY([PKId])
REFERENCES [dbo].[PK] ([PKId])
GO
ALTER TABLE [dbo].[PKBonus] CHECK CONSTRAINT [FK_dbo.PKBonus_dbo.PK_PKId]
GO
ALTER TABLE [dbo].[PKBonus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PKBonus_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[PKBonus] CHECK CONSTRAINT [FK_dbo.PKBonus_dbo.User_UserId]
GO
ALTER TABLE [dbo].[PKRate]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PKRate_dbo.PK_PKId] FOREIGN KEY([PKId])
REFERENCES [dbo].[PK] ([PKId])
GO
ALTER TABLE [dbo].[PKRate] CHECK CONSTRAINT [FK_dbo.PKRate_dbo.PK_PKId]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Post_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_dbo.Post_dbo.User_UserId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_dbo.User_dbo.User_ParentUserId] FOREIGN KEY([ParentUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_dbo.User_dbo.User_ParentUserId]
GO
ALTER TABLE [dbo].[UserExtend]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserExtend_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserExtend] CHECK CONSTRAINT [FK_dbo.UserExtend_dbo.User_UserId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRole_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_dbo.UserRole_dbo.User_UserId]
GO
