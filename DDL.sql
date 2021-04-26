CREATE TABLE [dbo].[cars_test](
	[Make] [VARCHAR](20) COLLATE Czech_CI_AS NOT NULL,
	[Model] [VARCHAR](30) COLLATE Czech_CI_AS NOT NULL,
	[Model Type] [VARCHAR](30) COLLATE Czech_CI_AS NOT NULL,
	[Tachometer Km] [FLOAT] NULL,
	[Selling Price] [INT] NULL,
	[Buying Date] [DATETIME] NOT NULL,
	[sold_date] [DATETIME] NULL
);

CREATE TABLE [dbo].[calendar_test](
	[date] [DATETIME] NULL,
	[FinYear] [INT] NULL,
	[FinWeek] [INT] NULL,
	[YearNum] [INT] NULL,
	[MonthNum] [INT] NULL
);

CREATE TABLE [dbo].[km_range_test](
	[KM_from] [INT] NULL,
	[KM_to] [INT] NULL,
	[KM range] [NVARCHAR](20) COLLATE Czech_CI_AS NULL,
	[KmRangeId] [INT] NULL
);

CREATE TABLE [dbo].[price_range_test](
	[Index] [INT] NULL,
	[Range] [NVARCHAR](50) COLLATE Czech_CI_AS NULL,
	[Min] [NUMERIC](38, 20) NULL,
	[Max] [NUMERIC](38, 20) NULL
);