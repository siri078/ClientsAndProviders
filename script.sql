﻿USE [master]
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
/****** Object:  Table [dbo].[Provider]    Script Date: 3/22/2018 8:19:17 PM ******/
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
	[IsTherapist] [bit] NULL,
 CONSTRAINT [PK_ProviderId] PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProviderAvailableShift]    Script Date: 3/22/2018 8:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  View [dbo].[ProviderAndProviderAvailableShifts]    Script Date: 3/22/2018 8:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProviderAndProviderAvailableShifts]
AS
SELECT        dbo.Provider.ProviderId, dbo.Provider.FirstName, dbo.Provider.LastName, dbo.Provider.Phone, dbo.Provider.City, dbo.Provider.Address, dbo.Provider.ZipCode, dbo.Provider.Active, dbo.Provider.Gender, dbo.Provider.HireDate, 
                         dbo.Provider.EmailAddr, dbo.Provider.Notes, dbo.ProviderAvailableShift.DayOfWeek, dbo.ProviderAvailableShift.Shift, dbo.ProviderAvailableShift.HasBeenScheduled
FROM            dbo.Provider INNER JOIN
                         dbo.ProviderAvailableShift ON dbo.Provider.ProviderId = dbo.ProviderAvailableShift.ProviderId
GO
/****** Object:  Table [dbo].[Client]    Script Date: 3/22/2018 8:19:17 PM ******/
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
/****** Object:  Table [dbo].[ClientShiftAssignment]    Script Date: 3/22/2018 8:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[ClientSvcCode]    Script Date: 3/22/2018 8:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[ProviderSvcCode]    Script Date: 3/22/2018 8:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[SvcCode]    Script Date: 3/22/2018 8:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SvcCode](
	[SvcCodeValue] [varchar](10) NOT NULL,
 CONSTRAINT [PK_SvcCode] PRIMARY KEY CLUSTERED 
(
	[SvcCodeValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeekDay]    Script Date: 3/22/2018 8:19:17 PM ******/
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
/****** Object:  Table [dbo].[WorkShift]    Script Date: 3/22/2018 8:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkShift](
	[Shift] [varchar](20) NOT NULL,
 CONSTRAINT [PK_WorkShift] PRIMARY KEY CLUSTERED 
(
	[Shift] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Provider"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "ProviderAvailableShift"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 136
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProviderAndProviderAvailableShifts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProviderAndProviderAvailableShifts'
GO
