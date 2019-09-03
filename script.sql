USE [master]
GO
/****** Object:  Database [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF]    Script Date: 9/3/2019 12:30:45 PM ******/
CREATE DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HeadCount', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HeadCount.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HeadCount_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HeadCount_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET ARITHABORT OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET  DISABLE_BROKER 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET  MULTI_USER 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET DELAYED_DURABILITY = DISABLED 
GO
USE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF]
GO
/****** Object:  Table [dbo].[AppConfig]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AppSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Calendar](
	[dt] [smalldatetime] NOT NULL,
	[isWeekday] [bit] NULL,
	[isHoliday] [bit] NULL,
	[Y] [smallint] NULL,
	[FY] [smallint] NULL,
	[Q] [tinyint] NULL,
	[M] [tinyint] NULL,
	[D] [tinyint] NULL,
	[DW] [tinyint] NULL,
	[monthname] [varchar](9) NULL,
	[dayname] [varchar](9) NULL,
	[W] [tinyint] NULL,
	[UTCOffset] [tinyint] NULL,
	[HolidayDescription] [varchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[dt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HeadCount]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HeadCount](
	[HeadCountID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [varchar](100) NULL,
	[Forename] [varchar](100) NULL,
	[Personnel_NO] [varchar](100) NULL,
	[StatusID] [int] NULL,
	[HiringCompanyID] [int] NULL,
	[SAP_PositionID] [varchar](100) NULL,
	[PositionName] [varchar](100) NULL,
	[OrganizationID] [int] NULL,
	[LineManagerID] [int] NULL,
	[LineManager_NO] [varchar](100) NULL,
	[SAP_Org_Chart] [bit] NULL,
	[C_BAY] [bit] NULL,
	[I_Phone] [bit] NULL,
	[SecurityPassID] [int] NULL,
	[ApproveManagerID] [int] NULL,
	[UserID] [varchar](50) NULL,
	[Phone_Extn] [varchar](20) NULL,
	[IT_Hardware] [varchar](200) NULL,
	[CreatedBy] [varchar](10) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](10) NULL,
	[UpdatedDate] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[ExpectedEndDate] [datetime] NULL,
	[Active] [bit] NULL,
	[ActualEndDate] [datetime] NULL,
	[IsSubmitted] [bit] NULL,
	[IsSaved] [bit] NULL,
	[IsSecurityEdited] [bit] NULL,
	[SAP_Position_Code] [nvarchar](50) NULL,
	[FTE] [nvarchar](50) NULL,
	[LocalPositionCode] [nvarchar](50) NULL,
	[LocationID] [int] NULL,
	[Desk] [bit] NULL,
	[RoleTypeID] [int] NULL,
 CONSTRAINT [PK_HeadCount_HeadCountID] PRIMARY KEY CLUSTERED 
(
	[HeadCountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Help]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Help](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NULL,
	[Description] [varchar](max) NULL,
	[Url] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HiringCompany]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HiringCompany](
	[HiringCompanyID] [int] IDENTITY(1,1) NOT NULL,
	[HiringCompanyName] [nvarchar](100) NULL,
	[HiringCompanyDescription] [nvarchar](500) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[LookupTypeID] [bigint] NOT NULL,
 CONSTRAINT [PK_HiringCompanyID] PRIMARY KEY CLUSTERED 
(
	[HiringCompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LocalPosition]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocalPosition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LocalPositionCode] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[LookupTypeID] [bigint] NOT NULL,
 CONSTRAINT [PK_TemporaryPositionID] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](50) NULL,
	[LocationDescription] [nvarchar](200) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[LookupTypeID] [bigint] NOT NULL,
 CONSTRAINT [PK_LocationID] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lookup]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lookup](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LookupTypeID] [bigint] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](4000) NULL,
	[OrderBy] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ParentID] [bigint] NULL,
	[SecurityNo] [int] NULL,
	[Audit_UpdatedBy] [nvarchar](50) NOT NULL,
	[Audit_UpdatedDate] [smalldatetime] NOT NULL,
	[Audit_CreatedBy] [nvarchar](50) NOT NULL,
	[Audit_CreatedDate] [smalldatetime] NOT NULL,
	[ReferenceID] [int] NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Lookup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LookupType]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LookupType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](64) NOT NULL,
	[SecurityNo] [int] NOT NULL,
	[Audit_UpdatedBy] [nvarchar](50) NOT NULL,
	[Audit_UpdatedDate] [smalldatetime] NOT NULL,
	[Audit_CreatedBy] [nvarchar](50) NOT NULL,
	[Audit_CreatedDate] [smalldatetime] NOT NULL,
	[LookupTypeALIAS] [nvarchar](200) NULL,
 CONSTRAINT [PK_LookupType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationName] [nvarchar](100) NULL,
	[OrganizationDescription] [nvarchar](500) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[LookupTypeID] [bigint] NOT NULL,
 CONSTRAINT [PK_OrganizationID] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Position]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[LookupTypeID] [bigint] NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reports]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NULL,
	[Description] [varchar](max) NULL,
	[Url] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleType]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleType](
	[RoleTypeId] [int] IDENTITY(1,1) NOT NULL,
	[RoleTypeName] [nvarchar](50) NULL,
	[RoleTypeDescription] [nvarchar](200) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[LookupTypeID] [bigint] NOT NULL,
 CONSTRAINT [PK_RoleType] PRIMARY KEY CLUSTERED 
(
	[RoleTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecurityPass]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityPass](
	[SecurityPassID] [int] IDENTITY(1,1) NOT NULL,
	[SecurityPassName] [nvarchar](100) NULL,
	[SecurityPassDescription] [nvarchar](500) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[LookupTypeID] [bigint] NOT NULL,
 CONSTRAINT [PK_SecurityPassID] PRIMARY KEY CLUSTERED 
(
	[SecurityPassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NULL,
	[StatusDescription] [nvarchar](200) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[LookupTypeID] [bigint] NOT NULL,
 CONSTRAINT [PK_StatusID] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UploadFileDetails]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UploadFileDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HeadCountID] [int] NOT NULL,
	[Name_File] [varchar](200) NOT NULL,
	[DisplayName] [varchar](100) NULL,
	[Extension] [varchar](10) NOT NULL,
	[ContentType] [varchar](200) NULL,
	[FileData] [varbinary](max) NOT NULL,
	[FileSize] [bigint] NULL,
	[CreatedBy] [varchar](10) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](10) NULL,
	[UpdatedDate] [datetime] NULL,
	[UploadType] [varchar](200) NOT NULL,
 CONSTRAINT [PK_UploadFileDetails_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAuth]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAuth](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](8000) NULL,
	[Email] [varchar](8000) NULL,
	[PrimaryEmail] [varchar](8000) NULL,
	[FirstName] [varchar](8000) NULL,
	[LastName] [varchar](8000) NULL,
	[DisplayName] [varchar](8000) NULL,
	[BirthDate] [datetime] NULL,
	[BirthDateRaw] [varchar](8000) NULL,
	[Country] [varchar](8000) NULL,
	[Culture] [varchar](8000) NULL,
	[FullName] [varchar](8000) NULL,
	[Gender] [varchar](8000) NULL,
	[Language] [varchar](8000) NULL,
	[MailAddress] [varchar](8000) NULL,
	[Nickname] [varchar](8000) NULL,
	[PostalCode] [varchar](8000) NULL,
	[TimeZone] [varchar](8000) NULL,
	[Salt] [varchar](8000) NULL,
	[PasswordHash] [varchar](8000) NULL,
	[DigestHa1Hash] [varchar](8000) NULL,
	[Roles] [varchar](8000) NULL,
	[Permissions] [varchar](8000) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[RefId] [int] NULL,
	[RefIdStr] [varchar](8000) NULL,
	[Meta] [varchar](8000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAuthAccessLog]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAuthAccessLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[DateAccessed] [datetime] NOT NULL,
 CONSTRAINT [PK_UserAuthAccessLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[RoleDescription] [nvarchar](200) NULL,
	[UpdatedBy] [nvarchar](15) NULL,
	[UpdateDate] [datetime] NULL,
	[CreatedBy] [nvarchar](15) NULL,
	[CreatedDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[LookupTypeID] [bigint] NOT NULL,
 CONSTRAINT [PK_RoleID] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_1]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        emp.HeadCountID, emp.PositionName, emp.Surname, emp.Forename, emp.LineManagerID, COUNT(*) AS Emps, emp.LocalPositionCode
FROM            dbo.HeadCount AS emp LEFT OUTER JOIN
                         dbo.HeadCount AS emp_count ON emp.HeadCountID = emp_count.LineManagerID
GROUP BY emp.HeadCountID, emp.Surname, emp.Forename, emp.LineManagerID, emp.PositionName, emp.LocalPositionCode

GO
ALTER TABLE [dbo].[HeadCount]  WITH CHECK ADD  CONSTRAINT [FK_HeadCount_HiringCompany] FOREIGN KEY([HiringCompanyID])
REFERENCES [dbo].[HiringCompany] ([HiringCompanyID])
GO
ALTER TABLE [dbo].[HeadCount] CHECK CONSTRAINT [FK_HeadCount_HiringCompany]
GO
ALTER TABLE [dbo].[HeadCount]  WITH CHECK ADD  CONSTRAINT [FK_HeadCount_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([OrganizationID])
GO
ALTER TABLE [dbo].[HeadCount] CHECK CONSTRAINT [FK_HeadCount_Organization]
GO
ALTER TABLE [dbo].[HeadCount]  WITH CHECK ADD  CONSTRAINT [FK_HeadCount_SecurityPass] FOREIGN KEY([SecurityPassID])
REFERENCES [dbo].[SecurityPass] ([SecurityPassID])
GO
ALTER TABLE [dbo].[HeadCount] CHECK CONSTRAINT [FK_HeadCount_SecurityPass]
GO
ALTER TABLE [dbo].[HeadCount]  WITH CHECK ADD  CONSTRAINT [FK_HeadCount_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[HeadCount] CHECK CONSTRAINT [FK_HeadCount_Status]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetHeadcountDetailById]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetHeadcountDetailById]
	 @Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT H.* ,S.StatusName, Hr.HiringCompanyName,O.OrganizationName,Sec.SecurityPassName, 
   HL.Surname + ',' + HL.Forename  AS LineManagerName  , HA.Surname + ',' + HA.Forename AS ApproveManagerName From HeadCount H 
   LEFT OUTER JOIN Status S ON H.StatusID = S.StatusID 
   LEFT OUTER JOIN HiringCompany Hr ON H.HiringCompanyID = Hr.HiringCompanyID
   LEFT OUTER JOIN Organization O ON H.OrganizationID = O.OrganizationID
   LEFT OUTER JOIN SecurityPass Sec ON H.SecurityPassID = Sec.SecurityPassID
   LEFT OUTER JOIN HeadCount HL ON H.LineManagerID = HL.HeadCountID
   LEFT OUTER JOIN HeadCount HA ON H.ApproveManagerID = HA.HeadCountID
   WHERE H.HeadCountID =  @Id
   
   
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetHeadcountDetailList]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetHeadcountDetailList]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT
   H.HeadCountID,
    H.Forename,
   H.Surname,
   (H.Forename + ' ' + H.Surname) As FullName,
   H.Personnel_NO,
   H.UserID,
   H.ExpectedEndDate,
   H.PositionName,H.StartDate,H.ExpectedEndDate,
   S.StatusName, Hr.HiringCompanyName,O.OrganizationName,Sec.SecurityPassName,
   LM.DisplayName AS LineManagerName  , AM.DisplayName AS ApproveManagerName  From HeadCount H 
   LEFT OUTER JOIN Status S ON H.StatusID = S.StatusID 
   LEFT OUTER JOIN HiringCompany Hr ON H.HiringCompanyID = Hr.HiringCompanyID
   LEFT OUTER JOIN Organization O ON H.OrganizationID = O.OrganizationID
   LEFT OUTER JOIN SecurityPass Sec ON H.SecurityPassID = Sec.SecurityPassID
   LEFT OUTER JOIN UserAuth LM ON H.LineManagerID = LM.Id
   LEFT OUTER JOIN UserAuth AM ON H.ApproveManagerID = AM.Id
   
   
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GETLookup]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GETLookup]
    
    @lookupTypeId int,	
	@Return_Message VARCHAR(1024) = ''  OUT
AS
BEGIN

/******************************
*  Variable Declarations
*******************************/
    DECLARE     @ErrorCode  int  
    DECLARE     @ErrorStep  varchar(200)
    DECLARE @exisitingID INT
