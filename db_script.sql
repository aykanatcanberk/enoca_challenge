USE [master]
GO
/****** Object:  Database [enoca]    Script Date: 3.11.2023 20:17:46 ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3.11.2023 20:17:46 ******/
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
/****** Object:  Table [dbo].[Carriers]    Script Date: 3.11.2023 20:17:46 ******/
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
/****** Object:  Table [dbo].[CarriersConfigurations]    Script Date: 3.11.2023 20:17:46 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 3.11.2023 20:17:46 ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231102141619_Initial', N'7.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231102150621_UpdateRelations', N'7.0.13')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231102151124_fk', N'7.0.13')
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
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
/****** Object:  Index [IX_CarriersConfigurations_CarrierId]    Script Date: 3.11.2023 20:17:46 ******/
CREATE NONCLUSTERED INDEX [IX_CarriersConfigurations_CarrierId] ON [dbo].[CarriersConfigurations]
(
	[CarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_CarrierId]    Script Date: 3.11.2023 20:17:46 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CarrierId] ON [dbo].[Orders]
(
	[CarrierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
USE [master]
GO
ALTER DATABASE [enoca] SET  READ_WRITE 
GO
