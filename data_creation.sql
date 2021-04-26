DROP TABLE IF EXISTS #prep

;WITH a AS (
SELECT
	[Car No],
	[Make],
	[Model],
	[Model Type],
	[Tachometer Km],
	[Selling Price],
	[Buying Date],
	CASE WHEN [Sold date]<'1900-01-01' THEN NULL ELSE [Sold date] END AS sold_date,
	ROW_NUMBER()OVER(PARTITION BY [Buying Date] ORDER BY [Car No]) AS rn
FROM [dbo].[online_CarTracking] 
WHERE [Buying Date] >='2019-01-01' AND [Buy Country] = 'CZ'
)
SELECT * 
INTO #prep
FROM [a]
WHERE [a].[rn] <= 25;

SELECT 
	[Make], 
	[Model],
	[Model Type], 
	CAST([Tachometer Km]/10000 AS FLOAT)*10000 AS [Tachometer Km], 
	(CAST([Selling Price]+10000 AS int)/10000 )*10000 AS [Selling Price], 
	[Buying Date], 
	[sold_date]
INTO [analytics_sandbox].[dbo].cars_test
FROM [#prep]

SELECT 
	[date],
	[FinYear],
	[FinWeek],
	[YearNum],
	[MonthNum]
INTO [analytics_sandbox].[dbo].calendar_test
FROM [dbo].[calendar]

SELECT 
	[Index], [Range], [Min], [Max]
INTO [analytics_sandbox].[dbo].price_range_test
FROM [dbo].[ctrl_funnel_PriceRange]
WHERE [Country] = 'CZ'

SELECT [KM_from], [KM_to], [KM range], [KmRangeId]
INTO [analytics_sandbox].[dbo].km_range_test
FROM [dbo].[RT_DM2_KMrange]
WHERE [Country] = 'CZ'