/******************************
*  Initialize Variables
*******************************/

SELECT @ErrorCode = @@ERROR
    

BEGIN TRY
    
IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='STATUS')
 BEGIN 
 Select [StatusID] as [ID],
        [LookupTypeID] as [LookupTypeID],
        StatusName as [Name],
	    StatusDescription as [Description],
	    Active,
	    UpdatedBy as [Audit_UpdatedBy],
	    Updatedate as [Audit_UpdatedDate],
	    CreatedBy as [Audit_CreatedBy],
	    CreatedDate as [Audit_CreatedDate]	
	    from  [Status]
        where LookupTypeID=@lookupTypeId	 
  END 
Else  IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='HIRINGCOMP') 
BEGIN 
 
Select [HiringCompanyID] as [ID],
    [LookupTypeID] as [LookupTypeID],
    HiringCompanyName as [Name],
	HiringCompanyDescription as [Description],
	Active,
	UpdatedBy as [Audit_UpdatedBy],
	Updatedate as [Audit_UpdatedDate],
	CreatedBy as [Audit_CreatedBy],
	CreatedDate as [Audit_CreatedDate]	
	 from  HiringCompany
    where LookupTypeID=@lookupTypeId	
    
 END
   


Else  IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='ORGANIZATION')

begin

Select [OrganizationID] as [ID],
    [LookupTypeID] as [LookupTypeID],
    OrganizationName as [Name],
	OrganizationDescription as [Description],
	Active,
	UpdatedBy as [Audit_UpdatedBy],
	Updatedate as [Audit_UpdatedDate],
	CreatedBy as [Audit_CreatedBy],
	CreatedDate as [Audit_CreatedDate]	
	 from  Organization
    where LookupTypeID=@lookupTypeId	
     
 END
