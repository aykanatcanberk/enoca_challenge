USE [master]
GO
/****** Object:  Database [enoca]    Script Date: 4.11.2023 18:03:01 ******/
CREATE DATABASE [enoca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'enoca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\enoca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'enoca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\enoca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [enoca] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [enoca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [enoca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [enoca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [enoca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [enoca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [enoca] SET ARITHABORT OFF 
GO
ALTER DATABASE [enoca] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [enoca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [enoca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [enoca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [enoca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [enoca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [enoca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [enoca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [enoca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [enoca] SET  ENABLE_BROKER 
GO
ALTER DATABASE [enoca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [enoca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [enoca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [enoca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [enoca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [enoca] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [enoca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [enoca] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [enoca] SET  MULTI_USER 
GO
ALTER DATABASE [enoca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [enoca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [enoca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [enoca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [enoca] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [enoca] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [enoca] SET QUERY_STORE = ON
GO
ALTER DATABASE [enoca] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [enoca]
GO
/****** Object:  Schema [HangFire]    Script Date: 4.11.2023 18:03:01 ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarrierReports]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarrierReports](
	[CarrierReportId] [int] IDENTITY(1,1) NOT NULL,
	[CarrierId] [int] NOT NULL,
	[CarrierCost] [decimal](18, 2) NOT NULL,
	[CarrierReportTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CarrierReports] PRIMARY KEY CLUSTERED 
(
	[CarrierReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carriers]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carriers](
	[CarrierId] [int] IDENTITY(1,1) NOT NULL,
	[CarrierName] [nvarchar](max) NOT NULL,
	[CarrierIsActive] [bit] NOT NULL,
	[CarrierPlusDesiCost] [int] NOT NULL,
 CONSTRAINT [PK_Carriers] PRIMARY KEY CLUSTERED 
(
	[CarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarriersConfigurations]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarriersConfigurations](
	[CarrierConfigurationId] [int] IDENTITY(1,1) NOT NULL,
	[CarrierId] [int] NOT NULL,
	[CarrierMaxDesi] [int] NOT NULL,
	[CarrierMinDesi] [int] NOT NULL,
	[CarrierCost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_CarriersConfigurations] PRIMARY KEY CLUSTERED 
(
	[CarrierConfigurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CarrierId] [int] NOT NULL,
	[OrderDesi] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[OrderCarrierCost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 4.11.2023 18:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231102141619_Initial', N'7.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231102150621_UpdateRelations', N'7.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231102151124_fk', N'7.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231104141759_hangfire', N'7.0.13')
GO
SET IDENTITY_INSERT [dbo].[CarrierReports] ON 

INSERT [dbo].[CarrierReports] ([CarrierReportId], [CarrierId], [CarrierCost], [CarrierReportTime]) VALUES (33, 1, CAST(30.00 AS Decimal(18, 2)), CAST(N'2023-11-03T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([CarrierReportId], [CarrierId], [CarrierCost], [CarrierReportTime]) VALUES (34, 2, CAST(18.00 AS Decimal(18, 2)), CAST(N'2023-11-03T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([CarrierReportId], [CarrierId], [CarrierCost], [CarrierReportTime]) VALUES (35, 8, CAST(135.00 AS Decimal(18, 2)), CAST(N'2023-11-03T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([CarrierReportId], [CarrierId], [CarrierCost], [CarrierReportTime]) VALUES (36, 8, CAST(184.00 AS Decimal(18, 2)), CAST(N'2023-11-04T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([CarrierReportId], [CarrierId], [CarrierCost], [CarrierReportTime]) VALUES (37, 1, CAST(20.00 AS Decimal(18, 2)), CAST(N'2023-11-04T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarrierReports] ([CarrierReportId], [CarrierId], [CarrierCost], [CarrierReportTime]) VALUES (38, 2, CAST(12.00 AS Decimal(18, 2)), CAST(N'2023-11-04T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CarrierReports] OFF
GO
SET IDENTITY_INSERT [dbo].[Carriers] ON 

INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost]) VALUES (1, N'Saras', 1, 1)
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost]) VALUES (2, N'VPS', 1, 2)
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost]) VALUES (7, N'Yurdisi', 1, 3)
INSERT [dbo].[Carriers] ([CarrierId], [CarrierName], [CarrierIsActive], [CarrierPlusDesiCost]) VALUES (8, N'Enoca', 1, 1)
SET IDENTITY_INSERT [dbo].[Carriers] OFF
GO
SET IDENTITY_INSERT [dbo].[CarriersConfigurations] ON 

INSERT [dbo].[CarriersConfigurations] ([CarrierConfigurationId], [CarrierId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost]) VALUES (1, 1, 10, 5, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[CarriersConfigurations] ([CarrierConfigurationId], [CarrierId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost]) VALUES (6, 2, 13, 0, CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[CarriersConfigurations] ([CarrierConfigurationId], [CarrierId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost]) VALUES (7, 7, 18, 5, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[CarriersConfigurations] ([CarrierConfigurationId], [CarrierId], [CarrierMaxDesi], [CarrierMinDesi], [CarrierCost]) VALUES (8, 8, 35, 9, CAST(7.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[CarriersConfigurations] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (2, 1, 6, CAST(N'2023-11-03T19:21:34.0541866' AS DateTime2), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (3, 8, 50, CAST(N'2023-11-03T19:22:55.9764721' AS DateTime2), CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (4, 1, 6, CAST(N'2023-11-03T19:24:18.1596209' AS DateTime2), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (6, 8, 15, CAST(N'2023-11-03T19:31:13.8675409' AS DateTime2), CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (7, 8, 19, CAST(N'2023-11-03T19:31:54.4587818' AS DateTime2), CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (8, 8, 37, CAST(N'2023-11-03T19:32:18.4281044' AS DateTime2), CAST(9.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (9, 2, 1, CAST(N'2023-11-03T19:36:29.7270396' AS DateTime2), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (10, 8, 50, CAST(N'2023-11-04T17:39:55.6032270' AS DateTime2), CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (11, 8, 50, CAST(N'2023-11-04T17:40:00.2721980' AS DateTime2), CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (12, 2, 3, CAST(N'2023-11-04T17:55:23.0288263' AS DateTime2), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (13, 1, 10, CAST(N'2023-11-04T17:55:34.1833280' AS DateTime2), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (14, 8, 15, CAST(N'2023-11-04T17:55:38.5835843' AS DateTime2), CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (15, 8, 15, CAST(N'2023-11-04T17:55:47.0891906' AS DateTime2), CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (16, 1, 5, CAST(N'2023-11-04T17:56:52.7986344' AS DateTime2), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Orders] ([OrderId], [CarrierId], [OrderDesi], [OrderDate], [OrderCarrierCost]) VALUES (17, 8, 40, CAST(N'2023-11-04T17:57:38.2073804' AS DateTime2), CAST(12.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 5, NULL)
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-11-04', 5, CAST(N'2023-12-04T14:53:54.430' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-11-04-14', 5, CAST(N'2023-11-05T14:53:54.430' AS DateTime))
GO
SET IDENTITY_INSERT [HangFire].[Counter] ON 

INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded', 1, NULL, 16)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded', 1, NULL, 19)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-11-04', 1, CAST(N'2023-12-04T14:58:29.813' AS DateTime), 17)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-11-04', 1, CAST(N'2023-12-04T14:59:24.073' AS DateTime), 20)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-11-04-14', 1, CAST(N'2023-11-05T14:58:29.813' AS DateTime), 18)
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2023-11-04-14', 1, CAST(N'2023-11-05T14:59:24.073' AS DateTime), 21)
SET IDENTITY_INSERT [HangFire].[Counter] OFF
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IHangfireService.GenerateCarrierReportsJob', N'CreatedAt', N'2023-11-04T14:26:53.4797093Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IHangfireService.GenerateCarrierReportsJob', N'Cron', N'0 0 * * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IHangfireService.GenerateCarrierReportsJob', N'Job', N'{"Type":"enoca_challenge.Services.HangfireServices.IHangfireService, enoca_challenge, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReportsJob","ParameterTypes":"[]","Arguments":"[]"}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IHangfireService.GenerateCarrierReportsJob', N'LastExecution', N'2023-11-04T14:59:23.9869637Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IHangfireService.GenerateCarrierReportsJob', N'LastJobId', N'7', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IHangfireService.GenerateCarrierReportsJob', N'NextExecution', N'2023-11-05T00:00:00.0000000Z', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IHangfireService.GenerateCarrierReportsJob', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IHangfireService.GenerateCarrierReportsJob', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:IHangfireService.GenerateCarrierReportsJob', N'V', N'2', NULL)
GO
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (1, 3, N'Succeeded', N'{"Type":"enoca_challenge.Services.HangfireServices.IHangfireService, enoca_challenge, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReportsJob","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-11-04T14:28:27.520' AS DateTime), CAST(N'2023-11-05T14:28:30.787' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (2, 6, N'Succeeded', N'{"Type":"enoca_challenge.Services.HangfireServices.IHangfireService, enoca_challenge, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReportsJob","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-11-04T14:37:31.140' AS DateTime), CAST(N'2023-11-05T14:37:34.147' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (3, 9, N'Succeeded', N'{"Type":"enoca_challenge.Services.HangfireServices.IHangfireService, enoca_challenge, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReportsJob","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-11-04T14:40:18.357' AS DateTime), CAST(N'2023-11-05T14:40:18.403' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (4, 12, N'Succeeded', N'{"Type":"enoca_challenge.Services.HangfireServices.IHangfireService, enoca_challenge, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReportsJob","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-11-04T14:43:31.260' AS DateTime), CAST(N'2023-11-05T14:43:34.300' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (5, 15, N'Succeeded', N'{"Type":"enoca_challenge.Services.HangfireServices.IHangfireService, enoca_challenge, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReportsJob","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-11-04T14:53:51.360' AS DateTime), CAST(N'2023-11-05T14:53:54.437' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (6, 18, N'Succeeded', N'{"Type":"enoca_challenge.Services.HangfireServices.IHangfireService, enoca_challenge, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReportsJob","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-11-04T14:58:29.697' AS DateTime), CAST(N'2023-11-05T14:58:29.813' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (7, 21, N'Succeeded', N'{"Type":"enoca_challenge.Services.HangfireServices.IHangfireService, enoca_challenge, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"GenerateCarrierReportsJob","ParameterTypes":"[]","Arguments":null}', N'[]', CAST(N'2023-11-04T14:59:23.990' AS DateTime), CAST(N'2023-11-05T14:59:24.073' AS DateTime))
SET IDENTITY_INSERT [HangFire].[Job] OFF
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (2, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'RecurringJobId', N'"IHangfireService.GenerateCarrierReportsJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (4, N'Time', N'1699109011')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (5, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (6, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (6, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'RecurringJobId', N'"IHangfireService.GenerateCarrierReportsJob"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'Time', N'1699109963')
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (9)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'canbe:21764:f410a5a8-7a71-4a94-b130-7daed6b28763', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2023-11-04T14:48:19.1617879Z"}', CAST(N'2023-11-04T15:01:19.580' AS DateTime))
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1699142400, N'IHangfireService.GenerateCarrierReportsJob', NULL)
GO
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (1, 1, N'Enqueued', NULL, CAST(N'2023-11-04T14:28:27.557' AS DateTime), N'{"EnqueuedAt":"2023-11-04T14:28:27.4989094Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (2, 1, N'Processing', NULL, CAST(N'2023-11-04T14:28:27.920' AS DateTime), N'{"StartedAt":"2023-11-04T14:28:27.7142003Z","ServerId":"canbe:21680:8ea806ec-df76-4d3c-8087-70a21ec872b5","WorkerId":"e9f4b187-5171-4f3a-972a-172ac6ba8e3f"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (3, 1, N'Succeeded', NULL, CAST(N'2023-11-04T14:28:30.780' AS DateTime), N'{"SucceededAt":"2023-11-04T14:28:30.7733529Z","PerformanceDuration":"2844","Latency":"409"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4, 2, N'Enqueued', NULL, CAST(N'2023-11-04T14:37:31.183' AS DateTime), N'{"EnqueuedAt":"2023-11-04T14:37:31.1187707Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (5, 2, N'Processing', NULL, CAST(N'2023-11-04T14:37:31.390' AS DateTime), N'{"StartedAt":"2023-11-04T14:37:31.2263389Z","ServerId":"canbe:3580:775c29f9-233e-49b4-8170-e9849585d4b9","WorkerId":"4608b9eb-9e5e-4699-853d-7bcef6f8a822"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (6, 2, N'Succeeded', NULL, CAST(N'2023-11-04T14:37:34.143' AS DateTime), N'{"SucceededAt":"2023-11-04T14:37:34.1310209Z","PerformanceDuration":"2725","Latency":"265"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (7, 3, N'Enqueued', NULL, CAST(N'2023-11-04T14:40:18.370' AS DateTime), N'{"EnqueuedAt":"2023-11-04T14:40:18.3573330Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (8, 3, N'Processing', NULL, CAST(N'2023-11-04T14:40:18.383' AS DateTime), N'{"StartedAt":"2023-11-04T14:40:18.3807604Z","ServerId":"canbe:3580:775c29f9-233e-49b4-8170-e9849585d4b9","WorkerId":"767e0f57-87d3-4b0a-9dce-974b05080090"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (9, 3, N'Succeeded', NULL, CAST(N'2023-11-04T14:40:18.403' AS DateTime), N'{"SucceededAt":"2023-11-04T14:40:18.4016276Z","PerformanceDuration":"16","Latency":"27"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10, 4, N'Enqueued', N'Triggered using recurring job manager', CAST(N'2023-11-04T14:43:31.300' AS DateTime), N'{"EnqueuedAt":"2023-11-04T14:43:31.2868799Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (11, 4, N'Processing', NULL, CAST(N'2023-11-04T14:43:31.530' AS DateTime), N'{"StartedAt":"2023-11-04T14:43:31.4283872Z","ServerId":"canbe:20276:1b2df95c-e0a9-4ad5-92c3-b67bd8535006","WorkerId":"be5ec519-adcc-4bba-aeb6-456f135434f5"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (12, 4, N'Succeeded', NULL, CAST(N'2023-11-04T14:43:34.297' AS DateTime), N'{"SucceededAt":"2023-11-04T14:43:34.2891974Z","PerformanceDuration":"2749","Latency":"279"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (13, 5, N'Enqueued', NULL, CAST(N'2023-11-04T14:53:51.417' AS DateTime), N'{"EnqueuedAt":"2023-11-04T14:53:51.3384022Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (14, 5, N'Processing', NULL, CAST(N'2023-11-04T14:53:51.707' AS DateTime), N'{"StartedAt":"2023-11-04T14:53:51.5417278Z","ServerId":"canbe:21764:f410a5a8-7a71-4a94-b130-7daed6b28763","WorkerId":"d2fcfae6-b97f-44a5-a20f-371b35368aec"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (15, 5, N'Succeeded', NULL, CAST(N'2023-11-04T14:53:54.433' AS DateTime), N'{"SucceededAt":"2023-11-04T14:53:54.4259646Z","PerformanceDuration":"2712","Latency":"353"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (16, 6, N'Enqueued', NULL, CAST(N'2023-11-04T14:58:29.710' AS DateTime), N'{"EnqueuedAt":"2023-11-04T14:58:29.6976585Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (17, 6, N'Processing', NULL, CAST(N'2023-11-04T14:58:29.727' AS DateTime), N'{"StartedAt":"2023-11-04T14:58:29.7211067Z","ServerId":"canbe:21764:f410a5a8-7a71-4a94-b130-7daed6b28763","WorkerId":"58fd2cff-5701-4974-9c5f-07a7f4f5c04c"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (18, 6, N'Succeeded', NULL, CAST(N'2023-11-04T14:58:29.813' AS DateTime), N'{"SucceededAt":"2023-11-04T14:58:29.8136529Z","PerformanceDuration":"85","Latency":"30"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (19, 7, N'Enqueued', N'Triggered using recurring job manager', CAST(N'2023-11-04T14:59:23.997' AS DateTime), N'{"EnqueuedAt":"2023-11-04T14:59:23.9956962Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (20, 7, N'Processing', NULL, CAST(N'2023-11-04T14:59:24.010' AS DateTime), N'{"StartedAt":"2023-11-04T14:59:24.0074376Z","ServerId":"canbe:21764:f410a5a8-7a71-4a94-b130-7daed6b28763","WorkerId":"ee8a44ec-924e-4748-adb2-44bfdf6e6990"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (21, 7, N'Succeeded', NULL, CAST(N'2023-11-04T14:59:24.073' AS DateTime), N'{"SucceededAt":"2023-11-04T14:59:24.0718250Z","PerformanceDuration":"62","Latency":"19"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
GO
/****** Object:  Index [IX_CarrierReports_CarrierId]    Script Date: 4.11.2023 18:03:01 ******/
CREATE NONCLUSTERED INDEX [IX_CarrierReports_CarrierId] ON [dbo].[CarrierReports]
(
	[CarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarriersConfigurations_CarrierId]    Script Date: 4.11.2023 18:03:01 ******/
CREATE NONCLUSTERED INDEX [IX_CarriersConfigurations_CarrierId] ON [dbo].[CarriersConfigurations]
(
	[CarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_CarrierId]    Script Date: 4.11.2023 18:03:01 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CarrierId] ON [dbo].[Orders]
(
	[CarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 4.11.2023 18:03:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 4.11.2023 18:03:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 4.11.2023 18:03:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE([StateName]) 
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 4.11.2023 18:03:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 4.11.2023 18:03:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 4.11.2023 18:03:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 4.11.2023 18:03:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 4.11.2023 18:03:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_State_CreatedAt]    Script Date: 4.11.2023 18:03:01 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_State_CreatedAt] ON [HangFire].[State]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CarrierReports]  WITH CHECK ADD  CONSTRAINT [FK_CarrierReports_Carriers_CarrierId] FOREIGN KEY([CarrierId])
REFERENCES [dbo].[Carriers] ([CarrierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarrierReports] CHECK CONSTRAINT [FK_CarrierReports_Carriers_CarrierId]
GO
ALTER TABLE [dbo].[CarriersConfigurations]  WITH CHECK ADD  CONSTRAINT [FK_CarriersConfigurations_Carriers_CarrierId] FOREIGN KEY([CarrierId])
REFERENCES [dbo].[Carriers] ([CarrierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarriersConfigurations] CHECK CONSTRAINT [FK_CarriersConfigurations_Carriers_CarrierId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Carriers_CarrierId] FOREIGN KEY([CarrierId])
REFERENCES [dbo].[Carriers] ([CarrierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Carriers_CarrierId]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
USE [master]
GO
ALTER DATABASE [enoca] SET  READ_WRITE 
GO
