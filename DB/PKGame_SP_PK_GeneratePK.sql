USE [Racing.Moto.Game]
GO
/****** Object:  StoredProcedure [dbo].[SP_PK_GeneratePK]    Script Date: 2017/6/30 15:53:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery4.sql|7|0|C:\Users\Dev\AppData\Local\Temp\~vsE12.sql
/* =============================================
-- Description:	生成PK
   exec [dbo].[SP_PK_GeneratePK]
-- ============================================= */
ALTER PROCEDURE [dbo].[SP_PK_GeneratePK]
	
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