Else  IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='SECURITYPASS') 
Begin 
   Select [SecurityPassID] as [ID],
    [LookupTypeID] as [LookupTypeID],
    SecurityPassName as [Name],
	SecurityPassDescription as [Description],
	Active,
	UpdatedBy as [Audit_UpdatedBy],
	Updatedate as [Audit_UpdatedDate],
	CreatedBy as [Audit_CreatedBy],
	CreatedDate as [Audit_CreatedDate]	
	 from  SecurityPass
    where LookupTypeID=@lookupTypeId	
     
 END
 Else  IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='POSITION') 
Begin 
   Select [Id] as [ID],
    [LookupTypeID] as [LookupTypeID],
    PositionName as [Name],
	Description as [Description],
	Active,
	UpdatedBy as [Audit_UpdatedBy],
	Updatedate as [Audit_UpdatedDate],
	CreatedBy as [Audit_CreatedBy],
	CreatedDate as [Audit_CreatedDate]	
	 from  POSITION
    where LookupTypeID=@lookupTypeId	
     
 END
 Else  IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='LOCALPOSITION') 
Begin 
   Select [Id] as [ID],
    [LookupTypeID] as [LookupTypeID],
    LocalPositionCode as [Name],
	Description as [Description],
	Active,
	UpdatedBy as [Audit_UpdatedBy],
	Updatedate as [Audit_UpdatedDate],
	CreatedBy as [Audit_CreatedBy],
	CreatedDate as [Audit_CreatedDate]	
	 from  LocalPosition
    where LookupTypeID=@lookupTypeId	
     
 END
 Else  IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='LOCATION') 
Begin 
   Select [LocationId] as [ID],
    [LookupTypeID] as [LookupTypeID],
    LocationName as [Name],
	LocationDescription as [Description],
	Active,
	UpdatedBy as [Audit_UpdatedBy],
	Updatedate as [Audit_UpdatedDate],
	CreatedBy as [Audit_CreatedBy],
	CreatedDate as [Audit_CreatedDate]	
	 from  Location
    where LookupTypeID=@lookupTypeId	
     
 END

 Else If @lookupTypeId=(Select ID from LookupType where LookupTypeALIAS='ROLEOFTYPE')
 Begin
	Select [RoleTypeId] as [ID],
		   [LookupTypeID] as [LookupTypeID],
		   RoleTypeName as [Name],
		   RoleTypeDescription as [Description],
		   Active,
			UpdatedBy as [Audit_UpdatedBy],
			Updatedate as [Audit_UpdatedDate],
			CreatedBy as [Audit_CreatedBy],
			CreatedDate as [Audit_CreatedDate]
			from RoleType
	where LookupTypeID=@lookupTypeId	

 End
 

 SELECT  @ErrorCode  = 0, @Return_Message = 'Done'

    /*************************************
    *  Return from the Stored Procedure
    *************************************/
    RETURN @ErrorCode                               -- =0 if success,  <>0 if failure

END TRY

BEGIN CATCH
    /*************************************
    *  Get the Error Message for @@Error
    *************************************/
   

    SELECT @ErrorCode = ERROR_NUMBER()
        , @Return_Message = @ErrorStep + ' '
        + cast(ERROR_NUMBER() as varchar(20)) + ' line: '
        + cast(ERROR_LINE() as varchar(20)) + ' ' 
        + ERROR_MESSAGE() + ' > ' 
        + ERROR_PROCEDURE()

    /*************************************
    *  Return from the Stored Procedure
    *************************************/
    RETURN @ErrorCode                               -- =0 if success,  <>0 if failure

END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GETReportLookup]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GETReportLookup]
@LookupTypeALIAS nvarchar(100)
As   
BEGIN

IF @LookupTypeALIAS ='LINEMANAGER'
	BEGIN 
		Select Distinct H.LineManagerID as ID,
		(LM.Surname +', '+LM.Forename ) AS DisplayName   
		From HeadCount H  
		LEFT OUTER JOIN HeadCount LM ON H.LineManagerID = LM.HeadCountID 		
		where H.LineManagerID IS Not null   	 
	END 
  Else  IF  @LookupTypeALIAS='HIRINGCOMP'
	BEGIN 
 
		Select [HiringCompanyID] as [ID],    
		HiringCompanyName AS DisplayName		
		from  HiringCompany			
    
	END
 Else  IF @LookupTypeALIAS='ORGANIZATION'
	begin
		Select [OrganizationID] as [ID],
        OrganizationName AS DisplayName
		from  Organization		  
	END
  Else  IF @LookupTypeALIAS='SECURITYPASS' 
	begin
		Select [SecurityPassID] as [ID],    
		SecurityPassName AS DisplayName		
		from  SecurityPass		 
	END
  Else  IF @LookupTypeALIAS='STATUS' 
	begin
		Select [StatusID] as [ID],    
		StatusName AS DisplayName		
		from  [Status]		 
	END
        Else  IF @LookupTypeALIAS='Location' 
	begin
		Select LocationID as [ID],    
		LocationName AS DisplayName		
		from  Location		 
	END                      
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetUploadedFilesByHeadcountId]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUploadedFilesByHeadcountId] 
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT ID,Name_File,HeadCountID,DisplayName ,FileData,
    Extension,ContentType,FileSize,CreatedBy,CreatedDate,UpdatedBy,UpdatedDate,UploadType
    From UploadFileDetails where HeadCountID= @Id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_SaveLookup]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SaveLookup]
    
    @name nvarchar (50),
	@description nvarchar (200),
	@active bit,
	@UpdatedBy nvarchar (50),
	@UpdateDate datetime,
	@CreatedBy nvarchar (50),
	@CreatedDate datetime,
	@lookupTypeId int,
	@lookupId int,
	@Return_Message VARCHAR(1024) = ''  OUT
AS
BEGIN

