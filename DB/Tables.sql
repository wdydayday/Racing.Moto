USE [Racing.Moto]
GO
/****** Object:  Table [dbo].[AppConfig]    Script Date: 2017/7/31 15:18:08 ******/
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
/****** Object:  Table [dbo].[Bet]    Script Date: 2017/7/31 15:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bet](
	[BetId] [int] IDENTITY(1,1) NOT NULL,
	[Rank] [int] NOT NULL,
	[Num] [int] NOT NULL,
	[Amount] [decimal](18, 4) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[PKId] [int] NOT NULL,
	[IsSettlementDone] [bit] NOT NULL DEFAULT ((0)),
	[AgentUserId] [int] NULL,
	[GeneralAgentUserId] [int] NULL,
 CONSTRAINT [PK_dbo.Bet] PRIMARY KEY CLUSTERED 
(
	[BetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BetItem]    Script Date: 2017/7/31 15:18:08 ******/
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
	[OrderNo] [bigint] NULL,
	[IsSynced] [bit] NULL,
 CONSTRAINT [PK_dbo.BetItem] PRIMARY KEY CLUSTERED 
(
	[BetItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoginLog]    Script Date: 2017/7/31 15:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginLog](
	[LoginLogId] [int] IDENTITY(1,1) NOT NULL,
	[IP] [nvarchar](20) NULL,
	[Address] [nvarchar](100) NULL,
	[LoginTime] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.LoginLog] PRIMARY KEY CLUSTERED 
(
	[LoginLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2017/7/31 15:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](300) NULL,
	[MenuUrl] [nvarchar](300) NULL,
	[DisplayOrder] [int] NOT NULL,
	[Visible] [bit] NOT NULL,
	[ParentMenuId] [int] NULL,
 CONSTRAINT [PK_dbo.Menu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuRole]    Script Date: 2017/7/31 15:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuRole](
	[MenuRoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.MenuRole] PRIMARY KEY CLUSTERED 
(
	[MenuRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PK]    Script Date: 2017/7/31 15:18:08 ******/
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
	[IsRebated] [bit] NOT NULL,
	[IsRanksSynced] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PK] PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PKBonus]    Script Date: 2017/7/31 15:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PKBonus](
	[PKBonusId] [int] IDENTITY(1,1) NOT NULL,
	[Rank] [int] NOT NULL,
	[Num] [int] NOT NULL,
	[Amount] [decimal](18, 4) NOT NULL,
	[BonusType] [tinyint] NOT NULL,
	[IsSettlementDone] [bit] NOT NULL,
	[BetId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[PKId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PKBonus] PRIMARY KEY CLUSTERED 
(
	[PKBonusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PKLog]    Script Date: 2017/7/31 15:18:08 ******/
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
/****** Object:  Table [dbo].[PKRate]    Script Date: 2017/7/31 15:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PKRate](
	[PKRateId] [int] IDENTITY(1,1) NOT NULL,
	[Rank] [int] NOT NULL,
	[Num] [int] NOT NULL,
	[Rate] [decimal](18, 4) NOT NULL,
	[PKId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PKRate] PRIMARY KEY CLUSTERED 
(
	[PKRateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 2017/7/31 15:18:08 ******/
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
/****** Object:  Table [dbo].[Rate]    Script Date: 2017/7/31 15:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[RateId] [int] IDENTITY(1,1) NOT NULL,
	[RateType] [tinyint] NOT NULL,
	[Rank] [int] NOT NULL,
	[Rate1] [decimal](18, 4) NOT NULL,
	[Rate2] [decimal](18, 4) NOT NULL,
	[Rate3] [decimal](18, 4) NOT NULL,
	[Rate4] [decimal](18, 4) NOT NULL,
	[Rate5] [decimal](18, 4) NOT NULL,
	[Rate6] [decimal](18, 4) NOT NULL,
	[Rate7] [decimal](18, 4) NOT NULL,
	[Rate8] [decimal](18, 4) NOT NULL,
	[Rate9] [decimal](18, 4) NOT NULL,
	[Rate10] [decimal](18, 4) NOT NULL,
	[Big] [decimal](18, 4) NOT NULL,
	[Small] [decimal](18, 4) NOT NULL,
	[Odd] [decimal](18, 4) NOT NULL,
	[Even] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_dbo.Rate] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 2017/7/31 15:18:08 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2017/7/31 15:18:08 ******/
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
	[DefaultRebateType] [tinyint] NOT NULL,
	[ParentUserId] [int] NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserExtension]    Script Date: 2017/7/31 15:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserExtension](
	[UserId] [int] NOT NULL,
	[Amount] [decimal](18, 4) NOT NULL,
	[AgentCount] [int] NOT NULL,
	[MemberCount] [int] NOT NULL,
	[AgentUserId] [int] NULL,
	[GeneralAgentUserId] [int] NULL,
	[ValidateCodeForForgetPwd] [varchar](10) NULL,
	[ValidateCodeCreateDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.UserExtension] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRebate]    Script Date: 2017/7/31 15:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRebate](
	[UserRebateId] [int] IDENTITY(1,1) NOT NULL,
	[RebateNo] [int] NOT NULL,
	[MaxPKAmount] [decimal](18, 4) NOT NULL,
	[MaxBetAmount] [decimal](18, 4) NOT NULL,
	[RebateTypeA] [decimal](18, 4) NOT NULL,
	[RebateTypeB] [decimal](18, 4) NOT NULL,
	[RebateTypeC] [decimal](18, 4) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UserRebate] PRIMARY KEY CLUSTERED 
(
	[UserRebateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2017/7/31 15:18:08 ******/
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
ALTER TABLE [dbo].[LoginLog]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LoginLog_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[LoginLog] CHECK CONSTRAINT [FK_dbo.LoginLog_dbo.User_UserId]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Menu_dbo.Menu_ParentMenuId] FOREIGN KEY([ParentMenuId])
REFERENCES [dbo].[Menu] ([MenuId])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_dbo.Menu_dbo.Menu_ParentMenuId]
GO
ALTER TABLE [dbo].[MenuRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MenuRole_dbo.Menu_MenuId] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([MenuId])
GO
ALTER TABLE [dbo].[MenuRole] CHECK CONSTRAINT [FK_dbo.MenuRole_dbo.Menu_MenuId]
GO
ALTER TABLE [dbo].[MenuRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MenuRole_dbo.Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[MenuRole] CHECK CONSTRAINT [FK_dbo.MenuRole_dbo.Role_RoleId]
GO
ALTER TABLE [dbo].[PKBonus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PKBonus_dbo.Bet_BetId] FOREIGN KEY([BetId])
REFERENCES [dbo].[Bet] ([BetId])
GO
ALTER TABLE [dbo].[PKBonus] CHECK CONSTRAINT [FK_dbo.PKBonus_dbo.Bet_BetId]
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
ALTER TABLE [dbo].[UserExtension]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserExtension_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserExtension] CHECK CONSTRAINT [FK_dbo.UserExtension_dbo.User_UserId]
GO
ALTER TABLE [dbo].[UserRebate]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRebate_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRebate] CHECK CONSTRAINT [FK_dbo.UserRebate_dbo.User_UserId]
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
