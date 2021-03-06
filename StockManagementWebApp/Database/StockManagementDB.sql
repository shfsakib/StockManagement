USE [StockManagementDB]
GO
/****** Object:  Table [dbo].[CategoryInfo]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryInfo](
	[Sl] [int] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[InTime] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CatagoryInfo] PRIMARY KEY CLUSTERED 
(
	[Sl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyInfo]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyInfo](
	[Sl] [int] NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[InTime] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CompanyInfo] PRIMARY KEY CLUSTERED 
(
	[Sl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[InTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemSetup]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemSetup](
	[Sl] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[CompanyId] [int] NULL,
	[ItemName] [varchar](50) NULL,
	[ReorderLevel] [nvarchar](50) NOT NULL,
	[InTime] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ItemSetup] PRIMARY KEY CLUSTERED 
(
	[Sl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogIn]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogIn](
	[Sl] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[SecurityQuestion] [varchar](50) NOT NULL,
	[Answer] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LogIn] PRIMARY KEY CLUSTERED 
(
	[Sl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockInOut]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockInOut](
	[Sl] [int] IDENTITY(1,1) NOT NULL,
	[ItemSl] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[InTime] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StockIn] PRIMARY KEY CLUSTERED 
(
	[Sl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CategoryInfo] ([Sl], [CategoryName], [InTime]) VALUES (1, N'Stationary', N'02-08-2018')
INSERT [dbo].[CategoryInfo] ([Sl], [CategoryName], [InTime]) VALUES (2, N'Mobile', N'02-08-2018')
INSERT [dbo].[CategoryInfo] ([Sl], [CategoryName], [InTime]) VALUES (3, N'Accessory', N'02-08-2018')
INSERT [dbo].[CategoryInfo] ([Sl], [CategoryName], [InTime]) VALUES (4, N'Cosmetics', N'02-08-2018')
INSERT [dbo].[CategoryInfo] ([Sl], [CategoryName], [InTime]) VALUES (5, N'Foods', N'02-08-2018')
INSERT [dbo].[CategoryInfo] ([Sl], [CategoryName], [InTime]) VALUES (6, N'Electronics', N'02-08-2018')
INSERT [dbo].[CategoryInfo] ([Sl], [CategoryName], [InTime]) VALUES (7, N'Books', N'05-08-2018')
INSERT [dbo].[CategoryInfo] ([Sl], [CategoryName], [InTime]) VALUES (8, N'Shoes', N'08-06-2018')
INSERT [dbo].[CategoryInfo] ([Sl], [CategoryName], [InTime]) VALUES (9, N'Computer Hardware parts', N'08-28-2018')
INSERT [dbo].[CompanyInfo] ([Sl], [CompanyName], [InTime]) VALUES (1, N'Unilever', N'02-08-2018')
INSERT [dbo].[CompanyInfo] ([Sl], [CompanyName], [InTime]) VALUES (2, N'BD Food', N'02-08-2018')
INSERT [dbo].[CompanyInfo] ([Sl], [CompanyName], [InTime]) VALUES (3, N'Walton', N'02-08-2018')
INSERT [dbo].[CompanyInfo] ([Sl], [CompanyName], [InTime]) VALUES (4, N'Nova', N'02-08-2018')
INSERT [dbo].[CompanyInfo] ([Sl], [CompanyName], [InTime]) VALUES (5, N'Nokia', N'02-08-2018')
INSERT [dbo].[CompanyInfo] ([Sl], [CompanyName], [InTime]) VALUES (6, N'RFL', N'02-08-2018')
INSERT [dbo].[CompanyInfo] ([Sl], [CompanyName], [InTime]) VALUES (7, N'Tp-Link', N'08-28-2018')
SET IDENTITY_INSERT [dbo].[ItemSetup] ON 

INSERT [dbo].[ItemSetup] ([Sl], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [InTime]) VALUES (1, 1, 1, N'Matador', N'0', N'08-15-2018')
INSERT [dbo].[ItemSetup] ([Sl], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [InTime]) VALUES (2, 1, 1, N'Fair and lovely', N'0', N'08-15-2018')
INSERT [dbo].[ItemSetup] ([Sl], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [InTime]) VALUES (3, 1, 1, N'Rin', N'0', N'08-15-2018')
INSERT [dbo].[ItemSetup] ([Sl], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [InTime]) VALUES (4, 1, 2, N'Chanachur', N'0', N'08-15-2018')
INSERT [dbo].[ItemSetup] ([Sl], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [InTime]) VALUES (5, 1, 2, N'Juice', N'0', N'08-15-2018')
INSERT [dbo].[ItemSetup] ([Sl], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [InTime]) VALUES (6, 6, 5, N'Nokia 6', N'0', N'08-15-2018')
INSERT [dbo].[ItemSetup] ([Sl], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [InTime]) VALUES (7, 6, 5, N'Nokia 7', N'0', N'08-15-2018')
INSERT [dbo].[ItemSetup] ([Sl], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [InTime]) VALUES (8, 5, 2, N'Tiffin Cake', N'0', N'08-24-2018')
INSERT [dbo].[ItemSetup] ([Sl], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [InTime]) VALUES (9, 2, 3, N'E69', N'0', N'08-26-2018')
INSERT [dbo].[ItemSetup] ([Sl], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [InTime]) VALUES (24, 9, 7, N'2 Antenna Routers', N'0', N'08-28-2018')
SET IDENTITY_INSERT [dbo].[ItemSetup] OFF
SET IDENTITY_INSERT [dbo].[LogIn] ON 

INSERT [dbo].[LogIn] ([Sl], [Name], [Email], [Password], [SecurityQuestion], [Answer]) VALUES (1, N'Sakib', N'shfsakib@gmail.com', N'123', N'What is your nickname?', N'fahim')
INSERT [dbo].[LogIn] ([Sl], [Name], [Email], [Password], [SecurityQuestion], [Answer]) VALUES (4, N'Jobair', N'jobair@gmail.com', N'123', N'What is your pet name?', N'tom')
INSERT [dbo].[LogIn] ([Sl], [Name], [Email], [Password], [SecurityQuestion], [Answer]) VALUES (5, N'Fahad', N'fahad@gmail.com', N'123', N'Where do you live?', N'ctg')
SET IDENTITY_INSERT [dbo].[LogIn] OFF
SET IDENTITY_INSERT [dbo].[StockInOut] ON 

INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (1, 1, 100, N'Buy', N'08-15-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (2, 2, 50, N'Buy', N'08-15-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (3, 3, 50, N'Buy', N'08-15-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (4, 4, 30, N'Buy', N'08-15-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (5, 5, 108, N'Buy', N'08-15-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (6, 2, 10, N'Buy', N'08-23-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (7, 8, 20, N'Buy', N'08-24-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (8, 6, 100, N'Buy', N'08-26-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (9, 6, 2, N'Buy', N'08-26-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (10, 6, 8, N'Buy', N'08-26-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (11, 2, 4, N'Sale', N'08-26-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (12, 1, 5, N'Sale', N'08-26-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (13, 6, 1, N'Sale', N'08-26-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (14, 7, 50, N'Buy', N'08-26-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (15, 1, 2, N'Sale', N'08-27-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (16, 2, 1, N'Damage', N'08-27-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (17, 5, 2, N'Loss', N'08-27-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (18, 6, 4, N'Damage', N'08-27-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (19, 6, 1, N'Loss', N'08-27-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (20, 2, 2, N'Sale', N'08-27-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (21, 1, 5, N'Sale', N'08-27-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (22, 24, 50, N'Buy', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (23, 24, 4, N'Sale', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (24, 1, 3, N'Sale', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (25, 8, 2, N'Sale', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (26, 1, 2, N'Sale', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (27, 5, 1, N'Loss', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (28, 7, 1, N'Sale', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (29, 8, 1, N'Sale', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (30, 6, 1, N'Damage', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (31, 24, 1, N'Damage', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (32, 7, 1, N'Loss', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (33, 5, 1, N'Loss', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (34, 5, 2, N'Sale', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (35, 1, 1, N'Loss', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (36, 6, 2, N'Loss', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (37, 8, 1, N'Loss', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (38, 7, 3, N'Loss', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (39, 1, 2, N'Loss', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (40, 2, 3, N'Damage', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (41, 6, 1, N'Loss', N'08-28-2018')
INSERT [dbo].[StockInOut] ([Sl], [ItemSl], [Quantity], [Type], [InTime]) VALUES (42, 1, 1, N'Loss', N'08-28-2018')
SET IDENTITY_INSERT [dbo].[StockInOut] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CompanyInfo]    Script Date: 4/25/2020 10:21:27 PM ******/
ALTER TABLE [dbo].[CompanyInfo] ADD  CONSTRAINT [IX_CompanyInfo] UNIQUE NONCLUSTERED 
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ItemSetup]  WITH CHECK ADD  CONSTRAINT [FK_ItemSetup_CategoryInfo] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CategoryInfo] ([Sl])
GO
ALTER TABLE [dbo].[ItemSetup] CHECK CONSTRAINT [FK_ItemSetup_CategoryInfo]
GO
ALTER TABLE [dbo].[ItemSetup]  WITH CHECK ADD  CONSTRAINT [FK_ItemSetup_CompanyInfo] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyInfo] ([Sl])
GO
ALTER TABLE [dbo].[ItemSetup] CHECK CONSTRAINT [FK_ItemSetup_CompanyInfo]
GO
ALTER TABLE [dbo].[StockInOut]  WITH CHECK ADD  CONSTRAINT [FK_StockInOut_ItemSetup] FOREIGN KEY([ItemSl])
REFERENCES [dbo].[ItemSetup] ([Sl])
GO
ALTER TABLE [dbo].[StockInOut] CHECK CONSTRAINT [FK_StockInOut_ItemSetup]
GO
/****** Object:  StoredProcedure [dbo].[caseSensative]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[caseSensative]
                @email varchar(50),
 @password varchar(50)
AS
BEGIN
                select Email from LogIn
                where
                 [Password] COLLATE Latin1_general_CS_AS=@password 
END


GO
/****** Object:  StoredProcedure [dbo].[CompanyByIdProcedure]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CompanyByIdProcedure] 
As
BEGIN

SELECT    distinct   ItemSetup.CompanyId,  CompanyInfo.CompanyName
FROM            StockInOut INNER JOIN
                         ItemSetup ON StockInOut.ItemSl = ItemSetup.Sl  INNER JOIN
                         CompanyInfo ON ItemSetup.CompanyId = CompanyInfo.Sl AND Type='Buy'
		
						 End


GO
/****** Object:  StoredProcedure [dbo].[GETALLITEMBYCOMPANY]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETALLITEMBYCOMPANY]
@company int

AS BEGIN



SELECT    DISTINCT    StockInOut.ItemSl,StockInOut.Type,  ItemSetup.CompanyId, ItemSetup.ItemName
FROM            StockInOut INNER JOIN
                         ItemSetup ON StockInOut.ItemSl = ItemSetup.Sl AND Type='Buy' AND CompanyId=@company 
						 END

GO
/****** Object:  StoredProcedure [dbo].[GETREORDERBYITEMCOMPANY]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETREORDERBYITEMCOMPANY]
@company int,
@item int
AS BEGIN



SELECT     DISTINCT   ItemSetup.CompanyId,  CompanyInfo.CompanyName,StockInOut.ItemSl,ItemSetup.ItemName,ItemSetup.ReorderLevel,  StockInOut.InTime
FROM            StockInOut INNER JOIN
                         ItemSetup ON StockInOut.ItemSl = @item INNER JOIN
                         CompanyInfo ON ItemSetup.CompanyId =@company AND Type='Buy'

						 END

GO
/****** Object:  StoredProcedure [dbo].[INSERTALLROWFORSALEDAMAGELOSS]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTALLROWFORSALEDAMAGELOSS]

@item int,

@quantity int,
@type varchar(6),
@inTime varchar(50)

AS
BEGIN
INSERT INTO StockInOut( ItemSl, Quantity, Type, InTime) values(@item,@quantity,@type,@inTime)

END




GO
/****** Object:  StoredProcedure [dbo].[SalesBetweenTwoDates]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SalesBetweenTwoDates]
@fromDate datetime,
@toDate datetime,
@type varchar(6)

As BEGIN

SELECT   DISTINCT     StockInOut.ItemSl, StockInOut.Quantity, StockInOut.InTime, StockInOut.Type, ItemSetup.CompanyId, ItemSetup.ItemName,CompanyInfo.CompanyName
FROM            StockInOut INNER JOIN
                         ItemSetup ON StockInOut.ItemSl = ItemSetup.Sl INNER JOIN
						 CompanyInfo ON ItemSetup.CompanyId=CompanyInfo.Sl  AND Type=@type
AND StockInOut.InTime BETWEEN @fromDate AND @toDate

End

GO
/****** Object:  StoredProcedure [dbo].[TotalStock]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TotalStock]
@item int

AS


SELECT SUM(BQTY)-(SUM(SQTY)+SUM(DMGQTY)+SUM(LOSSQTY)) Quantity FROM (
SELECT SUM(Quantity) BQTY,0 SQTY,0 DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Buy' AND ItemSl=@item 
UNION
SELECT 0 BQTY,SUM(Quantity) SQTY,0 DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Sale' AND ItemSl=@item 
UNION
SELECT 0 BQTY,0 SQTY,SUM(Quantity) DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Damage' AND ItemSl=@item 
UNION
SELECT 0 BQTY,0 SQTY,0 DMGQTY,SUM(Quantity) LOSSQTY  FROM StockInOut WHERE Type='Loss' AND ItemSl=@item 
) A

GO
/****** Object:  StoredProcedure [dbo].[VIEWALLCATEGORY]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIEWALLCATEGORY]


AS BEGIN


SELECT    DISTINCT     ItemSetup.CategoryId,  ItemSetup.ReorderLevel, CategoryInfo.CategoryName

FROM            StockInOut INNER JOIN
                         ItemSetup ON StockInOut.ItemSl = ItemSetup.Sl INNER JOIN
                         CompanyInfo ON ItemSetup.CompanyId = CompanyInfo.Sl INNER JOIN
                         CategoryInfo ON ItemSetup.CategoryId = CategoryInfo.Sl AND Type='Buy'
						 END

GO
/****** Object:  StoredProcedure [dbo].[VIEWALLCOMPANY]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIEWALLCOMPANY]
AS BEGIN
SELECT    DISTINCT     ItemSetup.CompanyId, 
                      CompanyInfo.CompanyName
FROM            StockInOut INNER JOIN
                         ItemSetup ON StockInOut.ItemSl = ItemSetup.Sl INNER JOIN
                         CompanyInfo ON ItemSetup.CompanyId = CompanyInfo.Sl INNER JOIN
                         CategoryInfo ON ItemSetup.CategoryId = CategoryInfo.Sl AND Type='Buy'
						 END

GO
/****** Object:  StoredProcedure [dbo].[VIEWANDSEARCHITEMFORALL]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIEWANDSEARCHITEMFORALL]


AS BEGIN

SELECT *,(SELECT SUM(BQTY)-(SUM(SQTY)+SUM(DMGQTY)+SUM(LOSSQTY)) Quantity FROM (
SELECT SUM(Quantity) BQTY,0 SQTY,0 DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Buy' AND ITEMSL=X.Sl 
UNION
SELECT 0 BQTY,SUM(Quantity) SQTY,0 DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Sale' AND ITEMSL=X.Sl 
UNION
SELECT 0 BQTY,0 SQTY,SUM(Quantity) DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Damage' AND ITEMSL=X.Sl 
UNION
SELECT 0 BQTY,0 SQTY,0 DMGQTY,SUM(Quantity) LOSSQTY  FROM StockInOut WHERE Type='Loss' AND ITEMSL=X.Sl 
) A ) AS QUANTITY FROM (
SELECT    DISTINCT    StockInOut.ItemSl,  StockInOut.Type, ItemSetup.CategoryId, ItemSetup.CompanyId, ItemSetup.ItemName, ItemSetup.ReorderLevel, ItemSetup.Sl, CategoryInfo.CategoryName, 
                      CompanyInfo.CompanyName
FROM            StockInOut INNER JOIN
                         ItemSetup ON StockInOut.ItemSl = ItemSetup.Sl INNER JOIN
                         CompanyInfo ON ItemSetup.CompanyId = CompanyInfo.Sl INNER JOIN
                         CategoryInfo ON ItemSetup.CategoryId = CategoryInfo.Sl AND Type='Buy' ) X

 END

GO
/****** Object:  StoredProcedure [dbo].[VIEWANDSEARCHITEMFORCATEGORY]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIEWANDSEARCHITEMFORCATEGORY]
@category int

AS
BEGIN



SELECT * ,(SELECT SUM(BQTY)-(SUM(SQTY)+SUM(DMGQTY)+SUM(LOSSQTY)) Quantity FROM (
SELECT SUM(Quantity) BQTY,0 SQTY,0 DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Buy' AND ItemSl=X.Sl
UNION
SELECT 0 BQTY,SUM(Quantity) SQTY,0 DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Sale' AND ItemSl=X.Sl 
UNION
SELECT 0 BQTY,0 SQTY,SUM(Quantity) DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Damage' AND ItemSl=X.Sl 
UNION
SELECT 0 BQTY,0 SQTY,0 DMGQTY,SUM(Quantity) LOSSQTY  FROM StockInOut WHERE Type='Loss' AND ItemSl=X.Sl 
) A) AS QUANTITY FROM (
SELECT     DISTINCT   StockInOut.ItemSl,ItemSetup.CompanyId,ItemSetup.ReorderLevel, ItemSetup.ItemName, ItemSetup.CategoryId, CategoryInfo.CategoryName,ItemSetup.Sl,CompanyInfo.CompanyName
FROM            StockInOut INNER JOIN
                         ItemSetup ON StockInOut.ItemSl = ItemSetup.Sl INNER JOIN
						 CompanyInfo ON ItemSetup.CompanyId=CompanyInfo.Sl INNER JOIN
                         CategoryInfo ON ItemSetup.CategoryId = CategoryInfo.Sl AND Type='Buy' AND CategoryInfo.Sl=@category)X 

						 END

GO
/****** Object:  StoredProcedure [dbo].[VIEWANDSEARCHITEMFORCOMPANY]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIEWANDSEARCHITEMFORCOMPANY]
@company int

AS
BEGIN


SELECT * ,(SELECT SUM(BQTY)-(SUM(SQTY)+SUM(DMGQTY)+SUM(LOSSQTY)) Quantity FROM (
SELECT SUM(Quantity) BQTY,0 SQTY,0 DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Buy' AND ItemSl=X.Sl 
UNION
SELECT 0 BQTY,SUM(Quantity) SQTY,0 DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Sale' AND ItemSl=X.Sl 
UNION
SELECT 0 BQTY,0 SQTY,SUM(Quantity) DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Damage' AND ItemSl=X.Sl 
UNION
SELECT 0 BQTY,0 SQTY,0 DMGQTY,SUM(Quantity) LOSSQTY  FROM StockInOut WHERE Type='Loss' AND ItemSl=X.Sl 
) A) AS QUANTITY FROM (

SELECT   DISTINCT     StockInOut.ItemSl,  ItemSetup.CompanyId, ItemSetup.CategoryId,ItemSetup.Sl, ItemSetup.ItemName, ItemSetup.ReorderLevel, CompanyInfo.CompanyName 

FROM            StockInOut INNER JOIN
                         ItemSetup ON StockInOut.ItemSl = ItemSetup.Sl INNER JOIN
                         CompanyInfo ON ItemSetup.CompanyId = CompanyInfo.Sl 
                         AND Type='Buy' AND ItemSetup.CompanyId=@company)X 


						 END

GO
/****** Object:  StoredProcedure [dbo].[VIEWBYCOMPANYANDCATEGORY]    Script Date: 4/25/2020 10:21:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIEWBYCOMPANYANDCATEGORY]
@category int,
@company int

AS BEGIN




SELECT *,(SELECT SUM(BQTY)-(SUM(SQTY)+SUM(DMGQTY)+SUM(LOSSQTY)) Quantity FROM (
SELECT SUM(Quantity) BQTY,0 SQTY,0 DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Buy' AND ITEMSL=X.Sl 
UNION
SELECT 0 BQTY,SUM(Quantity) SQTY,0 DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Sale' AND ITEMSL=X.Sl 
UNION
SELECT 0 BQTY,0 SQTY,SUM(Quantity) DMGQTY,0 LOSSQTY  FROM StockInOut WHERE Type='Damage' AND ITEMSL=X.Sl 
UNION
SELECT 0 BQTY,0 SQTY,0 DMGQTY,SUM(Quantity) LOSSQTY  FROM StockInOut WHERE Type='Loss' AND ITEMSL=X.Sl 
) A ) AS QUANTITY FROM (
SELECT    DISTINCT    StockInOut.ItemSl,  StockInOut.Type, ItemSetup.CategoryId, ItemSetup.CompanyId, ItemSetup.ItemName, ItemSetup.ReorderLevel, ItemSetup.Sl, CategoryInfo.CategoryName, 
                      CompanyInfo.CompanyName
FROM            StockInOut INNER JOIN
                         ItemSetup ON StockInOut.ItemSl = ItemSetup.Sl INNER JOIN
                         CompanyInfo ON ItemSetup.CompanyId = CompanyInfo.Sl INNER JOIN
                         CategoryInfo ON ItemSetup.CategoryId = CategoryInfo.Sl AND Type='Buy' WHERE ItemSetup.CompanyId=@company AND ItemSetup.CategoryId=@category ) X

						 END

GO