/******************************
*  Variable Declarations
*******************************/
    DECLARE     @ErrorCode  int  
    DECLARE     @ErrorStep  varchar(200)
    DECLARE @exisitingID INT
/******************************
*  Initialize Variables
*******************************/

    SELECT @ErrorCode = @@ERROR
    

BEGIN TRY
 BEGIN TRAN  
   
  IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='STATUS') 
   BEGIN 
    IF(@lookupId =0 OR @lookupId is null)
     BEGIN 
		 INSERT INTO [Status]
			(  
				LookupTypeID,   
				StatusName,
				StatusDescription,
				Active,
				UpdatedBy,
				UpdateDate,
				CreatedBy,
				CreatedDate
			)
			VALUES 
			(
			    @lookupTypeId,
				@name ,
				@description ,
				@active ,
				@UpdatedBy ,
				@UpdateDate ,
				@CreatedBy ,
				@CreatedDate 
			)		
	    
       END
    ELSE
		 BEGIN 
			  Update [Status]
			  Set StatusName=@name,
				  StatusDescription=@description,
				  Active=@active,
				  UpdatedBy=@UpdatedBy,
				  UpdateDate=@UpdateDate
			  where StatusID = @lookupId 
			  and LookupTypeID=@lookupTypeId
		  END     
     END 
Else  IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='HIRINGCOMP') 

BEGIN 
  IF(@lookupId =0 OR @lookupId is null)
			BEGIN 
				INSERT INTO HiringCompany
				(   
				LookupTypeID,  
				HiringCompanyName,
				HiringCompanyDescription,
				Active,
				UpdatedBy,
				UpdateDate,
				CreatedBy,
				CreatedDate
				)
				VALUES 
				(
				@lookupTypeId,
				@name ,
				@description ,
				@active ,
				@UpdatedBy ,
				@UpdateDate ,
				@CreatedBy ,
				@CreatedDate )				
	
			END
    ELSE
		 BEGIN 
			  Update HiringCompany 
			  Set HiringCompanyName=@name,
				  HiringCompanyDescription=@description,
				  Active=@active,
				  UpdatedBy=@UpdatedBy,
				  UpdateDate=@UpdateDate
			  where HiringCompanyID = @lookupId 
			  and LookupTypeID=@lookupTypeId
			  
			END
	END


Else  IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='ORGANIZATION')

BEGIN 
  if(@lookupId =0 OR @lookupId is null)
			BEGIN 
					INSERT INTO ORGANIZATION
					(    
					LookupTypeID, 
					ORGANIZATIONName,
					ORGANIZATIONDescription,
					Active,
					UpdatedBy,
					UpdateDate,
					CreatedBy,
					CreatedDate
					)
					VALUES 
					(
					@lookupTypeId,
					@name ,
					@description ,
					@active ,
					@UpdatedBy ,
					@UpdateDate ,
					@CreatedBy ,
					@CreatedDate )					
					
			END
    ELSE
			BEGIN 
			  Update ORGANIZATION 
			  Set ORGANIZATIONName=@name,
				  ORGANIZATIONDescription=@description,
				  Active=@active,
				  UpdatedBy=@UpdatedBy,
				  UpdateDate=@UpdateDate
			  where ORGANIZATIONID = @lookupId 
			  and LookupTypeID=@lookupTypeId
			END
	END

Else  IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='SECURITYPASS') 
   
 BEGIN 
  if(@lookupId =0 OR @lookupId is null)
			BEGIN 
				INSERT INTO SecurityPass
				(  
				LookupTypeID,  
				SecurityPassName,
				SecurityPassDescription,
				Active,
				UpdatedBy,
				UpdateDate,
				CreatedBy,
				CreatedDate
				)
				VALUES 
				(
				@lookupTypeId,
				@name ,
				@description ,
				@active ,
				@UpdatedBy ,
				@UpdateDate ,
				@CreatedBy ,
				@CreatedDate )
				

			END
    ELSE
      BEGIN 
		  Update SecurityPass 
		  Set SecurityPassName=@name,
			  SecurityPassDescription=@description,
			  Active=@active,
			  UpdatedBy=@UpdatedBy,
			  UpdateDate=@UpdateDate
		  where SecurityPassID = @lookupId 
			  and LookupTypeID=@lookupTypeId
      END
  END 
  
  Else  IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='POSITION') 
   
 BEGIN 
  if(@lookupId =0 OR @lookupId is null)
			BEGIN 
				INSERT INTO POSITION
				(  
				LookupTypeID,  
				PositionName,
				Description,
				Active,
				UpdatedBy,
				UpdateDate,
				CreatedBy,
				CreatedDate
				)
				VALUES 
				(
				@lookupTypeId,
				@name ,
				@description ,
				@active ,
				@UpdatedBy ,
				@UpdateDate ,
				@CreatedBy ,
				@CreatedDate )
				

			END
    ELSE
      BEGIN 
		  Update POSITION 
		  Set PositionName=@name,
			  Description=@description,
			  Active=@active,
			  UpdatedBy=@UpdatedBy,
			  UpdateDate=@UpdateDate
		  where Id = @lookupId 
			  and LookupTypeID=@lookupTypeId
      END
  END   
     Else  IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='LOCALPOSITION') 
   
 BEGIN 
  if(@lookupId =0 OR @lookupId is null)
			BEGIN 
				INSERT INTO LocalPosition 
				(  
				LookupTypeID,  
				LocalPositionCode ,
				Description,
				Active,
				UpdatedBy,
				UpdateDate,
				CreatedBy,
				CreatedDate
				)
				VALUES 
				(
				@lookupTypeId,
				@name ,
				@description ,
				@active ,
				@UpdatedBy ,
				@UpdateDate ,
				@CreatedBy ,
				@CreatedDate )
				

			END
    ELSE
      BEGIN 
		  Update LocalPosition 
		  Set LocalPositionCode=@name,
			  Description=@description,
			  Active=@active,
			  UpdatedBy=@UpdatedBy,
			  UpdateDate=@UpdateDate
		  where Id = @lookupId 
			  and LookupTypeID=@lookupTypeId
      END
  END   
    
  Else  IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='LOCATION') 
   
 BEGIN 
  if(@lookupId =0 OR @lookupId is null)
			BEGIN 
				INSERT INTO LOCATION 
				(
				LookupTypeID,   
				LocationName,  
				LocationDescription ,
				UpdatedBy,
				UpdateDate,
				CreatedBy,
				CreatedDate,
				Active
				)
				VALUES 
				(
				@lookupTypeId,
				@name ,
				@description ,
				@UpdatedBy ,
				@UpdateDate ,
				@CreatedBy ,
				@CreatedDate,
				@active  )
				

			END
    ELSE
      BEGIN 
		  Update LOCATION 
		  Set LocationName=@name,
			  LocationDescription=@description,
			  Active=@active,
			  UpdatedBy=@UpdatedBy,
			  UpdateDate=@UpdateDate
		  where LocationID = @lookupId 
			  and LookupTypeID=@lookupTypeId
      END
  END   
  ELSE IF @lookupTypeId = (Select ID from LookupType where LookupTypeALIAS='ROLEOFTYPE')

 BEGIN
	if(@lookupId=0 OR @lookupId is null)
		BEGIN
			INSERT INTO RoleType
			(
			LookupTypeID,
			RoleTypeName,
			RoleTypeDescription,
			UpdatedBy,
			UpdateDate,
			CreatedBy,
			CreatedDate,
			Active
			)
			VALUES
			(
			@lookupTypeId,
			@name,
			@description,
			@UpdatedBy,
			@UpdateDate,
			@CreatedBy,
			@CreatedDate,
			@active
			)
		END
	ELSE
		BEGIN
			Update RoleType
			Set RoleTypeName=@name,
				RoleTypeDescription=@description,
				Active=@active,
				UpdatedBy=@UpdatedBy,
				UpdateDate=@UpdateDate
			where RoleTypeID=@lookupId
				and LookupTypeID=@lookupTypeId
		END
 END
    
  
  COMMIT TRAN

    SELECT  @ErrorCode  = 0, @Return_Message = 'All data was moved over'

    /*************************************
    *  Return from the Stored Procedure
    *************************************/
    RETURN @ErrorCode                               -- =0 if success,  <>0 if failure

