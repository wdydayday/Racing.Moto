USE [Racing.Moto]
GO
/****** Object:  StoredProcedure [dbo].[SP_PK_GeneratePKRate]    Script Date: 2017/4/8 21:32:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
-- Description:	生成PK Rate
   exec [dbo].[SP_PK_GeneratePKRate] 1870
-- ============================================= */
ALTER PROCEDURE [dbo].[SP_PK_GeneratePKRate]
	@PKID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--SELECT * FROM [dbo].[PK] WHERE PKId = @PKId

	-- insert PKRate
	DECLARE @RateId INT,
			@Rank INT,
			@Rate1 DECIMAL(18,2),
			@Rate2 DECIMAL(18,2),
			@Rate3 DECIMAL(18,2),
			@Rate4 DECIMAL(18,2),
			@Rate5 DECIMAL(18,2),
			@Rate6 DECIMAL(18,2),
			@Rate7 DECIMAL(18,2),
			@Rate8 DECIMAL(18,2),
			@Rate9 DECIMAL(18,2),
			@Rate10 DECIMAL(18,2),
			@Rate11 DECIMAL(18,2),
			@Rate12 DECIMAL(18,2),
			@Rate13 DECIMAL(18,2),
			@Rate14 DECIMAL(18,2)

	SELECT  DealFlg = 0,
			RateId, [Rank],
			Rate1, Rate2, Rate3, Rate4, Rate5, 
			Rate6, Rate7, Rate8, Rate9, Rate10, 
			Big, Small, Odd, Even
	INTO #Temp_Rate
	FROM [dbo].[Rate]
	WHERE [RateType] = 0

	SELECT @RateId = MIN(RateId) FROM #Temp_Rate WHERE DealFlg = 0
	WHILE @RateId IS NOT NULL
		BEGIN
			SELECT  @Rank = [Rank],
					@Rate1 = Rate1,
					@Rate2 = Rate2,
					@Rate3 = Rate3,
					@Rate4 = Rate4,
					@Rate5 = Rate5,
					@Rate6 = Rate6,
					@Rate7 = Rate7,
					@Rate8 = Rate8,
					@Rate9 = Rate9,
					@Rate10 = Rate10,
					@Rate11 = Big,
					@Rate12 = Small,
					@Rate13 = Odd,
					@Rate14 = Even
			FROM #Temp_Rate WHERE RateId = @RateId

			-- insert into PKRate
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 1, @Rate1)
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 2, @Rate2)
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 3, @Rate3)
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 4, @Rate4)
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 5, @Rate5)
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 6, @Rate6)
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 7, @Rate7)
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 8, @Rate8)
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 9, @Rate9)
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 10, @Rate10)
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 11, @Rate11)
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 12, @Rate12)
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 13, @Rate13)
			INSERT INTO [dbo].[PKRate] ([PKId], [Rank], [Num], [Rate]) VALUES (@PKId, @Rank, 14, @Rate14)

			-- update DealFlg
			UPDATE #Temp_Rate SET DealFlg = 1 WHERE RateId = @RateId

			-- get next row
			SELECT @RateId = MIN(RateId) FROM #Temp_Rate WHERE DealFlg = 0 AND RateId > @RateId
		END

END
