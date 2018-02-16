USE [master]
GO
/****** Object:  Database [ClientsProvidersDb]    Script Date: 2/6/2018 4:14:04 PM ******/
CREATE DATABASE [ClientsProvidersDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClientsProvidersDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ClientsProvidersDb.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ClientsProvidersDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ClientsProvidersDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ClientsProvidersDb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClientsProvidersDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClientsProvidersDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ClientsProvidersDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClientsProvidersDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClientsProvidersDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClientsProvidersDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClientsProvidersDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET RECOVERY FULL 
GO
ALTER DATABASE [ClientsProvidersDb] SET  MULTI_USER 
GO
ALTER DATABASE [ClientsProvidersDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClientsProvidersDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClientsProvidersDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClientsProvidersDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ClientsProvidersDb', N'ON'
GO
USE [ClientsProvidersDb]
GO
/****** Object:  User [NT AUTHORITY\LOCAL SERVICE]    Script Date: 2/6/2018 4:14:04 PM ******/
CREATE USER [NT AUTHORITY\LOCAL SERVICE] FOR LOGIN [NT AUTHORITY\LOCAL SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 2/6/2018 4:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[Active] [bit] NOT NULL,
	[Gender] [nvarchar](1) NULL,
	[Birthdate] [datetime] NULL,
	[EmailAddr] [nvarchar](100) NULL,
	[GenderPreference] [nvarchar](1) NULL,
	[ResponsibleParty] [nvarchar](200) NULL,
	[ResponsiblePartyContact] [nvarchar](300) NULL,
	[Notes] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [nvarchar](20) NULL,
 CONSTRAINT [PK_ClientId] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientShiftAssignment]    Script Date: 2/6/2018 4:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientShiftAssignment](
	[ClientId] [int] NOT NULL,
	[DayOfWeek] [nvarchar](10) NOT NULL,
	[Shift] [varchar](20) NULL,
	[ProviderId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [nvarchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientSvcCode]    Script Date: 2/6/2018 4:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientSvcCode](
	[ClientId] [int] NOT NULL,
	[SvcCode] [varchar](10) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [nvarchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 2/6/2018 4:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[Active] [bit] NOT NULL,
	[Gender] [nvarchar](1) NULL,
	[HireDate] [datetime] NULL,
	[EmailAddr] [nvarchar](100) NULL,
	[Notes] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [nvarchar](20) NULL,
 CONSTRAINT [PK_ProviderId] PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProviderAvailableShift]    Script Date: 2/6/2018 4:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderAvailableShift](
	[ProviderId] [int] NOT NULL,
	[DayOfWeek] [nvarchar](10) NOT NULL,
	[Shift] [varchar](20) NULL,
	[HasBeenScheduled] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [nvarchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderSvcCode]    Script Date: 2/6/2018 4:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderSvcCode](
	[ProviderId] [int] NOT NULL,
	[SvcCode] [varchar](10) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [nvarchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SvcCode]    Script Date: 2/6/2018 4:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SvcCode](
	[SvcCodeValue] [varchar](10) NOT NULL,
 CONSTRAINT [PK_SvcCode] PRIMARY KEY CLUSTERED 
(
	[SvcCodeValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WeekDay]    Script Date: 2/6/2018 4:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeekDay](
	[DayOfWeek] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_WeekDay] PRIMARY KEY CLUSTERED 
(
	[DayOfWeek] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkShift]    Script Date: 2/6/2018 4:14:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorkShift](
	[Shift] [varchar](20) NOT NULL,
 CONSTRAINT [PK_WorkShift] PRIMARY KEY CLUSTERED 
(
	[Shift] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [Phone], [Address], [City], [ZipCode], [Active], [Gender], [Birthdate], [EmailAddr], [GenderPreference], [ResponsibleParty], [ResponsiblePartyContact], [Notes], [CreateDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'Talon', N'Hatch', N'480-664-2455', N'1843 E amber ct', N'gilbert', N'85296', 1, N'M', CAST(N'2002-03-19 00:00:00.000' AS DateTime), N'tdawg@yahoo.com', N'M', N'Jennifer Hatch', N'480-123-2129', N'Talon is hilarious, but watch him close.', CAST(N'2018-01-25 09:03:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 09:05:00.000' AS DateTime), N'ray')
INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [Phone], [Address], [City], [ZipCode], [Active], [Gender], [Birthdate], [EmailAddr], [GenderPreference], [ResponsibleParty], [ResponsiblePartyContact], [Notes], [CreateDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, N'Kinsey', N'Farmer', N'602-120-2999', N'2928 E Baseline', N'Phoenix', N'85210', 1, N'F', CAST(N'2000-04-02 00:00:00.000' AS DateTime), N'kinsey@mail4me.com', N'F', N'Farrah', N'480-123-1208', N'She needs full attention', CAST(N'2018-01-25 09:01:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 09:06:00.000' AS DateTime), N'ray')
INSERT [dbo].[Client] ([ClientId], [FirstName], [LastName], [Phone], [Address], [City], [ZipCode], [Active], [Gender], [Birthdate], [EmailAddr], [GenderPreference], [ResponsibleParty], [ResponsiblePartyContact], [Notes], [CreateDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (3, N'Calvin', N'Sterling', N'480-123-8787', N'2938 E Broadway Ave', N'Phoenix', N'85292', 1, N'M', CAST(N'1995-01-01 00:00:00.000' AS DateTime), N'CalvinSterling@gmail.com', N'M', N'Mrs Sterling mrsSterling@hotmail.com', N'602-129-9872', N'This HAH, ATC', CAST(N'2018-01-28 20:28:35.000' AS DateTime), N'ray hatch', CAST(N'2018-01-28 20:28:35.000' AS DateTime), N'Ray Hatch')
SET IDENTITY_INSERT [dbo].[Client] OFF
INSERT [dbo].[ClientShiftAssignment] ([ClientId], [DayOfWeek], [Shift], [ProviderId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'Monday', N'Day', 1, CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray')
INSERT [dbo].[ClientShiftAssignment] ([ClientId], [DayOfWeek], [Shift], [ProviderId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'Tuesday', N'Day', NULL, CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray')
INSERT [dbo].[ClientShiftAssignment] ([ClientId], [DayOfWeek], [Shift], [ProviderId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'Wednesday', N'Day', NULL, CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray')
INSERT [dbo].[ClientShiftAssignment] ([ClientId], [DayOfWeek], [Shift], [ProviderId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, N'Monday', N'Morning', 2, CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray')
INSERT [dbo].[ClientShiftAssignment] ([ClientId], [DayOfWeek], [Shift], [ProviderId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, N'Wednesday', N'Morning', NULL, CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray')
INSERT [dbo].[ClientShiftAssignment] ([ClientId], [DayOfWeek], [Shift], [ProviderId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, N'Friday', N'Morning', NULL, CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray')
INSERT [dbo].[ClientSvcCode] ([ClientId], [SvcCode], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'HAH', CAST(N'2018-01-25 09:01:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 09:02:00.000' AS DateTime), N'ray')
INSERT [dbo].[ClientSvcCode] ([ClientId], [SvcCode], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, N'RSP', CAST(N'2018-01-25 09:00:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 09:02:00.000' AS DateTime), N'ray')
INSERT [dbo].[ClientSvcCode] ([ClientId], [SvcCode], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'ATC', CAST(N'2018-01-25 09:15:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 10:01:00.000' AS DateTime), N'ray')
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([ProviderId], [FirstName], [LastName], [Phone], [Address], [City], [ZipCode], [Active], [Gender], [HireDate], [EmailAddr], [Notes], [CreateDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'Chad', N'Heslop', N'480-123-1234', N'222 E Cholla Ave', N'Gilbert', N'85297', 1, N'M', CAST(N'2010-01-01 00:00:00.000' AS DateTime), N'chad.heslop@gmail.com', N'He is a good provider', CAST(N'2018-01-25 09:18:01.000' AS DateTime), N'Ray', CAST(N'2018-01-25 09:26:00.000' AS DateTime), N'Ray')
INSERT [dbo].[Provider] ([ProviderId], [FirstName], [LastName], [Phone], [Address], [City], [ZipCode], [Active], [Gender], [HireDate], [EmailAddr], [Notes], [CreateDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, N'Debbie', N'Frandsen', N'480-233-8443', N'33827 Alyssa Ct', N'Queen Creek', N'85309', 1, N'F', CAST(N'2017-02-03 00:00:00.000' AS DateTime), N'dFrandsen@wydebeam.net', N'She is great with music', CAST(N'2018-01-25 09:00:00.000' AS DateTime), N'Ray', CAST(N'2018-01-25 09:01:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Provider] OFF
INSERT [dbo].[ProviderAvailableShift] ([ProviderId], [DayOfWeek], [Shift], [HasBeenScheduled], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'Monday', N'Day', NULL, CAST(N'2018-01-25 09:00:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 10:00:00.000' AS DateTime), N'ray')
INSERT [dbo].[ProviderAvailableShift] ([ProviderId], [DayOfWeek], [Shift], [HasBeenScheduled], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'Tuesday', N'Day', NULL, CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray')
INSERT [dbo].[ProviderAvailableShift] ([ProviderId], [DayOfWeek], [Shift], [HasBeenScheduled], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'Wednesday', N'Day', NULL, CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray')
INSERT [dbo].[ProviderAvailableShift] ([ProviderId], [DayOfWeek], [Shift], [HasBeenScheduled], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'Thursday', N'Day', NULL, CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray')
INSERT [dbo].[ProviderAvailableShift] ([ProviderId], [DayOfWeek], [Shift], [HasBeenScheduled], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'Friday', N'Day', NULL, CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 00:00:00.000' AS DateTime), N'ray')
INSERT [dbo].[ProviderSvcCode] ([ProviderId], [SvcCode], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'HAH', CAST(N'2018-01-25 09:34:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 10:20:00.000' AS DateTime), N'ray')
INSERT [dbo].[ProviderSvcCode] ([ProviderId], [SvcCode], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'ATC', CAST(N'2018-01-25 08:45:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 08:36:00.000' AS DateTime), N'ray')
INSERT [dbo].[ProviderSvcCode] ([ProviderId], [SvcCode], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, N'RSP', CAST(N'2018-01-25 09:00:00.000' AS DateTime), N'ray', CAST(N'2018-01-25 10:00:00.000' AS DateTime), N'ray')
INSERT [dbo].[SvcCode] ([SvcCodeValue]) VALUES (N'ATC')
INSERT [dbo].[SvcCode] ([SvcCodeValue]) VALUES (N'ECH')
INSERT [dbo].[SvcCode] ([SvcCodeValue]) VALUES (N'HAH')
INSERT [dbo].[SvcCode] ([SvcCodeValue]) VALUES (N'RSP')
INSERT [dbo].[WeekDay] ([DayOfWeek]) VALUES (N'Friday')
INSERT [dbo].[WeekDay] ([DayOfWeek]) VALUES (N'Monday')
INSERT [dbo].[WeekDay] ([DayOfWeek]) VALUES (N'Saturday')
INSERT [dbo].[WeekDay] ([DayOfWeek]) VALUES (N'Sunday')
INSERT [dbo].[WeekDay] ([DayOfWeek]) VALUES (N'Thursday')
INSERT [dbo].[WeekDay] ([DayOfWeek]) VALUES (N'Tuesday')
INSERT [dbo].[WeekDay] ([DayOfWeek]) VALUES (N'Wednesday')
INSERT [dbo].[WorkShift] ([Shift]) VALUES (N'Day')
INSERT [dbo].[WorkShift] ([Shift]) VALUES (N'Evening')
INSERT [dbo].[WorkShift] ([Shift]) VALUES (N'Morning')
INSERT [dbo].[WorkShift] ([Shift]) VALUES (N'Overnight')
ALTER TABLE [dbo].[ClientShiftAssignment]  WITH CHECK ADD  CONSTRAINT [FK_ClientShiftAssignment_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[ClientShiftAssignment] CHECK CONSTRAINT [FK_ClientShiftAssignment_ClientId]
GO
ALTER TABLE [dbo].[ClientShiftAssignment]  WITH CHECK ADD  CONSTRAINT [FK_ClientShiftAssignment_DayOfWeek] FOREIGN KEY([DayOfWeek])
REFERENCES [dbo].[WeekDay] ([DayOfWeek])
GO
ALTER TABLE [dbo].[ClientShiftAssignment] CHECK CONSTRAINT [FK_ClientShiftAssignment_DayOfWeek]
GO
ALTER TABLE [dbo].[ClientShiftAssignment]  WITH CHECK ADD  CONSTRAINT [FK_ClientShiftAssignment_ProviderId] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[ClientShiftAssignment] CHECK CONSTRAINT [FK_ClientShiftAssignment_ProviderId]
GO
ALTER TABLE [dbo].[ClientShiftAssignment]  WITH CHECK ADD  CONSTRAINT [FK_ClientShiftAssignment_WorkShift] FOREIGN KEY([Shift])
REFERENCES [dbo].[WorkShift] ([Shift])
GO
ALTER TABLE [dbo].[ClientShiftAssignment] CHECK CONSTRAINT [FK_ClientShiftAssignment_WorkShift]
GO
ALTER TABLE [dbo].[ClientSvcCode]  WITH CHECK ADD  CONSTRAINT [FK_ClientSvcCode_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[ClientSvcCode] CHECK CONSTRAINT [FK_ClientSvcCode_ClientId]
GO
ALTER TABLE [dbo].[ClientSvcCode]  WITH CHECK ADD  CONSTRAINT [FK_ClientSvcCode_SvcCodeValue] FOREIGN KEY([SvcCode])
REFERENCES [dbo].[SvcCode] ([SvcCodeValue])
GO
ALTER TABLE [dbo].[ClientSvcCode] CHECK CONSTRAINT [FK_ClientSvcCode_SvcCodeValue]
GO
ALTER TABLE [dbo].[ProviderAvailableShift]  WITH CHECK ADD  CONSTRAINT [FK_ProviderAvailableShift_DayOfWeek] FOREIGN KEY([DayOfWeek])
REFERENCES [dbo].[WeekDay] ([DayOfWeek])
GO
ALTER TABLE [dbo].[ProviderAvailableShift] CHECK CONSTRAINT [FK_ProviderAvailableShift_DayOfWeek]
GO
ALTER TABLE [dbo].[ProviderAvailableShift]  WITH CHECK ADD  CONSTRAINT [FK_ProviderAvailableShift_ProviderId] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[ProviderAvailableShift] CHECK CONSTRAINT [FK_ProviderAvailableShift_ProviderId]
GO
ALTER TABLE [dbo].[ProviderAvailableShift]  WITH CHECK ADD  CONSTRAINT [FK_ProviderAvailableShift_WorkShift] FOREIGN KEY([Shift])
REFERENCES [dbo].[WorkShift] ([Shift])
GO
ALTER TABLE [dbo].[ProviderAvailableShift] CHECK CONSTRAINT [FK_ProviderAvailableShift_WorkShift]
GO
ALTER TABLE [dbo].[ProviderSvcCode]  WITH CHECK ADD  CONSTRAINT [FK_ProviderSvcCode_ProviderId] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[ProviderSvcCode] CHECK CONSTRAINT [FK_ProviderSvcCode_ProviderId]
GO
ALTER TABLE [dbo].[ProviderSvcCode]  WITH CHECK ADD  CONSTRAINT [FK_ProviderSvcCode_SvcCodeValue] FOREIGN KEY([SvcCode])
REFERENCES [dbo].[SvcCode] ([SvcCodeValue])
GO
ALTER TABLE [dbo].[ProviderSvcCode] CHECK CONSTRAINT [FK_ProviderSvcCode_SvcCodeValue]
GO
USE [master]
GO
ALTER DATABASE [ClientsProvidersDb] SET  READ_WRITE 
GO