END TRY
BEGIN CATCH
    /*************************************
    *  Get the Error Message for @@Error
    *************************************/
    IF @@TRANCOUNT > 0 ROLLBACK TRAN

    SELECT @ErrorCode = ERROR_NUMBER()
        , @Return_Message = @ErrorStep + ' '
        + cast(ERROR_NUMBER() as varchar(20)) + ' line: '
        + cast(ERROR_LINE() as varchar(20)) + ' ' 
        + ERROR_MESSAGE() + ' > ' 
        + ERROR_PROCEDURE()

    /*************************************
    *  Return from the Stored Procedure
    *************************************/
    RETURN @ErrorCode                               -- =0 if success,  <>0 if failure
END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[sp_ServerExpotToExcelReport]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ServerExpotToExcelReport]
	@SAP_Org_Chart NVARCHAR(2),
	@C_BAY NVARCHAR(2),
	@Active NVARCHAR(2)='',
	@SecurityPassID NVARCHAR(20),
	@OrganizationID NVARCHAR(20),
	@HiringCompanyID NVARCHAR(20),
	@LineManagerID NVARCHAR(20)	

	/*- Pagination Parameters */
  -- @PageNo INT = 1,
  -- @PageSize INT = 10,
   /*- Sorting Parameters */
   --@SortColumn NVARCHAR(20) = 'H.Surname',
   --@SortOrder NVARCHAR(4)='ASC'	
