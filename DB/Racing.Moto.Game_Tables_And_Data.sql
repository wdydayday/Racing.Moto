USE [Racing.Moto.Game]
GO
/****** Object:  Table [dbo].[AppConfig]    Script Date: 2017/7/31 15:22:20 ******/
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
/****** Object:  Table [dbo].[PK]    Script Date: 2017/7/31 15:22:20 ******/
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
	[IsRanked] [bit] NOT NULL DEFAULT ((0)),
	[IsBonused] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.PK] PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PKBonus]    Script Date: 2017/7/31 15:22:20 ******/
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
	[PKRoomDeskId] [int] NOT NULL,
	[PKRoomId] [int] NOT NULL,
	[PKId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PKBonus] PRIMARY KEY CLUSTERED 
(
	[PKBonusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PKRoom]    Script Date: 2017/7/31 15:22:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PKRoom](
	[PKRoomId] [int] IDENTITY(1,1) NOT NULL,
	[PKRoomLevel] [int] NOT NULL,
	[PKId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PKRoom] PRIMARY KEY CLUSTERED 
(
	[PKRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PKRoomDesk]    Script Date: 2017/7/31 15:22:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PKRoomDesk](
	[PKRoomDeskId] [int] IDENTITY(1,1) NOT NULL,
	[DeskNo] [int] NOT NULL,
	[Ranks] [nvarchar](100) NULL,
	[PKRoomId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PKRoomDesk] PRIMARY KEY CLUSTERED 
(
	[PKRoomDeskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2017/7/31 15:22:20 ******/
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
	[Amount] [decimal](18, 4) NOT NULL,
	[ParentUserId] [int] NULL,
	[Avatar] [nvarchar](300) NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[PKBonus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PKBonus_dbo.PKRoomDesk_PKRoomDeskId] FOREIGN KEY([PKRoomDeskId])
REFERENCES [dbo].[PKRoomDesk] ([PKRoomDeskId])
GO
ALTER TABLE [dbo].[PKBonus] CHECK CONSTRAINT [FK_dbo.PKBonus_dbo.PKRoomDesk_PKRoomDeskId]
GO
ALTER TABLE [dbo].[PKBonus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PKBonus_dbo.User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[PKBonus] CHECK CONSTRAINT [FK_dbo.PKBonus_dbo.User_UserId]
GO
ALTER TABLE [dbo].[PKRoom]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PKRoom_dbo.PK_PKId] FOREIGN KEY([PKId])
REFERENCES [dbo].[PK] ([PKId])
GO
ALTER TABLE [dbo].[PKRoom] CHECK CONSTRAINT [FK_dbo.PKRoom_dbo.PK_PKId]
GO
ALTER TABLE [dbo].[PKRoomDesk]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PKRoomDesk_dbo.PKRoom_PKRoomId] FOREIGN KEY([PKRoomId])
REFERENCES [dbo].[PKRoom] ([PKRoomId])
GO
ALTER TABLE [dbo].[PKRoomDesk] CHECK CONSTRAINT [FK_dbo.PKRoomDesk_dbo.PKRoom_PKRoomId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_dbo.User_dbo.User_ParentUserId] FOREIGN KEY([ParentUserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_dbo.User_dbo.User_ParentUserId]
GO
/****** Object:  StoredProcedure [dbo].[SP_PK_GeneratePK]    Script Date: 2017/7/31 15:22:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery4.sql|7|0|C:\Users\Dev\AppData\Local\Temp\~vsE12.sql
/* =============================================
-- Description:	生成PK
   exec [dbo].[SP_PK_GeneratePK]
-- ============================================= */
CREATE PROCEDURE [dbo].[SP_PK_GeneratePK]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Now DATETIME
	SET @Now = GETDATE()


    -- check PK exist or not
	IF(EXISTS(SELECT 1 FROM [dbo].[PK] WHERE DATEDIFF(s, @Now, BeginTime) < 0 AND DATEDIFF(s, @Now, EndTime) > 0))
		BEGIN
			SELECT * FROM [dbo].[PK] WHERE DATEDIFF(s, @Now, BeginTime) < 0 AND DATEDIFF(s, @Now, EndTime) > 0
			RETURN;
		END

	-- insert new pk
	DECLARE @PKId INT,
			@Total_Seconds INT,
			@Opening_Seconds INT,
			@Close_Seconds INT,
			@Game_Seconds INT,
			@Lottery_Seconds INT,
			@End_Time DATETIME
	SELECT @Opening_Seconds = CAST([Value] AS INT) FROM [dbo].[AppConfig] WHERE [Name] = 'Racing_Opening_Seconds'
	SELECT @Close_Seconds = CAST([Value] AS INT) FROM [dbo].[AppConfig] WHERE [Name] = 'Racing_Close_Seconds'
	SELECT @Game_Seconds = CAST([Value] AS INT) FROM [dbo].[AppConfig] WHERE [Name] = 'Racing_Game_Seconds'
	SELECT @Lottery_Seconds = CAST([Value] AS INT) FROM [dbo].[AppConfig] WHERE [Name] = 'Racing_Lottery_Seconds'
	SELECT @Total_Seconds = @Opening_Seconds + @Close_Seconds + @Game_Seconds + @Lottery_Seconds
	SELECT @End_Time = DATEADD(second, @Total_Seconds, @Now)

	INSERT INTO [dbo].[PK] ([BeginTime],[EndTime],[CreateTime],[OpeningSeconds],[CloseSeconds],[GameSeconds],[LotterySeconds],[IsRanked]) 
	VALUES (@Now, @End_Time, @Now, @Opening_Seconds, @Close_Seconds, @Game_Seconds, @Lottery_Seconds, 0)
	
	SET @PKId=@@IDENTITY
	SELECT * FROM [dbo].[PK] WHERE PKId = @PKId

	--PKRoom
	DECLARE @PKRoomId INT
	DECLARE @RoomCount INT, @RoomIndex INT
	DECLARE @DeskCount INT, @DeskIndex INT
	SET @RoomCount = 3; SET @RoomIndex = 1
	SET @DeskCount = 8; SET @DeskIndex = 1
	WHILE(@RoomIndex <= @RoomCount)
		BEGIN
			INSERT INTO [dbo].[PKRoom] (PKRoomLevel, PKId) VALUES (@RoomIndex, @PKId)

			SET @PKRoomId=@@IDENTITY

			--PKRoomDesk
			SET @DeskIndex = 1;
			WHILE(@DeskIndex <= @DeskCount)
				BEGIN				
					INSERT INTO [dbo].[PKRoomDesk] (DeskNo, PKRoomId) VALUES (@DeskIndex, @PKRoomId)	

					SET @DeskIndex = @DeskIndex + 1;		
				END
			
			SET @RoomIndex = @RoomIndex + 1;

		END

END

GO


SET IDENTITY_INSERT [dbo].[AppConfig] ON 

GO
INSERT [dbo].[AppConfig] ([AppConfigId], [Name], [Value]) VALUES (1, N'Racing_Opening_Seconds', N'480')
GO
INSERT [dbo].[AppConfig] ([AppConfigId], [Name], [Value]) VALUES (2, N'Racing_Close_Seconds', N'50')
GO
INSERT [dbo].[AppConfig] ([AppConfigId], [Name], [Value]) VALUES (3, N'Racing_Game_Seconds', N'60')
GO
INSERT [dbo].[AppConfig] ([AppConfigId], [Name], [Value]) VALUES (4, N'Racing_Lottery_Seconds', N'10')
GO
SET IDENTITY_INSERT [dbo].[AppConfig] OFF
GO
