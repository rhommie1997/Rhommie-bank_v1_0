USE [RhommieBank]
GO
/****** Object:  Table [dbo].[bank]    Script Date: 1/8/2023 7:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bank](
	[bankCode] [char](3) NOT NULL,
	[bankName] [varchar](100) NOT NULL,
	[currency] [char](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bankCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[currency]    Script Date: 1/8/2023 7:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[currency](
	[currency] [char](3) NOT NULL,
	[currencyName] [varchar](35) NULL,
	[country] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[currency] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[currencyType]    Script Date: 1/8/2023 7:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[currencyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[description] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[person]    Script Date: 1/8/2023 7:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[age] [int] NULL,
	[created_by] [varchar](100) NULL,
	[created_dt] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rekening]    Script Date: 1/8/2023 7:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rekening](
	[no_rekening] [char](10) NOT NULL,
	[person_id] [int] NOT NULL,
	[saldo] [money] NULL,
	[bankCode] [char](3) NULL,
	[isAccess] [char](1) NULL,
	[created_dt] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[no_rekening] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tr_log_d]    Script Date: 1/8/2023 7:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tr_log_d](
	[id] [bigint] NOT NULL,
	[seq] [int] NOT NULL,
	[process_type] [char](1) NOT NULL,
	[process_message] [varchar](100) NOT NULL,
	[description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tr_log_h]    Script Date: 1/8/2023 7:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tr_log_h](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](30) NULL,
	[trFrom] [char](10) NOT NULL,
	[trTo] [char](10) NOT NULL,
	[menu] [varchar](40) NOT NULL,
	[trType] [varchar](40) NOT NULL,
	[currencyType] [int] NOT NULL,
	[amount] [money] NULL,
	[description] [varchar](100) NOT NULL,
	[trDate] [datetime] NOT NULL,
	[created_by] [varchar](100) NULL,
	[created_dt] [date] NULL,
	[totalAmount] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trType]    Script Date: 1/8/2023 7:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trType](
	[trTypeId] [varchar](40) NOT NULL,
	[charge] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[trTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 1/8/2023 7:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [varchar](30) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[isAdmin] [char](1) NOT NULL,
	[pictProfile] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[bank] ([bankCode], [bankName], [currency]) VALUES (N'002', N'Bank BRI', N'IDR')
INSERT [dbo].[bank] ([bankCode], [bankName], [currency]) VALUES (N'008', N'Bank Mandiri', N'IDR')
INSERT [dbo].[bank] ([bankCode], [bankName], [currency]) VALUES (N'009', N'Bank BNI', N'IDR')
INSERT [dbo].[bank] ([bankCode], [bankName], [currency]) VALUES (N'014', N'Bank BCA', N'IDR')
INSERT [dbo].[bank] ([bankCode], [bankName], [currency]) VALUES (N'601', N'TEST 001', N'GBP')
INSERT [dbo].[bank] ([bankCode], [bankName], [currency]) VALUES (N'901', N'Temp Bank USD', N'USD')
INSERT [dbo].[bank] ([bankCode], [bankName], [currency]) VALUES (N'902', N'Temp Bank GBP', N'GBP')
INSERT [dbo].[bank] ([bankCode], [bankName], [currency]) VALUES (N'903', N'Temp Bank YEN', N'JPY')
INSERT [dbo].[bank] ([bankCode], [bankName], [currency]) VALUES (N'904', N'Temp Bank AUD', N'AUD')
INSERT [dbo].[bank] ([bankCode], [bankName], [currency]) VALUES (N'905', N'Temp Bank MYR', N'MYR')
INSERT [dbo].[bank] ([bankCode], [bankName], [currency]) VALUES (N'999', N'Rhommie Bank', N'IDR')
GO
INSERT [dbo].[currency] ([currency], [currencyName], [country]) VALUES (N'AUD', N'Australian Dollar', N'Australia')
INSERT [dbo].[currency] ([currency], [currencyName], [country]) VALUES (N'GBP', N'Sterling', N'United Kingdom')
INSERT [dbo].[currency] ([currency], [currencyName], [country]) VALUES (N'IDR', N'Indonesian Rupiah', N'Indonesia')
INSERT [dbo].[currency] ([currency], [currencyName], [country]) VALUES (N'JPY', N'Japan Yen', N'Japan')
INSERT [dbo].[currency] ([currency], [currencyName], [country]) VALUES (N'MYR', N'Malaysian Ringgit', N'Malaysia')
INSERT [dbo].[currency] ([currency], [currencyName], [country]) VALUES (N'USD', N'US Dollar', N'United States')
GO
SET IDENTITY_INSERT [dbo].[currencyType] ON 

INSERT [dbo].[currencyType] ([id], [name], [description]) VALUES (1, N'Local - Local', N'Converter Local to Local')
INSERT [dbo].[currencyType] ([id], [name], [description]) VALUES (2, N'Local - Forex', N'Converter Local to Forex')
INSERT [dbo].[currencyType] ([id], [name], [description]) VALUES (3, N'Forex - Local', N'Converter Forex to Local')
INSERT [dbo].[currencyType] ([id], [name], [description]) VALUES (4, N'Forex - Forex Same', N'Converter Forex to Forex (with same currency)')
INSERT [dbo].[currencyType] ([id], [name], [description]) VALUES (5, N'Forex - Forex Diff', N'Converter Forex to Forex (with Different currency)')
SET IDENTITY_INSERT [dbo].[currencyType] OFF
GO
SET IDENTITY_INSERT [dbo].[person] ON 

INSERT [dbo].[person] ([id], [name], [age], [created_by], [created_dt]) VALUES (1, N'Rhommie', 25, N'Rhommie', CAST(N'2022-11-14' AS Date))
INSERT [dbo].[person] ([id], [name], [age], [created_by], [created_dt]) VALUES (2, N'Sahrul', 20, N'Rhommie', CAST(N'2022-11-14' AS Date))
INSERT [dbo].[person] ([id], [name], [age], [created_by], [created_dt]) VALUES (3, N'Amelia Bianca', 23, N'Rhommie', CAST(N'2022-11-14' AS Date))
INSERT [dbo].[person] ([id], [name], [age], [created_by], [created_dt]) VALUES (4, N'Sule', 46, N'Rhommie', CAST(N'2022-11-14' AS Date))
INSERT [dbo].[person] ([id], [name], [age], [created_by], [created_dt]) VALUES (7, N'Cristiano Ronaldo', 37, N'Rhommie', CAST(N'2022-11-28' AS Date))
INSERT [dbo].[person] ([id], [name], [age], [created_by], [created_dt]) VALUES (10, N'Lionel Messi', 35, N'Users', CAST(N'2022-12-22' AS Date))
SET IDENTITY_INSERT [dbo].[person] OFF
GO
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'1000000001', 4, 983714401.0000, N'999', N'1', CAST(N'2022-11-24' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'1000000002', 4, 1058868000.8000, N'999', N'1', CAST(N'2022-11-24' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'1000000003', 1, 5642829.8500, N'014', N'0', CAST(N'2022-11-24' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'1000000004', 2, 3997871287.0000, N'999', N'1', CAST(N'2022-12-17' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'1000000005', 3, 4979399545.0000, N'999', N'1', CAST(N'2022-12-17' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'1234567890', 4, 32645000500.0000, N'014', N'1', CAST(N'2022-11-22' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'3746088966', 1, 4545555.0000, N'014', N'0', CAST(N'2022-11-26' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'5201242917', 2, 4600000.0000, N'903', N'1', CAST(N'2022-12-22' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'5271429364', 1, 129389955.7000, N'999', N'1', CAST(N'2022-11-22' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'5430625057', 2, 85400060.0000, N'009', N'1', CAST(N'2022-11-26' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'5584669875', 4, 170400000.0000, N'014', N'1', CAST(N'2022-11-22' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'5788394710', 2, 1271651.0000, N'008', N'0', CAST(N'2022-11-25' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'6002237120', 2, 5454545.0000, N'014', N'0', CAST(N'2022-11-25' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'6041479654', 4, 9800008.5100, N'904', N'1', CAST(N'2022-12-22' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'6284905664', 1, 674490.0000, N'008', N'0', CAST(N'2022-11-25' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'6588113469', 3, 10475000.0000, N'014', N'1', CAST(N'2022-11-22' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'6920948814', 10, 1000000228.0900, N'901', N'1', CAST(N'2022-12-22' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'7313107448', 1, 2204000.0000, N'009', N'1', CAST(N'2022-11-26' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'7950009592', 3, 54000.0000, N'905', N'0', CAST(N'2022-11-25' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'8160950182', 7, 99999887731898.0000, N'999', N'1', CAST(N'2022-12-22' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'8894663257', 2, 700000.0000, N'014', N'1', CAST(N'2022-11-22' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'9252772478', 4, 850000000.0000, N'002', N'0', CAST(N'2022-11-25' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'9585251209', 2, 5800000.5770, N'014', N'1', CAST(N'2022-11-26' AS Date))
INSERT [dbo].[rekening] ([no_rekening], [person_id], [saldo], [bankCode], [isAccess], [created_dt]) VALUES (N'9597771907', 1, 5600000.0000, N'902', N'1', CAST(N'2022-11-25' AS Date))
GO
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (1, 1, N'I', N'Start Executed SP', N'
	Start Executed SP')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (1, 2, N'I', N'Insert data into tr_log_d', N'
	Insert data into tr_log_d')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (1, 3, N'I', N'Decreased Transfer From', N'
		Decreased Transfer From Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (1, 4, N'I', N'Increased Transfer To', N'
		Increased Transfer To Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (1, 5, N'I', N'Transfer Inhouse Return', N'
		Transfer Inhouse Return Success')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (2, 1, N'I', N'Start Executed SP', N'
	Start Executed SP')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (2, 2, N'I', N'Insert data into tr_log_d', N'
	Insert data into tr_log_d')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (2, 3, N'I', N'Check Total Balance', N'
	Check Total Balance : 407000.00')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (2, 4, N'I', N'Decreased Transfer From', N'
		Decreased Transfer From Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (2, 5, N'I', N'Increased Transfer To', N'
		Increased Transfer To Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (2, 6, N'I', N'Transfer Inhouse Return', N'
		Transfer Inhouse Return Success')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (3, 1, N'I', N'Start Executed SP', N'
	Start Executed SP')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (3, 2, N'I', N'Insert data into tr_log_d', N'
	Insert data into tr_log_d')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (3, 3, N'I', N'Check Total Balance', N'
	Check Total Balance : 545000.00')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (3, 4, N'I', N'Decreased Transfer From', N'
		Decreased Transfer From Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (3, 5, N'I', N'Increased Transfer To', N'
		Increased Transfer To Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (3, 6, N'I', N'Transfer Inhouse Return', N'
		Transfer Inhouse Return Success')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (4, 1, N'I', N'Start Executed SP', N'
	Start Executed SP')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (4, 2, N'I', N'Insert data into tr_log_d', N'
	Insert data into tr_log_d')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (4, 3, N'I', N'Check Total Balance', N'
	Check Total Balance : 407000.00')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (4, 4, N'I', N'Decreased Transfer From', N'
		Decreased Transfer From Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (4, 5, N'I', N'Increased Transfer To', N'
		Increased Transfer To Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (4, 6, N'I', N'Transfer Inhouse Return', N'
		Transfer Inhouse Return Success')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (5, 1, N'I', N'Start Executed SP', N'
	Start Executed SP')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (5, 2, N'I', N'Insert data into tr_log_d', N'
	Insert data into tr_log_d')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (5, 3, N'I', N'Check Total Balance', N'
	Check Total Balance : 881000.00')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (5, 4, N'I', N'Decreased Transfer From', N'
		Decreased Transfer From Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (5, 5, N'I', N'Increased Transfer To', N'
		Increased Transfer To Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (5, 6, N'I', N'Transfer Domestic Return', N'
		Transfer Domestic Return Success')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (6, 1, N'I', N'Start Executed SP', N'
	Start Executed SP')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (6, 2, N'I', N'Insert data into tr_log_d', N'
	Insert data into tr_log_d')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (6, 3, N'I', N'Check Total Balance', N'
	Check Total Balance : 103000.00')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (6, 4, N'I', N'Decreased Transfer From', N'
		Decreased Transfer From Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (6, 5, N'I', N'Increased Transfer To', N'
		Increased Transfer To Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (6, 6, N'I', N'Transfer International Return', N'
		Transfer International Return Success')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (7, 1, N'I', N'Start Executed SP', N'
	Start Executed SP')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (7, 2, N'I', N'Insert data into tr_log_d', N'
	Insert data into tr_log_d')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (7, 3, N'I', N'Decreased Transfer From', N'
		Decreased Transfer From Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (7, 4, N'I', N'Increased Transfer To', N'
		Increased Transfer To Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (7, 5, N'I', N'Transfer Inhouse Return', N'
		Transfer Inhouse Return Success')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (8, 1, N'I', N'Start Executed SP', N'
	Start Executed SP')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (8, 2, N'I', N'Insert data into tr_log_d', N'
	Insert data into tr_log_d')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (8, 3, N'E', N'Balance Validation', N'
	Balance Validation minimal is 10000')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (8, 4, N'E', N'Transfer Inhouse Return', N'
		Transfer Inhouse Return Failed')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (9, 1, N'I', N'Start Executed SP', N'
	Start Executed SP')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (9, 2, N'I', N'Insert data into tr_log_d', N'
	Insert data into tr_log_d')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (9, 3, N'I', N'Check Total Balance', N'
	Check Total Balance : 220213.00')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (9, 4, N'I', N'Decreased Transfer From', N'
		Decreased Transfer From Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (9, 5, N'I', N'Increased Transfer To', N'
		Increased Transfer To Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (9, 6, N'I', N'Transfer Domestic Return', N'
		Transfer Domestic Return Success')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (10, 1, N'I', N'Start Executed SP', N'
	Start Executed SP')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (10, 2, N'I', N'Insert data into tr_log_d', N'
	Insert data into tr_log_d')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (10, 3, N'I', N'Check Total Balance', N'
	Check Total Balance : 133888.00')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (10, 4, N'I', N'Decreased Transfer From', N'
		Decreased Transfer From Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (10, 5, N'I', N'Increased Transfer To', N'
		Increased Transfer To Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (10, 6, N'I', N'Transfer International Return', N'
		Transfer International Return Success')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (11, 1, N'I', N'Start Executed SP', N'
	Start Executed SP')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (11, 2, N'I', N'Insert data into tr_log_d', N'
	Insert data into tr_log_d')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (11, 3, N'I', N'Decreased Transfer From', N'
		Decreased Transfer From Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (11, 4, N'I', N'Increased Transfer To', N'
		Increased Transfer To Balance')
INSERT [dbo].[Tr_log_d] ([id], [seq], [process_type], [process_message], [description]) VALUES (11, 5, N'I', N'Transfer Inhouse Return', N'
		Transfer Inhouse Return Success')
GO
SET IDENTITY_INSERT [dbo].[Tr_log_h] ON 

INSERT [dbo].[Tr_log_h] ([id], [user_id], [trFrom], [trTo], [menu], [trType], [currencyType], [amount], [description], [trDate], [created_by], [created_dt], [totalAmount]) VALUES (1, N'amelia#1003', N'1000000005', N'5271429364', N'Single Transfer', N'In-House', 1, 400000.0000, N'TEST IDENTITY', CAST(N'2022-12-23T23:07:41.640' AS DateTime), N'Amelia Bianca', CAST(N'2022-12-23' AS Date), 400000.0000)
INSERT [dbo].[Tr_log_h] ([id], [user_id], [trFrom], [trTo], [menu], [trType], [currencyType], [amount], [description], [trDate], [created_by], [created_dt], [totalAmount]) VALUES (2, N'amelia#1003', N'8160950182', N'5584669875', N'Single Transfer', N'Domestic', 1, 400000.0000, N'qeqwewe', CAST(N'2022-12-23T23:08:21.660' AS DateTime), N'Amelia Bianca', CAST(N'2022-12-23' AS Date), 407000.0000)
INSERT [dbo].[Tr_log_h] ([id], [user_id], [trFrom], [trTo], [menu], [trType], [currencyType], [amount], [description], [trDate], [created_by], [created_dt], [totalAmount]) VALUES (3, N'amelia#1003', N'8160950182', N'6920948814', N'Single Transfer', N'International', 2, 500000.0000, N'TEST INTER', CAST(N'2022-12-23T23:08:54.857' AS DateTime), N'Amelia Bianca', CAST(N'2022-12-23' AS Date), 545000.0000)
INSERT [dbo].[Tr_log_h] ([id], [user_id], [trFrom], [trTo], [menu], [trType], [currencyType], [amount], [description], [trDate], [created_by], [created_dt], [totalAmount]) VALUES (4, N'amelia#1003', N'8160950182', N'5430625057', N'Single Transfer', N'Domestic', 1, 400000.0000, N'TEST AGAIN', CAST(N'2022-12-23T23:10:59.587' AS DateTime), N'Amelia Bianca', CAST(N'2022-12-23' AS Date), 407000.0000)
INSERT [dbo].[Tr_log_h] ([id], [user_id], [trFrom], [trTo], [menu], [trType], [currencyType], [amount], [description], [trDate], [created_by], [created_dt], [totalAmount]) VALUES (5, N'amelia#1003', N'1000000004', N'7313107448', N'Single Transfer', N'Domestic', 1, 874000.0000, N'TEST DOMESTIC SP', CAST(N'2022-12-25T14:27:56.500' AS DateTime), N'Amelia Bianca', CAST(N'2022-12-25' AS Date), 881000.0000)
INSERT [dbo].[Tr_log_h] ([id], [user_id], [trFrom], [trTo], [menu], [trType], [currencyType], [amount], [description], [trDate], [created_by], [created_dt], [totalAmount]) VALUES (6, N'amelia#1003', N'8160950182', N'6920948814', N'Single Transfer', N'International', 2, 58000.0000, N'TEST INTERNATIONAL', CAST(N'2022-12-25T14:28:30.680' AS DateTime), N'Amelia Bianca', CAST(N'2022-12-25' AS Date), 103000.0000)
INSERT [dbo].[Tr_log_h] ([id], [user_id], [trFrom], [trTo], [menu], [trType], [currencyType], [amount], [description], [trDate], [created_by], [created_dt], [totalAmount]) VALUES (7, N'amelia#1003', N'5271429364', N'1000000004', N'Single Transfer', N'In-House', 1, 800000.0000, N'qweqw', CAST(N'2022-12-25T20:33:03.370' AS DateTime), N'Amelia Bianca', CAST(N'2022-12-25' AS Date), 800000.0000)
INSERT [dbo].[Tr_log_h] ([id], [user_id], [trFrom], [trTo], [menu], [trType], [currencyType], [amount], [description], [trDate], [created_by], [created_dt], [totalAmount]) VALUES (8, N'amelia#1003', N'5271429364', N'1000000002', N'Single Transfer', N'In-House', 1, 2000.0000, N'yuyuty', CAST(N'2022-12-25T20:38:27.580' AS DateTime), N'Amelia Bianca', CAST(N'2022-12-25' AS Date), 2000.0000)
INSERT [dbo].[Tr_log_h] ([id], [user_id], [trFrom], [trTo], [menu], [trType], [currencyType], [amount], [description], [trDate], [created_by], [created_dt], [totalAmount]) VALUES (9, N'amelia#1003', N'8160950182', N'5788394710', N'Single Transfer', N'Domestic', 1, 213213.0000, N'QWEAWEQW', CAST(N'2022-12-25T21:39:40.203' AS DateTime), N'Amelia Bianca', CAST(N'2022-12-25' AS Date), 220213.0000)
INSERT [dbo].[Tr_log_h] ([id], [user_id], [trFrom], [trTo], [menu], [trType], [currencyType], [amount], [description], [trDate], [created_by], [created_dt], [totalAmount]) VALUES (10, N'amelia#1003', N'8160950182', N'6041479654', N'Single Transfer', N'International', 2, 88888.0000, N'qrqr', CAST(N'2022-12-26T10:13:24.203' AS DateTime), N'Amelia Bianca', CAST(N'2022-12-26' AS Date), 133888.0000)
INSERT [dbo].[Tr_log_h] ([id], [user_id], [trFrom], [trTo], [menu], [trType], [currencyType], [amount], [description], [trDate], [created_by], [created_dt], [totalAmount]) VALUES (11, N'amelia#1003', N'8160950182', N'5271429364', N'Single Transfer', N'In-House', 1, 8000000.0000, N'sdqweweq', CAST(N'2023-01-08T19:18:37.450' AS DateTime), N'Amelia Bianca', CAST(N'2023-01-08' AS Date), 8000000.0000)
SET IDENTITY_INSERT [dbo].[Tr_log_h] OFF
GO
INSERT [dbo].[trType] ([trTypeId], [charge]) VALUES (N'Domestic', 7000.0000)
INSERT [dbo].[trType] ([trTypeId], [charge]) VALUES (N'In-House', 0.0000)
INSERT [dbo].[trType] ([trTypeId], [charge]) VALUES (N'International', 45000.0000)
GO
INSERT [dbo].[users] ([id], [username], [password], [email], [name], [isAdmin], [pictProfile]) VALUES (N'amelia#1003', N'amelia', N'123', N'amelia.bianca@gmail.com', N'Amelia Bianca', N'0', NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [name], [isAdmin], [pictProfile]) VALUES (N'rhommie_1#1001', N'rhommie', N'123', N'rhommie.1997@gmail.com', N'Rommy Julianto', N'0', NULL)
INSERT [dbo].[users] ([id], [username], [password], [email], [name], [isAdmin], [pictProfile]) VALUES (N'rhommie_1#1002', N'rhommie_1', N'123', N'rhommie.1998@gmail.com', N'Rommy Julianto', N'1', NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E6164C9A38210]    Script Date: 1/8/2023 7:44:42 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC57271848135]    Script Date: 1/8/2023 7:44:42 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bank]  WITH CHECK ADD FOREIGN KEY([currency])
REFERENCES [dbo].[currency] ([currency])
GO
ALTER TABLE [dbo].[rekening]  WITH CHECK ADD FOREIGN KEY([bankCode])
REFERENCES [dbo].[bank] ([bankCode])
GO
ALTER TABLE [dbo].[rekening]  WITH CHECK ADD FOREIGN KEY([person_id])
REFERENCES [dbo].[person] ([id])
GO
ALTER TABLE [dbo].[Tr_log_d]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Tr_log_h] ([id])
GO
ALTER TABLE [dbo].[Tr_log_h]  WITH CHECK ADD FOREIGN KEY([currencyType])
REFERENCES [dbo].[currencyType] ([id])
GO
ALTER TABLE [dbo].[Tr_log_h]  WITH CHECK ADD FOREIGN KEY([trType])
REFERENCES [dbo].[trType] ([trTypeId])
GO
ALTER TABLE [dbo].[Tr_log_h]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
/****** Object:  StoredProcedure [dbo].[Sp_Select_Bank]    Script Date: 1/8/2023 7:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_Select_Bank]
(
	@bankCode char(3),
	@bankName varchar(100),
	@currency varchar(10)
)
as

declare		@status varchar(10),
			@count int



set @count = (select count(1) from bank 
where bankCode	like '%'+ @bankCode + '%'
and bankName	like '%'+ @bankName	+ '%'
and currency	like '%'+ @currency	+ '%')

if @count > 0
begin 
	select * from bank 
	where bankCode	like '%'+ @bankCode + '%'
	and bankName	like '%'+ @bankName	+ '%'
	and currency	like '%'+ @currency	+ '%'
end
else
begin
	select 'TIDAK KETEMU' as [STATUS]
end

GO
/****** Object:  StoredProcedure [dbo].[Sp_SingleTransfer_Domestic]    Script Date: 1/8/2023 7:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_SingleTransfer_Domestic]
(
	@user_id varchar(30),
	@user_full_name varchar(50),
	@transferFrom char(10),
	@transferTo char(10),
	@balance money,
	@description varchar(100),
	@charge money
)
as
declare @id bigint,
		@seq int,
		@isFail smallint = 0,
		@totalBalance money = @balance + @charge



begin try
	declare 
			@checkTransferFrom char(10) = (select no_rekening from rekening where no_rekening = @transferFrom),
			@checkTransferTo char(10) = (select no_rekening from rekening where no_rekening = @transferTo)
	
	insert into Tr_log_h values(@user_id,@transferFrom,@transferTo,'Single Transfer','Domestic',1,@balance,
	@description,getdate(),@user_full_name,getdate(),@totalBalance)

	
	set @id = (select top 1 id from Tr_log_h order by id desc)
	
	insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Start Executed SP','
	Start Executed SP')
	
	insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Insert data into tr_log_d','
	Insert data into tr_log_d')

	insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Check Total Balance','
	Check Total Balance : '+cast(@totalBalance as varchar(30)))

	if @balance <10000
	begin
		set @isFail = 1
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Balance Validation','
	Balance Validation minimal is 10000')
	end
	else if @checkTransferFrom is null
	begin
		set @isFail = 1
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Transfer From Validation','
	Rekening Transfer From not found !!')
	end
	else if @checkTransferTo is null
	begin
		set @isFail = 1
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Transfer To Validation','
	Rekening Transfer To not found !!')
	end
	else
	begin

		update 
			rekening 
		set 
			saldo=saldo-@totalBalance
		where no_rekening = @transferFrom
		
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Decreased Transfer From','
		Decreased Transfer From Balance')
		
		update 
			rekening 
		set 
			saldo=saldo+@balance 
		where no_rekening = @transferTo
		
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Increased Transfer To','
		Increased Transfer To Balance')
	end
	if @isFail = 0
	begin
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Transfer Domestic Return','
		Transfer Domestic Return Success')
	end
	else
	begin
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Transfer Domestic Return','
		Transfer Domestic Return Failed')
	end

	return @isFail

end try
BEGIN CATCH	

set @isFail = 1

	insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Transfer Catch Error','
	Transaction Error with Catch, Return Error')
	return @isFail
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Sp_SingleTransfer_Inhouse]    Script Date: 1/8/2023 7:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_SingleTransfer_Inhouse]
(
	@user_id varchar(30),
	@user_full_name varchar(50),
	@transferFrom char(10),
	@transferTo char(10),
	@balance money,
	@description varchar(100)
)
as

declare @id bigint,
		@seq int,
		@isSuccess smallint = 0


begin try
	
	declare @checkTransferFrom char(10) = (select no_rekening from rekening where no_rekening = @transferFrom),
			@checkTransferTo char(10) = (select no_rekening from rekening where no_rekening = @transferTo)
	
	insert into Tr_log_h values(@user_id,@transferFrom,@transferTo,'Single Transfer','In-House',1,@balance,
	@description,getdate(),@user_full_name,getdate(),@balance)
	
	set @id = (select top 1 id from Tr_log_h order by id desc)
	
	insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Start Executed SP','
	Start Executed SP')
	
	insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Insert data into tr_log_d','
	Insert data into tr_log_d')
	

	if @balance <10000
	begin
		set @isSuccess = 1
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Balance Validation','
	Balance Validation minimal is 10000')
	end
	else if @checkTransferFrom is null
	begin
		set @isSuccess = 1
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Transfer From Validation','
	Rekening Transfer From not found !!')
	end
	else if @checkTransferTo is null
	begin
		set @isSuccess = 1
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Transfer To Validation','
	Rekening Transfer To not found !!')
	end
	else
		begin
			update 
			rekening 
		set 
			saldo=saldo-@balance
		where no_rekening = @transferFrom
		
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Decreased Transfer From','
		Decreased Transfer From Balance')
		
		update 
			rekening 
		set 
			saldo=saldo+@balance 
		where no_rekening = @transferTo
		
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Increased Transfer To','
		Increased Transfer To Balance')
	end

	if @isSuccess = 0
	begin
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Transfer Inhouse Return','
		Transfer Inhouse Return Success')
	end
	else
	begin
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Transfer Inhouse Return','
		Transfer Inhouse Return Failed')
	end
	

	return @isSuccess
end try
BEGIN CATCH	
	set @isSuccess = 1

	insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Transfer Catch Error','
	Transaction Error with Catch, Return Error')
	return @isSuccess
END CATCH



GO
/****** Object:  StoredProcedure [dbo].[Sp_SingleTransfer_International]    Script Date: 1/8/2023 7:44:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[Sp_SingleTransfer_International]
(
	@user_id varchar(30),
	@user_full_name varchar(50),
	@transferFrom char(10),
	@transferTo char(10),
	@balance money,
	@description varchar(100),
	@charge money,
	@convertedBalance money
)
as
declare @id bigint,
		@seq int,
		@isFail smallint = 0,
		@totalBalance money = @balance + @charge

begin try
	declare 
			@checkTransferFrom char(10) = (select no_rekening from rekening where no_rekening = @transferFrom),
			@checkTransferTo char(10) = (select no_rekening from rekening where no_rekening = @transferTo)
	
	insert into Tr_log_h values(@user_id,@transferFrom,@transferTo,'Single Transfer','International',2,@balance,
	@description,getdate(),@user_full_name,getdate(),@totalBalance)

	set @id = (select top 1 id from Tr_log_h order by id desc)

	insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Start Executed SP','
	Start Executed SP')
	
	insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Insert data into tr_log_d','
	Insert data into tr_log_d')

	insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Check Total Balance','
	Check Total Balance : '+cast(@totalBalance as varchar(30)))

	if @balance <10000
	begin
		set @isFail = 1
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Balance Validation','
	Balance Validation minimal is 10000')
	end
	else if @checkTransferFrom is null
	begin
		set @isFail = 1
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Transfer From Validation','
	Rekening Transfer From not found !!')
	end
	else if @checkTransferTo is null
	begin
		set @isFail = 1
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Transfer To Validation','
	Rekening Transfer To not found !!')
	end
	else
	begin
		update 
			rekening 
		set 
			saldo=saldo-@totalBalance
		where no_rekening = @transferFrom
		
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Decreased Transfer From','
		Decreased Transfer From Balance')

		update 
			rekening 
		set 
			saldo=saldo+@convertedBalance 
		where no_rekening = @transferTo
		
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Increased Transfer To','
		Increased Transfer To Balance')
	end

	if @isFail = 0
	begin
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'I','Transfer International Return','
		Transfer International Return Success')
	end
	else
	begin
		insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Transfer International Return','
		Transfer International Return Failed')
	end

	return @isFail

end try
begin catch
	set @isFail = 1

	insert into tr_log_d values(@id,(select count(1) from tr_log_d where id = @id)+1,'E','Transfer Catch Error','
	Transaction Error with Catch, Return Error')
	return @isFail
end catch
GO