AS
BEGIN
	
	SET NOCOUNT ON;

       
  -- DECLARE @lSortCol NVARCHAR(20)    
    DECLARE @sql varchar(max)
	DECLARE @filter nvarchar(1000)    
   -- SET @lSortCol = LTRIM(RTRIM(@SortColumn))


 /*- Pagination Parameters not needed */
   --DECLARE 
   -- @lPageNbr INT,
    --@lPageSize INT,
    --@lFirstRec INT,
   -- @lLastRec INT,
   -- @lTotalRows INT
    --SET @lPageNbr = @PageNo
    --SET @lPageSize = @PageSize
   -- SET @lFirstRec = ( @lPageNbr - 1 ) * @lPageSize
   -- SET @lLastRec = ( @lPageNbr * @lPageSize + 1 )
   -- SET @lTotalRows = @lFirstRec - @lLastRec + 1
    
    /*- Pagination Parameters */
       
    
	--SET @sql=''	
	
	
	
	 
	--SET @sql= @sql + 'WITH CTE_Results
	--				AS (
	--				SELECT ROW_NUMBER() OVER (ORDER BY ' + @lSortCol + ' ' + @SortOrder + '						 
	--				)AS ROWNUM ,
	--				Count(*) over () AS TotalCount,'
   
		  SET @sql= 'Select 
   H.HeadCountID,
   H.Surname,
   H.Forename,   
   (H.Surname +'', ''+H.Forename ) As FullName,
   H.UserID,
   S.StatusName,
   O.OrganizationName,
   Sec.SecurityPassName,
   Hr.HiringCompanyName,
   (LM.Surname +'', ''+LM.Forename ) AS LineManagerName ,
   H.LineManager_NO,
   (AM.Surname +'', ''+AM.Forename ) AS ApproveManagerName ,
   H.Personnel_NO,
   H.SAP_PositionID,
   H.PositionName,
   H.FTE,
   L.LocationName,
   CASE 
     WHEN H.SAP_Org_Chart = 1 THEN '+'''Yes'''+
   ' WHEN H.SAP_Org_Chart = 0 THEN '+'''No'''+
   ' ELSE '+''' '''+' END AS SAP_Org_Chart
   ,
   CASE 
     WHEN H.C_BAY = 1 THEN '+'''Yes'''+
   ' WHEN H.C_BAY = 0 THEN '+'''No'''+
   ' ELSE '+''' '''+' END AS C_BAY
   ,
   CASE 
     WHEN H.I_Phone = 1 THEN '+'''Yes'''+
   ' WHEN H.I_Phone = 0 THEN '+'''No'''+
   ' ELSE '+''' '''+' END AS I_Phone
   , 
   H.Phone_Extn,
   H.IT_Hardware,
   REPLACE(CONVERT(NVARCHAR,H.StartDate , 106),'+''' '''+', '+'''-'''+') as [StartDate],
   REPLACE(CONVERT(NVARCHAR,H.ExpectedEndDate , 106),'+''' '''+', '+'''-'''+') as [ExpectedEndDate],
   CASE 
     WHEN H.Active = 1 THEN '+'''Yes'''+
   ' WHEN H.Active = 0 THEN '+'''No'''+
   ' ELSE '+''' '''+' END AS Active
   ,  
   REPLACE(CONVERT(NVARCHAR,H.ActualEndDate , 106),'+''' '''+', '+'''-'''+') as [ActualEndDate],
   
   CASE 
     WHEN H.Desk = 1 THEN '+'''Yes'''+
   ' WHEN H.Desk = 0 THEN '+'''No'''+
   ' ELSE '+''' '''+' END AS Desk
   ,
   CASE 
     WHEN H.IsSubmitted = 1 THEN '+'''Yes'''+
   ' WHEN H.IsSubmitted = 0 THEN '+'''No'''+
   ' ELSE '+''' '''+' END AS IsSubmitted
   ,
   CASE 
     WHEN H.IsSaved = 1 THEN '+'''Yes'''+
   ' WHEN H.IsSaved = 0 THEN '+'''No'''+
   ' ELSE '+''' '''+' END AS IsSaved
   ,
   CASE 
     WHEN H.IsSecurityEdited = 1 THEN '+'''Yes'''+
   ' WHEN H.IsSecurityEdited = 0 THEN '+'''No'''+
   ' ELSE '+''' '''+' END AS IsSecurityEdited
   ,   
   H.LocalPositionCode    
   From HeadCount H 
   LEFT OUTER JOIN Status S ON H.StatusID = S.StatusID 
   LEFT OUTER JOIN HiringCompany Hr ON H.HiringCompanyID = Hr.HiringCompanyID
   LEFT OUTER JOIN Organization O ON H.OrganizationID = O.OrganizationID
   LEFT OUTER JOIN SecurityPass Sec ON H.SecurityPassID = Sec.SecurityPassID
   LEFT OUTER JOIN HeadCount LM ON H.LineManagerID = LM.HeadCountID
   LEFT OUTER JOIN HeadCount AM ON H.ApproveManagerID = AM.HeadCountID 
   LEFT OUTER JOIN Location L ON H.LocationID = L.LocationID 
   where 1=1'
							
					 		   
		 
	
	
	IF @SAP_Org_Chart <> -1 
	BEGIN	
		 SET @sql = @sql + ' and H.SAP_Org_Chart= ''' + @SAP_Org_Chart + ''''
		 
	END 
	   IF @C_BAY <>-1
	BEGIN
	     SET @sql = @sql + ' and H.C_BAY= ''' + @C_BAY + ''''
	     
	END	
	IF @Active <>-1
	BEGIN
	     SET @sql = @sql + ' and H.Active= ''' + @Active + ''''
	     
	END	   
	   IF @SecurityPassID <> -1
	BEGIN
		 SET @sql = @sql + ' and H.SecurityPassID ='''+ @SecurityPassID +''''
		 
	END
	   IF @OrganizationID <>-1
	BEGIN
		 SET @sql = @sql + ' and H.OrganizationID='''+ @OrganizationID +''''
		 
	END
	   IF @HiringCompanyID <>-1
	BEGIN
	     SET @sql = @sql + ' and H.HiringCompanyID='''+@HiringCompanyID +''''
	END
	 IF @LineManagerID <> -1
	BEGIN
	     SET @sql = @sql + ' and H.LineManagerID='''+@LineManagerID +''''
	END
	
	Set @sql = @sql+' ORDER BY H.Surname ASC '
	--Set @sql = @sql+' ORDER BY ' + @lSortCol + ' ' + @SortOrder + '	'
	
	--SET @sql = @sql + ')
	--SELECT 
	--CPC.*
   -- FROM CTE_Results AS CPC'
	--WHERE
     -- ROWNUM  > '+ cast(@lFirstRec as nvarchar) +
      --' AND ROWNUM  < '  + cast(@lLastRec as nvarchar)
	
    print @sql
 
    EXEC (@sql)
   
   
   
   
   
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ServerSidePagedReport]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ServerSidePagedReport]
	@SAP_Org_Chart NVARCHAR(2),
	@C_BAY NVARCHAR(2),
	@Active NVARCHAR(2) ='',
	@SecurityPassID NVARCHAR(20),
	@OrganizationID NVARCHAR(20),
	@HiringCompanyID NVARCHAR(20),
	@LineManagerID NVARCHAR(20),	

	/*- Pagination Parameters */
   @PageNo INT = 1,
   @PageSize INT = 10,
   /*- Sorting Parameters */
   @SortColumn NVARCHAR(20) = 'H.Surname',
   @SortOrder NVARCHAR(4)='ASC'	
AS
BEGIN
	
	SET NOCOUNT ON;

    DECLARE
	@lPageNbr INT,
    @lPageSize INT,
    @lSortCol NVARCHAR(20),
    @lFirstRec INT,
    @lLastRec INT,
    @lTotalRows INT
    DECLARE @sql varchar(max)
	DECLARE @filter nvarchar(1000)
    SET @lPageNbr = @PageNo
    SET @lPageSize = @PageSize
    SET @lSortCol = LTRIM(RTRIM(@SortColumn))

    SET @lFirstRec = ( @lPageNbr - 1 ) * @lPageSize
    SET @lLastRec = ( @lPageNbr * @lPageSize + 1 )
    SET @lTotalRows = @lFirstRec - @lLastRec + 1
       
    
	SET @sql=''	
	
	
	
	 
	SET @sql= @sql + 'WITH CTE_Results
					AS (
					SELECT ROW_NUMBER() OVER (ORDER BY ' + @lSortCol + ' ' + @SortOrder + '						 
					)AS ROWNUM ,
					Count(*) over () AS TotalCount,'
   
		  SET @sql= @sql + '
    H.HeadCountID,
    H.Forename,
    H.Surname,
   (H.Surname +'', ''+H.Forename ) As FullName,
    H.Personnel_NO,
    H.UserID,
    H.ExpectedEndDate,H.StartDate,H.ActualEndDate,
    Hr.HiringCompanyName,O.OrganizationName,
    (LM.Surname +'', ''+LM.Forename ) AS LineManagerName,
    H.SAP_PositionID, H.PositionName,H.LocalPositionCode,
    CASE 
     WHEN H.Active = 1 THEN '+'''Yes'''+
   ' WHEN H.Active = 0 THEN '+'''No'''+
   ' ELSE '+''' '''+' END AS Active
		
		 From HeadCount H    
    LEFT OUTER JOIN HiringCompany Hr ON H.HiringCompanyID = Hr.HiringCompanyID
    LEFT OUTER JOIN Organization O ON H.OrganizationID = O.OrganizationID  
    LEFT OUTER JOIN HeadCount LM ON H.LineManagerID = LM.HeadCountID 
    where 1=1'
							
					 		   
		 
	
	
	IF @SAP_Org_Chart <> -1 
	BEGIN	
		 SET @sql = @sql + ' and H.SAP_Org_Chart= ''' + @SAP_Org_Chart + ''''
		 
	END 
	   IF @C_BAY <>-1
	BEGIN
	     SET @sql = @sql + ' and H.C_BAY= ''' + @C_BAY + ''''
	     
	END	
	 IF @Active <>-1
	BEGIN
	     SET @sql = @sql + ' and H.Active= ''' + @Active + ''''
	     
	END	   
	   IF @SecurityPassID <> -1
	BEGIN
		 SET @sql = @sql + ' and H.SecurityPassID ='''+ @SecurityPassID +''''
		 
	END
	   IF @OrganizationID <>-1
	BEGIN
		 SET @sql = @sql + ' and H.OrganizationID='''+ @OrganizationID +''''
		 
	END
	   IF @HiringCompanyID <>-1
	BEGIN
	     SET @sql = @sql + ' and H.HiringCompanyID='''+@HiringCompanyID +''''
	END
	 IF @LineManagerID <> -1
	BEGIN
	     SET @sql = @sql + ' and H.LineManagerID='''+@LineManagerID +''''
	END
	
	
	SET @sql = @sql + ')
	SELECT 
	CPC.*
    FROM CTE_Results AS CPC
	WHERE
      ROWNUM  > '+ cast(@lFirstRec as nvarchar) +
      ' AND ROWNUM  < '  + cast(@lLastRec as nvarchar)
	
 
    EXEC (@sql)
   
   print @sql
   
      print @lFirstRec
        print @lLastRec
   
   
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ServerSidePendingRequestResult]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ServerSidePendingRequestResult]
	
    @FreeText NVARCHAR(200),	

	/*- Pagination Parameters */
   @PageNo INT = 1,
   @PageSize INT = 10,
   /*- Sorting Parameters */
   @SortColumn NVARCHAR(20) = 'H.Surname',
   @SortOrder NVARCHAR(4)='ASC'	
AS
BEGIN
	
	SET NOCOUNT ON;

    DECLARE
	@lPageNbr INT,
    @lPageSize INT,
    @lSortCol NVARCHAR(20),
    @lFirstRec INT,
    @lLastRec INT,
    @lTotalRows INT
    DECLARE @sql varchar(max)
	DECLARE @filter nvarchar(1000)
    SET @lPageNbr = @PageNo
    SET @lPageSize = @PageSize
    SET @lSortCol = LTRIM(RTRIM(@SortColumn))

    SET @lFirstRec = ( @lPageNbr - 1 ) * @lPageSize
    SET @lLastRec = ( @lPageNbr * @lPageSize + 1 )
    SET @lTotalRows = @lFirstRec - @lLastRec + 1
       
    
	SET @sql=''	
	
		
	 
	SET @sql= @sql + 'WITH CTE_Results
					AS (
					SELECT ROW_NUMBER() OVER (ORDER BY ' + @lSortCol + ' ' + @SortOrder + '						 
					)AS ROWNUM ,
					Count(*) over () AS TotalCount,'
   
		  SET @sql= @sql + '
						    H.HeadCountID,
							H.Forename,
							H.Surname,
						   (H.Surname +'', ''+H.Forename ) As FullName,
							H.Personnel_NO,
							H.UserID,
							H.ExpectedEndDate,H.StartDate,H.ActualEndDate,
							Hr.HiringCompanyName,O.OrganizationName,
							(LM.Surname +'', ''+LM.Forename ) AS LineManagerName,
							H.SAP_PositionID,H.PositionName,H.LocalPositionCode   From HeadCount H    
							LEFT OUTER JOIN HiringCompany Hr ON H.HiringCompanyID = Hr.HiringCompanyID
							LEFT OUTER JOIN Organization O ON H.OrganizationID = O.OrganizationID  
							LEFT OUTER JOIN HeadCount LM ON H.LineManagerID = LM.HeadCountID 
							where 1=1 and H.IsSubmitted = 1 '
							
	IF @FreeText <>''
	BEGIN
		 SET @sql = @sql + ' and ( H.Surname Like ''%'+ @FreeText +'%'''+
		 				   ' OR H.Forename Like ''%'+ @FreeText +'%'''+
						   ' OR H.Personnel_NO Like ''%'+ @FreeText +'%'''	+	 
						   ' OR H.UserID Like ''%'+ @FreeText +'%'''+	
						   ' OR H.LocalPositionCode Like ''%'+ @FreeText +'%'''+	 
						   ' OR Hr.HiringCompanyName Like ''%'+ @FreeText +'%'''+	
						   ' OR O.OrganizationName Like ''%'+ @FreeText +'%'')' 
						 
	END
	
	
	SET @sql = @sql + ')
						SELECT 
						CPC.*
						FROM CTE_Results AS CPC
						WHERE
						ROWNUM  > '+ cast(@lFirstRec as nvarchar) +
						' AND ROWNUM  < '  + cast(@lLastRec as nvarchar)
	
		
	
	
	 
	
 
   EXEC (@sql)
   
   print @sql
   
    
   
   
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ServerSideSearchResult]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ServerSideSearchResult]
    @ShowAdvanced NVARCHAR(1),
    @FreeText NVARCHAR(200),
	@Surname  NVARCHAR(200)= '',
	@Forename  NVARCHAR(200)='',
	@Personnel_NO  NVARCHAR(20)='',
	@SAP_PositionID NVARCHAR(20)='',
	@UserID NVARCHAR(20)='',
	@OrganizationID NVARCHAR(20)='',
	@HiringCompanyID NVARCHAR(20)='',
	@LineManagerID NVARCHAR(20)='',
	@LocalPositionCode NVARCHAR(20)='',

	/*- Pagination Parameters */
   @PageNo INT = 1,
   @PageSize INT = 10,
   /*- Sorting Parameters */
   @SortColumn NVARCHAR(20) = 'H.Surname',
   @SortOrder NVARCHAR(4)='ASC'	
AS
BEGIN
	
	SET NOCOUNT ON;

    DECLARE
	@lPageNbr INT,
    @lPageSize INT,
    @lSortCol NVARCHAR(20),
    @lFirstRec INT,
    @lLastRec INT,
    @lTotalRows INT
    DECLARE @sql varchar(max)
	DECLARE @filter nvarchar(1000)
    SET @lPageNbr = @PageNo
    SET @lPageSize = @PageSize
    SET @lSortCol = LTRIM(RTRIM(@SortColumn))

    SET @lFirstRec = ( @lPageNbr - 1 ) * @lPageSize
    SET @lLastRec = ( @lPageNbr * @lPageSize + 1 )
    SET @lTotalRows = @lFirstRec - @lLastRec + 1
       
    
	SET @sql=''
	
	IF @ShowAdvanced <>'1' 
	BEGIN	
	 
	SET @sql= @sql + 'WITH CTE_Results
					AS (
					SELECT ROW_NUMBER() OVER (ORDER BY ' + @lSortCol + ' ' + @SortOrder + '						 
					)AS ROWNUM ,
					Count(*) over () AS TotalCount,'
   
		  SET @sql= @sql + '
							H.HeadCountID,
							H.Forename,
							H.Surname,
						   (H.Surname +'', ''+H.Forename ) As FullName,
							H.Personnel_NO,
							H.UserID,
							H.ExpectedEndDate,H.StartDate,H.ActualEndDate,
							Hr.HiringCompanyName,O.OrganizationName,
							(LM.Surname +'', ''+LM.Forename ) AS LineManagerName,
							H.SAP_PositionID,H.PositionName,H.LocalPositionCode
							   
							From HeadCount H    
							LEFT OUTER JOIN HiringCompany Hr ON H.HiringCompanyID = Hr.HiringCompanyID
							LEFT OUTER JOIN Organization O ON H.OrganizationID = O.OrganizationID  
							LEFT OUTER JOIN HeadCount LM ON H.LineManagerID = LM.HeadCountID 
   where 1=1'
							
	IF @FreeText <>''
	BEGIN
		 SET @sql = @sql + ' and ( H.Surname Like ''%'+ @FreeText +'%'''+
		 	  ' OR H.Forename Like ''%'+ @FreeText +'%'''+
	' OR H.Personnel_NO Like ''%'+ @FreeText +'%'''	+	 
	 ' OR H.UserID Like ''%'+ @FreeText +'%'''+	
	  ' OR H.LocalPositionCode Like ''%'+ @FreeText +'%'''+	 
	 ' OR Hr.HiringCompanyName Like ''%'+ @FreeText +'%'''+	
	 ' OR O.OrganizationName Like ''%'+ @FreeText +'%'')'
	END
	
	
	SET @sql = @sql + ')
	SELECT 
	CPC.*
    FROM CTE_Results AS CPC
	WHERE
      ROWNUM  > '+ cast(@lFirstRec as nvarchar) +
      ' AND ROWNUM  < '  + cast(@lLastRec as nvarchar)
	
	END	
	
	IF @ShowAdvanced <>'0' 
	BEGIN	
	 
	SET @sql= @sql + 'WITH CTE_Results
					AS (
					SELECT ROW_NUMBER() OVER (ORDER BY ' + @lSortCol + ' ' + @SortOrder + '						 
					)AS ROWNUM ,
					Count(*) over () AS TotalCount,'
   
		  SET @sql= @sql + '
							H.HeadCountID,
							H.Forename,
							H.Surname,
						   (H.Surname +'', ''+H.Forename ) As FullName,
							H.Personnel_NO,
							H.UserID,
							H.ExpectedEndDate,H.StartDate,H.ActualEndDate,
							Hr.HiringCompanyName,O.OrganizationName,
							(LM.Surname +'', ''+LM.Forename ) AS LineManagerName,
							H.SAP_PositionID,H.PositionName,H.LocalPositionCode 
							  
							From HeadCount H    
							LEFT OUTER JOIN HiringCompany Hr ON H.HiringCompanyID = Hr.HiringCompanyID
							LEFT OUTER JOIN Organization O ON H.OrganizationID = O.OrganizationID  
							LEFT OUTER JOIN HeadCount LM ON H.LineManagerID = LM.HeadCountID 
							where 1=1'
				
	IF @Surname <>''
	BEGIN
		 SET @sql = @sql + ' and H.Surname Like ''%'+ @Surname +'%'''
		 
	END
	IF @Forename <>''
	BEGIN
		 SET @sql = @sql + ' and H.Forename Like ''%'+ @Forename +'%'''
		 
	END
	
	IF @Personnel_NO <>''
	BEGIN
		 SET @sql = @sql + ' and H.Personnel_NO Like ''%'+ @Personnel_NO +'%'''
		 
	END
	IF @UserID <>''
	BEGIN
		 SET @sql = @sql + ' and H.UserID Like ''%'+ @UserID +'%'''
		 
	END
	IF @SAP_PositionID <>''
	BEGIN
		 SET @sql = @sql + ' and H.SAP_PositionID Like ''%'+ @SAP_PositionID +'%'''
		 
	END	
	IF @LocalPositionCode <>''
	BEGIN
		 SET @sql = @sql + ' and H.LocalPositionCode Like ''%'+ @LocalPositionCode +'%'''
		 
	END
	IF @OrganizationID <>-1
	BEGIN
		 SET @sql = @sql + ' and H.OrganizationID='''+ @OrganizationID +''''
		 
	END
	   IF @HiringCompanyID <>-1
	BEGIN
	     SET @sql = @sql + ' and H.HiringCompanyID='''+@HiringCompanyID +''''
	END
	 IF @LineManagerID <> -1
	BEGIN
	     SET @sql = @sql + ' and H.LineManagerID='''+@LineManagerID +''''
	END
	
	
	SET @sql = @sql + ')
	SELECT 
	CPC.*
    FROM CTE_Results AS CPC
	WHERE
      ROWNUM  > '+ cast(@lFirstRec as nvarchar) +
      ' AND ROWNUM  < '  + cast(@lLastRec as nvarchar)
	
	END
 
    EXEC (@sql)
   
   --print @sql
   --print @ShowAdvanced 
   --print @FreeText
   --   print @lFirstRec
   --     print @lLastRec
   
   
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateOrderBy]    Script Date: 9/3/2019 12:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateOrderBy]
	@lookupTypeId int,
	@lookupId int,
	@orderBy int = NULL
AS
BEGIN

	DECLARE @exisitingOrderBy INT
	SELECT @exisitingOrderBy = OrderBy FROM [Lookup] WHERE LookupTypeID = @lookupTypeId AND ID = @lookupId
	
	-- If this is a new Lookup
	if (@exisitingOrderBy is null) 
	begin
		Update [Lookup] set OrderBy = OrderBy + 1 where OrderBy >= @orderBy AND LookupTypeID = @lookupTypeId;
		return
	end
		
	 --Moving down chain 		
	If @orderBy < @exisitingOrderBy
	begin
		--ALTER space for the movement; no point in changing the original 
		Update [Lookup] set OrderBy = OrderBy + 1 where OrderBy BETWEEN @orderBy and @exisitingOrderBy - 1 AND LookupTypeID = @lookupTypeId;
	end
	 
	 --Moving up chain
	IF (@orderBy > @exisitingOrderBy OR @orderBy IS NULL)
	begin
		--ALTER space for the momvement; no point in changing the original  
	  Update [Lookup] set OrderBy = OrderBy - 1 where OrderBy between @exisitingOrderBy + 1 and IsNull(@orderBy, 999999) AND LookupTypeID = @lookupTypeId
	end

	--Finally update the one we moved to correct value
	update [Lookup] set OrderBy = @orderBy where ID=@lookupId AND LookupTypeID = @lookupTypeId;
    
END

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
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 219
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 26
         End
         Begin Table = "emp_count"
            Begin Extent = 
               Top = 9
               Left = 377
               Bottom = 252
               Right = 569
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [C:\USERS\AJAY\DOWNLOADS\PROJECTS-2015-06-28\PROJECTS\MAIN\MAIN\HEADCOUNT\HEADCOUNT\APP_DATA\HEADCOUNT.MDF] SET  READ_WRITE 
GO
