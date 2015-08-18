USE [master]
GO
/****** Object:  Database [TrolleyTracker]    Script Date: 8/15/2015 7:28:39 PM ******/
CREATE DATABASE [TrolleyTracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TrolleyTracker', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TrolleyTracker.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TrolleyTracker_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TrolleyTracker_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TrolleyTracker] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrolleyTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrolleyTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrolleyTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrolleyTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrolleyTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrolleyTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrolleyTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrolleyTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrolleyTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrolleyTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrolleyTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrolleyTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrolleyTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrolleyTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrolleyTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrolleyTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TrolleyTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrolleyTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrolleyTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrolleyTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrolleyTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrolleyTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrolleyTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrolleyTracker] SET RECOVERY FULL 
GO
ALTER DATABASE [TrolleyTracker] SET  MULTI_USER 
GO
ALTER DATABASE [TrolleyTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrolleyTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrolleyTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrolleyTracker] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TrolleyTracker] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TrolleyTracker]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 8/15/2015 7:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](50) NOT NULL,
	[LongName] [nvarchar](50) NOT NULL,
	[Description] [ntext] NOT NULL,
	[FlagStopsOnly] [bit] NOT NULL,
 CONSTRAINT [PK_Routes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RouteSchedule]    Script Date: 8/15/2015 7:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteSchedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
 CONSTRAINT [PK_RouteSchedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RouteStops]    Script Date: 8/15/2015 7:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteStops](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[StopID] [int] NOT NULL,
	[StopSequence] [int] NOT NULL,
 CONSTRAINT [PK_RouteStops] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shapes]    Script Date: 8/15/2015 7:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shapes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[Lat] [float] NOT NULL,
	[Lon] [float] NOT NULL,
	[Sequence] [int] NOT NULL,
	[DistanceTraveled] [float] NOT NULL,
 CONSTRAINT [PK_Shapes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stops]    Script Date: 8/15/2015 7:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stops](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Lat] [float] NOT NULL,
	[Lon] [float] NOT NULL,
 CONSTRAINT [PK_Stops] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trolley]    Script Date: 8/15/2015 7:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trolley](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TrolleyName] [nvarchar](50) NOT NULL,
	[Number] [int] NOT NULL,
	[CurrentLat] [float] NULL,
	[CurrentLon] [float] NULL,
 CONSTRAINT [PK_Trolley] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Routes] ON 

INSERT [dbo].[Routes] ([ID], [ShortName], [LongName], [Description], [FlagStopsOnly]) VALUES (1, N'ShortMain', N'Main Street short', N'North Main Street to Fluor Field - no Heritage Green', 0)
INSERT [dbo].[Routes] ([ID], [ShortName], [LongName], [Description], [FlagStopsOnly]) VALUES (2, N'HeritageGreen', N'Main Street plus museums', N'Main Street, Including Heritage Green', 0)
INSERT [dbo].[Routes] ([ID], [ShortName], [LongName], [Description], [FlagStopsOnly]) VALUES (3, N'LunchLink', N'Friday Lunch Route', N'From University Ridge / County Square to Hyatt', 1)
SET IDENTITY_INSERT [dbo].[Routes] OFF
SET IDENTITY_INSERT [dbo].[RouteSchedule] ON 

INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (5, 2, 6, CAST(N'1970-01-01 08:00:00.000' AS DateTime), CAST(N'1970-01-01 18:00:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (6, 1, 6, CAST(N'1970-01-01 18:00:00.000' AS DateTime), CAST(N'1970-01-01 23:00:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (7, 2, 0, CAST(N'1970-01-01 13:00:00.000' AS DateTime), CAST(N'1970-01-01 18:00:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (8, 1, 0, CAST(N'1970-01-01 18:00:00.000' AS DateTime), CAST(N'1970-01-01 20:00:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (9, 3, 5, CAST(N'1970-01-01 11:00:00.000' AS DateTime), CAST(N'1970-01-01 23:00:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (10, 1, 4, CAST(N'1970-01-01 18:00:00.000' AS DateTime), CAST(N'1970-01-01 23:00:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (11, 1, 5, CAST(N'1970-01-01 18:00:00.000' AS DateTime), CAST(N'1970-01-01 23:00:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (13, 2, 2, CAST(N'1970-01-01 00:00:00.000' AS DateTime), CAST(N'1970-01-01 23:59:00.000' AS DateTime))
INSERT [dbo].[RouteSchedule] ([ID], [RouteID], [DayOfWeek], [StartTime], [EndTime]) VALUES (14, 3, 3, CAST(N'1970-01-01 00:00:00.000' AS DateTime), CAST(N'1970-01-01 23:59:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[RouteSchedule] OFF
SET IDENTITY_INSERT [dbo].[RouteStops] ON 

INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (238, 1, 24, 0)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (239, 1, 25, 1)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (240, 1, 26, 2)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (241, 1, 27, 3)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (242, 1, 28, 4)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (243, 1, 29, 5)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (244, 1, 30, 6)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (245, 1, 31, 7)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (246, 1, 32, 8)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (247, 1, 33, 9)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (248, 1, 34, 10)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (249, 1, 35, 11)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (250, 1, 36, 12)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (251, 1, 37, 13)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (252, 1, 38, 14)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (253, 1, 39, 15)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (254, 1, 40, 16)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (255, 1, 41, 17)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (256, 1, 42, 18)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (257, 1, 43, 19)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (258, 1, 44, 20)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (259, 1, 45, 21)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (260, 2, 40, 0)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (261, 2, 41, 1)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (262, 2, 42, 2)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (263, 2, 43, 3)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (264, 2, 44, 4)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (265, 2, 45, 5)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (266, 2, 46, 6)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (267, 2, 24, 7)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (268, 2, 25, 8)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (269, 2, 26, 9)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (270, 2, 27, 10)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (271, 2, 28, 11)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (272, 2, 29, 12)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (273, 2, 30, 13)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (274, 2, 31, 14)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (275, 2, 32, 15)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (276, 2, 33, 16)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (277, 2, 34, 17)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (278, 2, 35, 18)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (279, 2, 36, 19)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (280, 2, 37, 20)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (281, 2, 38, 21)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (282, 2, 39, 22)
SET IDENTITY_INSERT [dbo].[RouteStops] OFF
SET IDENTITY_INSERT [dbo].[Shapes] ON 

INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22012, 3, 34.854858, -82.397156, 0, 0)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22013, 3, 34.854588, -82.397282, 1, 32.184746146249829)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22014, 3, 34.854146, -82.397464, 2, 84.120881469644019)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22015, 3, 34.8540729, -82.39748, 3, 92.388955979755778)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22016, 3, 34.8539543, -82.3975115, 4, 105.90158801957284)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22017, 3, 34.8539543, -82.3975115, 5, 105.90158801957284)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22018, 3, 34.8524767, -82.398182, 6, 281.42130224943389)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22019, 3, 34.8515463, -82.3986011, 7, 391.84264815388946)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22020, 3, 34.8515463, -82.3986011, 8, 391.84264815388946)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22021, 3, 34.8508232, -82.3989461, 9, 478.28784549312593)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22022, 3, 34.8507403, -82.3989856, 10, 488.19636147986938)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22023, 3, 34.8507403, -82.3989856, 11, 488.19636147986938)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22024, 3, 34.8506693, -82.3990179, 12, 496.63314544921712)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22025, 3, 34.8506412, -82.3990306, 13, 499.96909269356206)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22026, 3, 34.8496109, -82.3994984, 14, 622.36469025608665)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22027, 3, 34.8495248, -82.3995375, 15, 632.59304072188706)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22028, 3, 34.8492914, -82.3996435, 16, 660.32077098498155)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22029, 3, 34.8488156, -82.3998595, 17, 716.84289284253293)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22030, 3, 34.8487026, -82.3999109, 18, 730.2696869465874)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22031, 3, 34.8486664, -82.3999273, 19, 734.57077958062)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22032, 3, 34.8485024, -82.4000017, 20, 754.05129747181229)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22033, 3, 34.8483374, -82.4000767, 21, 773.65522949503168)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22034, 3, 34.8479487, -82.4002528, 22, 819.81904772377686)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22035, 3, 34.847705499999996, -82.4003635, 23, 848.71920183172347)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22036, 3, 34.8475797, -82.4004207, 24, 863.66644150321451)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22037, 3, 34.8474487, -82.4004802, 25, 879.22948827224059)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22038, 3, 34.8464867, -82.400917, 26, 993.51216287978161)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22039, 3, 34.8464867, -82.400917, 27, 993.51216287978161)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22040, 3, 34.846392, -82.400971, 28, 1005.150784144127)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22041, 3, 34.8461845, -82.4011174, 29, 1031.8422542048375)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22042, 3, 34.8461845, -82.4011174, 30, 1031.8422542048375)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22043, 3, 34.845958, -82.401324, 31, 1063.3381916870858)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22044, 3, 34.845895, -82.401377, 32, 1071.8601978594729)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22045, 3, 34.845834, -82.40143, 33, 1080.2000659703358)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22046, 3, 34.8455653, -82.4016592, 34, 1116.7126262034083)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22047, 3, 34.8455653, -82.4016592, 35, 1116.7126262034083)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22048, 3, 34.845494, -82.40172, 36, 1126.4003465543667)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22049, 3, 34.8451446, -82.4020518, 37, 1175.7126603872869)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22050, 3, 34.844934, -82.402251, 38, 1205.3912222227937)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22051, 3, 34.844857, -82.40235, 39, 1217.8529144565521)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22052, 3, 34.844755, -82.40253, 40, 1237.8369825443951)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22053, 3, 34.8447009, -82.4026392, 41, 1249.4903406647334)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22054, 3, 34.8446767, -82.4027505, 42, 1260.0095201257568)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22055, 3, 34.844664, -82.402825, 43, 1266.9612151500239)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22056, 3, 34.844631, -82.403026, 44, 1285.6885141784819)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22057, 3, 34.8445617, -82.4037552, 45, 1352.7536941510396)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22058, 3, 34.844521, -82.404215, 46, 1395.0047978118923)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22059, 3, 34.844521, -82.404215, 47, 1395.0047978118923)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22060, 3, 34.844473, -82.404229, 48, 1400.4991569399506)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22061, 3, 34.844406, -82.404275, 49, 1409.0597639024766)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22062, 3, 34.8441825, -82.4045141, 50, 1442.1683677918031)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22063, 3, 34.84409, -82.404614, 51, 1455.92808344423)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22064, 3, 34.843726, -82.404983, 52, 1508.6388364139691)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22065, 3, 34.843453, -82.405245, 53, 1547.3239271963778)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22066, 3, 34.843372, -82.405325, 54, 1558.9310732408362)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22067, 3, 34.843052, -82.405586, 55, 1601.7976876787418)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22068, 3, 34.842519, -82.4059946, 56, 1671.8976944401029)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22069, 3, 34.842452, -82.406046, 57, 1680.7114914822898)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22070, 3, 34.842057, -82.406315, 58, 1731.0848041415245)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22071, 3, 34.841948, -82.40636, 59, 1743.8960475797458)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22072, 3, 34.8417973, -82.4063993, 60, 1761.0517835697947)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22073, 3, 34.8417225, -82.4064188, 61, 1769.5674276612858)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22074, 3, 34.8417225, -82.4064188, 62, 1769.5674276612858)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22075, 3, 34.841608, -82.406432, 63, 1782.3702073834734)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22076, 3, 34.84155, -82.4064386, 64, 1788.8546651004006)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22077, 3, 34.841415, -82.406454, 65, 1803.9483392896434)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22078, 3, 34.841219, -82.406466, 66, 1825.7946841889407)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22079, 3, 34.8408978, -82.4064644, 67, 1861.5510536171937)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22080, 3, 34.8408978, -82.4064644, 68, 1861.5510536171937)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22081, 3, 34.8408932, -82.406384, 69, 1868.9147859151403)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22082, 3, 34.8406996, -82.4049091, 70, 2005.3809804149016)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22083, 3, 34.8406996, -82.4049091, 71, 2005.3809804149016)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22084, 3, 34.8407754, -82.4049099, 72, 2013.818834974187)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22085, 3, 34.840931, -82.40488, 73, 2031.3539490578162)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22086, 3, 34.841239, -82.404768, 74, 2067.1348146015121)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22087, 3, 34.8413537, -82.4047159, 75, 2080.761939954114)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22088, 3, 34.8413537, -82.4047159, 76, 2080.761939954114)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22089, 3, 34.8412944, -82.4045699, 77, 2095.6452873590461)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22090, 3, 34.8412684, -82.4044713, 78, 2105.1075384150213)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22091, 3, 34.8412684, -82.4044713, 79, 2105.1075384150213)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22092, 3, 34.8412635, -82.404392, 80, 2112.3730955724709)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22093, 3, 34.8412527, -82.4042152, 81, 2128.5709311642008)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22094, 3, 34.841242, -82.4040405, 82, 2144.57691029792)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22095, 3, 34.8412313, -82.403865, 83, 2160.655525243807)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22096, 3, 34.8412204, -82.4036878, 84, 2176.8906811616525)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22097, 3, 34.8412144, -82.4035899, 85, 2185.8604147918127)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22098, 3, 34.8412099, -82.4035162, 86, 2192.6130531769763)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22099, 3, 34.841204, -82.4034195, 87, 2201.4723391082007)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22100, 3, 34.8411998, -82.4033511, 88, 2207.739323134625)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22101, 3, 34.8411967, -82.4032991, 89, 2212.5027953630665)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22102, 3, 34.8411909, -82.4032048, 90, 2221.1427005038458)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22103, 3, 34.8411803, -82.4030323, 91, 2236.9470670702312)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22104, 3, 34.8411803, -82.4030323, 92, 2236.9470670702312)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22105, 3, 34.8411963, -82.4029545, 93, 2244.2751394380334)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22106, 3, 34.8411985, -82.4028552, 94, 2253.350991911836)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22107, 3, 34.8411985, -82.4028552, 95, 2253.350991911836)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22108, 3, 34.8411924, -82.4027372, 96, 2264.15317316449)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22109, 3, 34.8411873, -82.40264, 97, 2273.0521345713823)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22110, 3, 34.8411832, -82.4025601, 98, 2280.3660177888214)
GO
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22111, 3, 34.8411736, -82.4023764, 99, 2297.1838193659628)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22112, 3, 34.8411625, -82.4021632, 100, 2316.70185995881)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22113, 3, 34.8411512, -82.4019459, 101, 2336.5953215403861)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22114, 3, 34.8411403, -82.4017372, 102, 2355.7017599463175)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22115, 3, 34.841133, -82.4015959, 103, 2368.6368507982343)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22116, 3, 34.841133, -82.4015959, 104, 2368.6368507982343)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22117, 3, 34.841089, -82.4015651, 105, 2374.2852341915586)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22118, 3, 34.8402332, -82.4016417, 106, 2469.8091997079191)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22119, 3, 34.8400301, -82.4016603, 107, 2492.4821540181074)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22120, 3, 34.8400301, -82.4016603, 108, 2492.4821540181074)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22121, 3, 34.840085, -82.402576, 109, 2576.368429295861)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22122, 3, 34.8400884, -82.4026554, 110, 2583.632743096211)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22123, 3, 34.8401364, -82.403428, 111, 2654.4236293490167)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22124, 3, 34.8401632, -82.4038722, 112, 2695.117648887267)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22125, 3, 34.8401632, -82.4038722, 113, 2695.117648887267)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22126, 3, 34.8402413, -82.4042443, 114, 2730.20873372346)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22127, 3, 34.8402874, -82.4046957, 115, 2771.7689889343974)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22128, 3, 34.8402874, -82.4046957, 116, 2771.7689889343974)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22129, 3, 34.8403796, -82.4047463, 117, 2783.0261058757183)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22130, 3, 34.8406111, -82.4048701, 118, 2811.1696605154652)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22131, 3, 34.8406996, -82.4049091, 119, 2821.6458165673166)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22132, 3, 34.8406996, -82.4049091, 120, 2821.6458165673166)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22133, 3, 34.8408932, -82.406384, 121, 2958.1120110670777)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22134, 3, 34.8408978, -82.4064644, 122, 2965.4757433650243)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22135, 3, 34.8408978, -82.4064644, 123, 2965.4757433650243)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22136, 3, 34.841219, -82.406466, 124, 3001.2321127932773)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22137, 3, 34.841415, -82.406454, 125, 3023.0784576925748)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22138, 3, 34.84155, -82.4064386, 126, 3038.1721318818177)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22139, 3, 34.841608, -82.406432, 127, 3044.6565895987446)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22140, 3, 34.8417225, -82.4064188, 128, 3057.4593693209322)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22141, 3, 34.8417225, -82.4064188, 129, 3057.4593693209322)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22142, 3, 34.8417222, -82.4065174, 130, 3066.4677906808092)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22143, 3, 34.8417213, -82.406557, 131, 3070.0856194900239)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22144, 3, 34.8417035, -82.4067203, 132, 3085.1364432059881)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22145, 3, 34.8416888, -82.406861, 133, 3098.0952553879156)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22146, 3, 34.8416568, -82.4070651, 134, 3117.0798036648644)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22147, 3, 34.841604, -82.407404, 135, 3148.5958104734746)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22148, 3, 34.8413229, -82.4086575, 136, 3267.3185034524786)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22149, 3, 34.8413229, -82.4086575, 137, 3267.3185034524786)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22150, 3, 34.8414045, -82.4086855, 138, 3276.755901598835)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22151, 3, 34.842127, -82.40896, 139, 3361.0036350545997)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22152, 3, 34.842127, -82.40896, 140, 3361.0036350545997)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22153, 3, 34.8429736, -82.4092959, 141, 3460.1174615672394)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22154, 3, 34.843083, -82.409344, 142, 3473.0647673551634)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22155, 3, 34.843083, -82.409344, 143, 3473.0647673551634)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22156, 3, 34.8431161, -82.4092238, 144, 3484.6477634672619)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22157, 3, 34.8435696, -82.4076083, 145, 3640.6376687418956)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22158, 3, 34.8437897, -82.4068233, 146, 3716.4261931967944)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22159, 3, 34.8441, -82.4057166, 147, 3823.2731786664)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22160, 3, 34.8442789, -82.4050744, 148, 3885.2328787574047)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22161, 3, 34.8443957, -82.4046618, 149, 3925.1075665485528)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22162, 3, 34.8444546, -82.4044559, 150, 3945.0287067922341)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22163, 3, 34.844521, -82.404215, 151, 3968.2457224901541)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22164, 3, 34.844521, -82.404215, 152, 3968.2457224901541)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22165, 3, 34.8445617, -82.4037552, 153, 4010.4968261510066)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22166, 3, 34.844631, -82.403026, 154, 4077.5620061235641)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22167, 3, 34.844664, -82.402825, 155, 4096.2893051520223)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22168, 3, 34.8446767, -82.4027505, 156, 4103.2410001762892)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22169, 3, 34.8447009, -82.4026392, 157, 4113.7601796373128)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22170, 3, 34.844755, -82.40253, 158, 4125.4135377576513)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22171, 3, 34.844857, -82.40235, 159, 4145.3976058454946)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22172, 3, 34.844934, -82.402251, 160, 4157.8592980792528)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22173, 3, 34.8451446, -82.4020518, 161, 4187.53785991476)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22174, 3, 34.845494, -82.40172, 162, 4236.85017374768)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22175, 3, 34.8455653, -82.4016592, 163, 4246.5378940986384)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22176, 3, 34.8455653, -82.4016592, 164, 4246.5378940986384)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22177, 3, 34.845834, -82.40143, 165, 4283.0504543317111)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22178, 3, 34.845895, -82.401377, 166, 4291.390322442574)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22179, 3, 34.845958, -82.401324, 167, 4299.9123286149606)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22180, 3, 34.8461845, -82.4011174, 168, 4331.408266097209)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22181, 3, 34.8461845, -82.4011174, 169, 4331.408266097209)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22182, 3, 34.846392, -82.400971, 170, 4358.0997361579193)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22183, 3, 34.8464867, -82.400917, 171, 4369.7383574222649)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22184, 3, 34.8464867, -82.400917, 172, 4369.7383574222649)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22185, 3, 34.8474487, -82.4004802, 173, 4484.0210320298056)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22186, 3, 34.8475797, -82.4004207, 174, 4499.5840787988318)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22187, 3, 34.847705499999996, -82.4003635, 175, 4514.5313184703227)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22188, 3, 34.8479487, -82.4002528, 176, 4543.43147257827)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22189, 3, 34.8483374, -82.4000767, 177, 4589.5952908070149)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22190, 3, 34.8485024, -82.4000017, 178, 4609.1992228302342)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22191, 3, 34.8486664, -82.3999273, 179, 4628.6797407214262)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22192, 3, 34.8487026, -82.3999109, 180, 4632.9808333554593)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22193, 3, 34.8488156, -82.3998595, 181, 4646.4076274595136)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22194, 3, 34.8492914, -82.3996435, 182, 4702.9297493170652)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22195, 3, 34.8495248, -82.3995375, 183, 4730.65747958016)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22196, 3, 34.8496109, -82.3994984, 184, 4740.8858300459606)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22197, 3, 34.8506412, -82.3990306, 185, 4863.2814276084855)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22198, 3, 34.8506693, -82.3990179, 186, 4866.6173748528308)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22199, 3, 34.8507403, -82.3989856, 187, 4875.0541588221786)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22200, 3, 34.8507403, -82.3989856, 188, 4875.0541588221786)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22201, 3, 34.8508232, -82.3989461, 189, 4884.9626748089222)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22202, 3, 34.8515463, -82.3986011, 190, 4971.4078721481583)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22203, 3, 34.8515463, -82.3986011, 191, 4971.4078721481583)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22204, 3, 34.8524767, -82.398182, 192, 5081.8292180526141)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22205, 3, 34.8539543, -82.3975115, 193, 5257.3489322824753)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22206, 3, 34.8539543, -82.3975115, 194, 5257.3489322824753)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22207, 3, 34.8540603, -82.397749, 195, 5282.045858293417)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22208, 3, 34.8542001, -82.398064, 196, 5314.7597850665052)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22209, 3, 34.8543672, -82.3984406, 197, 5353.8690354531218)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22210, 3, 34.854524, -82.398794, 198, 5390.5686396059818)
GO
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22211, 3, 34.854524, -82.398794, 199, 5390.5686396059818)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22212, 3, 34.8549102, -82.3986459, 200, 5435.6386133542155)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22213, 3, 34.8552753, -82.398506, 201, 5478.243132114414)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22214, 3, 34.8552753, -82.398506, 202, 5478.243132114414)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22215, 3, 34.855416, -82.398457, 203, 5494.53272197608)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22216, 3, 34.855416, -82.398457, 204, 5494.53272197608)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22217, 3, 34.85514, -82.39782, 205, 5560.3350247110047)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22218, 3, 34.854858, -82.397156, 206, 5628.6325951663375)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22219, 1, 34.862797, -82.393742, 0, 0)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22220, 1, 34.861544, -82.394283, 1, 147.9779370643092)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22221, 1, 34.861544, -82.394283, 2, 147.9779370643092)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22222, 1, 34.8604683, -82.394752, 3, 275.15661991875947)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22223, 1, 34.859888, -82.395005, 4, 343.76455630028)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22224, 1, 34.8583026, -82.3956795, 5, 530.69573855642875)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22225, 1, 34.858231, -82.39571, 6, 539.13894402915651)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22226, 1, 34.858231, -82.39571, 7, 539.13894402915651)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22227, 1, 34.8581408, -82.3957468, 8, 549.72745043035331)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22228, 1, 34.8581325, -82.3957502, 9, 550.6966885573861)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22229, 1, 34.857724, -82.395922, 10, 598.80239559278016)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22230, 1, 34.8572429, -82.3961232, 11, 655.423992744614)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22231, 1, 34.85715, -82.396162, 12, 666.35584471287063)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22232, 1, 34.85715, -82.396162, 13, 666.35584471287063)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22233, 1, 34.8570122, -82.3962211, 14, 682.618240377994)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22234, 1, 34.855293, -82.396958, 15, 885.49171427331237)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22235, 1, 34.854962, -82.3971008, 16, 924.57936336865271)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22236, 1, 34.854858, -82.397156, 17, 937.20702920308975)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22237, 1, 34.854858, -82.397156, 18, 937.20702920308975)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22238, 1, 34.854588, -82.397282, 19, 969.39177534933958)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22239, 1, 34.854146, -82.397464, 20, 1021.3279106727338)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22240, 1, 34.8540729, -82.39748, 21, 1029.5959851828454)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22241, 1, 34.8539543, -82.3975115, 22, 1043.1086172226626)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22242, 1, 34.8539543, -82.3975115, 23, 1043.1086172226626)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22243, 1, 34.8524767, -82.398182, 24, 1218.6283314525235)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22244, 1, 34.8515463, -82.3986011, 25, 1329.0496773569792)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22245, 1, 34.8515463, -82.3986011, 26, 1329.0496773569792)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22246, 1, 34.8508232, -82.3989461, 27, 1415.4948746962157)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22247, 1, 34.8507403, -82.3989856, 28, 1425.4033906829591)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22248, 1, 34.8507403, -82.3989856, 29, 1425.4033906829591)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22249, 1, 34.8506693, -82.3990179, 30, 1433.8401746523068)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22250, 1, 34.8506412, -82.3990306, 31, 1437.1761218966517)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22251, 1, 34.8496109, -82.3994984, 32, 1559.5717194591764)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22252, 1, 34.8495248, -82.3995375, 33, 1569.8000699249769)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22253, 1, 34.8492914, -82.3996435, 34, 1597.5278001880715)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22254, 1, 34.8488156, -82.3998595, 35, 1654.0499220456229)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22255, 1, 34.8487026, -82.3999109, 36, 1667.4767161496775)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22256, 1, 34.8486664, -82.3999273, 37, 1671.77780878371)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22257, 1, 34.8485024, -82.4000017, 38, 1691.2583266749023)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22258, 1, 34.8483374, -82.4000767, 39, 1710.8622586981217)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22259, 1, 34.8479487, -82.4002528, 40, 1757.0260769268668)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22260, 1, 34.847705499999996, -82.4003635, 41, 1785.9262310348133)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22261, 1, 34.8475797, -82.4004207, 42, 1800.8734707063045)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22262, 1, 34.8474487, -82.4004802, 43, 1816.4365174753307)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22263, 1, 34.8464867, -82.400917, 44, 1930.7191920828716)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22264, 1, 34.8464867, -82.400917, 45, 1930.7191920828716)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22265, 1, 34.846392, -82.400971, 46, 1942.357813347217)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22266, 1, 34.8461845, -82.4011174, 47, 1969.0492834079273)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22267, 1, 34.8461845, -82.4011174, 48, 1969.0492834079273)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22268, 1, 34.845958, -82.401324, 49, 2000.5452208901756)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22269, 1, 34.845895, -82.401377, 50, 2009.0672270625628)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22270, 1, 34.845834, -82.40143, 51, 2017.4070951734257)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22271, 1, 34.8455653, -82.4016592, 52, 2053.9196554064979)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22272, 1, 34.8455653, -82.4016592, 53, 2053.9196554064979)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22273, 1, 34.845494, -82.40172, 54, 2063.6073757574563)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22274, 1, 34.8451446, -82.4020518, 55, 2112.9196895903765)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22275, 1, 34.844934, -82.402251, 56, 2142.5982514258831)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22276, 1, 34.844857, -82.40235, 57, 2155.0599436596417)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22277, 1, 34.844755, -82.40253, 58, 2175.0440117474845)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22278, 1, 34.8447009, -82.4026392, 59, 2186.697369867823)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22279, 1, 34.8446767, -82.4027505, 60, 2197.2165493288462)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22280, 1, 34.844664, -82.402825, 61, 2204.1682443531131)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22281, 1, 34.844631, -82.403026, 62, 2222.8955433815713)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22282, 1, 34.8445617, -82.4037552, 63, 2289.9607233541292)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22283, 1, 34.844521, -82.404215, 64, 2332.2118270149817)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22284, 1, 34.844521, -82.404215, 65, 2332.2118270149817)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22285, 1, 34.844473, -82.404229, 66, 2337.70618614304)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22286, 1, 34.844406, -82.404275, 67, 2346.2667931055662)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22287, 1, 34.8441825, -82.4045141, 68, 2379.3753969948925)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22288, 1, 34.84409, -82.404614, 69, 2393.1351126473191)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22289, 1, 34.843726, -82.404983, 70, 2445.8458656170583)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22290, 1, 34.843453, -82.405245, 71, 2484.530956399467)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22291, 1, 34.843372, -82.405325, 72, 2496.1381024439256)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22292, 1, 34.843052, -82.405586, 73, 2539.0047168818314)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22293, 1, 34.842519, -82.4059946, 74, 2609.1047236431928)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22294, 1, 34.842452, -82.406046, 75, 2617.91852068538)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22295, 1, 34.842057, -82.406315, 76, 2668.2918333446146)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22296, 1, 34.841948, -82.40636, 77, 2681.1030767828361)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22297, 1, 34.8417973, -82.4063993, 78, 2698.258812772885)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22298, 1, 34.8417225, -82.4064188, 79, 2706.7744568643761)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22299, 1, 34.8417225, -82.4064188, 80, 2706.7744568643761)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22300, 1, 34.8417222, -82.4065174, 81, 2715.7828782242532)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22301, 1, 34.8417213, -82.406557, 82, 2719.4007070334678)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22302, 1, 34.8417035, -82.4067203, 83, 2734.4515307494321)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22303, 1, 34.8416888, -82.406861, 84, 2747.4103429313595)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22304, 1, 34.8416568, -82.4070651, 85, 2766.3948912083083)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22305, 1, 34.841604, -82.407404, 86, 2797.9108980169185)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22306, 1, 34.8413229, -82.4086575, 87, 2916.6335909959225)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22307, 1, 34.8413229, -82.4086575, 88, 2916.6335909959225)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22308, 1, 34.8414045, -82.4086855, 89, 2926.0709891422789)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22309, 1, 34.842127, -82.40896, 90, 3010.3187225980437)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22310, 1, 34.842127, -82.40896, 91, 3010.3187225980437)
GO
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22311, 1, 34.8429736, -82.4092959, 92, 3109.4325491106833)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22312, 1, 34.843083, -82.409344, 93, 3122.3798548986074)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22313, 1, 34.843083, -82.409344, 94, 3122.3798548986074)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22314, 1, 34.8431161, -82.4092238, 95, 3133.9628510107059)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22315, 1, 34.8435696, -82.4076083, 96, 3289.9527562853395)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22316, 1, 34.8437897, -82.4068233, 97, 3365.7412807402384)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22317, 1, 34.8441, -82.4057166, 98, 3472.5882662098438)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22318, 1, 34.8442789, -82.4050744, 99, 3534.5479663008487)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22319, 1, 34.8443957, -82.4046618, 100, 3574.4226540919967)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22320, 1, 34.8444546, -82.4044559, 101, 3594.343794335678)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22321, 1, 34.844521, -82.404215, 102, 3617.560810033598)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22322, 1, 34.844521, -82.404215, 103, 3617.560810033598)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22323, 1, 34.84459, -82.404209, 104, 3625.2609409002516)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22324, 1, 34.844619, -82.4042173, 105, 3628.57787974346)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22325, 1, 34.844992, -82.404324, 106, 3671.2290168771196)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22326, 1, 34.8453134, -82.4043812, 107, 3707.3868256075812)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22327, 1, 34.845478, -82.404397, 108, 3725.7665082680542)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22328, 1, 34.845478, -82.404397, 109, 3725.7665082680542)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22329, 1, 34.8462646, -82.404344, 110, 3813.4642265917296)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22330, 1, 34.846353, -82.404338, 111, 3823.3201844098467)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22331, 1, 34.84653, -82.404319, 112, 3843.0998042025844)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22332, 1, 34.84653, -82.404319, 113, 3843.0998042025844)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22333, 1, 34.846642, -82.40429, 114, 3855.8460155282332)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22334, 1, 34.846764, -82.404229, 115, 3870.5255618292272)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22335, 1, 34.8467981, -82.4042084, 116, 3874.7610496974703)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22336, 1, 34.847171, -82.403983, 117, 3921.0988825932955)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22337, 1, 34.847512, -82.403757, 118, 3964.3105342454219)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22338, 1, 34.848032, -82.403413, 119, 4030.17746104177)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22339, 1, 34.8481435, -82.4033269, 120, 4044.8720754344363)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22340, 1, 34.8481977, -82.403277, 121, 4052.4337098234473)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22341, 1, 34.848224, -82.4032486, 122, 4056.3454547056513)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22342, 1, 34.8482573, -82.4032, 123, 4062.128172881889)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22343, 1, 34.8482573, -82.4032, 124, 4062.128172881889)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22344, 1, 34.848372, -82.403049, 125, 4080.9250406963033)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22345, 1, 34.848518, -82.402843, 126, 4105.7910957521253)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22346, 1, 34.848518, -82.402843, 127, 4105.7910957521253)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22347, 1, 34.8486125, -82.4027172, 128, 4121.3715450165455)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22348, 1, 34.8488921, -82.4023453, 129, 4167.4484035267733)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22349, 1, 34.8489294, -82.4022956, 130, 4173.6004673389343)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22350, 1, 34.8489294, -82.4022956, 131, 4173.6004673389343)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22351, 1, 34.8489769, -82.4022439, 132, 4180.6898330551912)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22352, 1, 34.8489769, -82.4022439, 133, 4180.6898330551912)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22353, 1, 34.8490935, -82.4021634, 134, 4195.6080371871549)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22354, 1, 34.8492141, -82.4020964, 135, 4210.3624639609943)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22355, 1, 34.8492141, -82.4020964, 136, 4210.3624639609943)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22356, 1, 34.8492822, -82.4020625, 137, 4218.551500363018)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22357, 1, 34.850061, -82.4016799, 138, 4312.0276251149371)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22358, 1, 34.850061, -82.4016799, 139, 4312.0276251149371)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22359, 1, 34.8501292, -82.401641, 140, 4320.4107052669433)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22360, 1, 34.850193, -82.4015847, 141, 4329.1792925134523)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22361, 1, 34.85025, -82.4015094, 142, 4338.537876096435)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22362, 1, 34.85025, -82.4015094, 143, 4338.537876096435)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22363, 1, 34.8503642, -82.4013695, 144, 4356.5639915744132)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22364, 1, 34.8504775, -82.4012045, 145, 4376.2178535879393)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22365, 1, 34.8505403, -82.4011173, 146, 4386.8170182029362)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22366, 1, 34.8506107, -82.4010315, 147, 4397.9006802252388)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22367, 1, 34.85068, -82.4009712, 148, 4407.3791460270377)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22368, 1, 34.8507494, -82.4009175, 149, 4416.5303262957332)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22369, 1, 34.8511927, -82.4007197, 150, 4469.0824971606089)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22370, 1, 34.8512766, -82.4006823, 151, 4479.0274115286629)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22371, 1, 34.8512766, -82.4006823, 152, 4479.0274115286629)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22372, 1, 34.8513617, -82.4006448, 153, 4489.1009263513442)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22373, 1, 34.852291, -82.4002356, 154, 4599.0968079516169)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22374, 1, 34.8523937, -82.4001903, 155, 4611.2554505735707)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22375, 1, 34.8524809, -82.4001519, 156, 4621.5769877643888)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22376, 1, 34.8529968, -82.3999247, 157, 4682.6420962211278)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22377, 1, 34.8529968, -82.3999247, 158, 4682.6420962211278)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22378, 1, 34.853233, -82.399817, 159, 4710.7162382565875)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22379, 1, 34.853366, -82.399751, 160, 4726.7024530803574)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22380, 1, 34.853545, -82.399636, 161, 4749.228319013785)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22381, 1, 34.85375, -82.3994669, 162, 4776.7854717774062)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22382, 1, 34.853918, -82.399292, 163, 4801.382712513654)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22383, 1, 34.854085, -82.399121, 164, 4825.66486937447)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22384, 1, 34.85431, -82.398929, 165, 4856.242285151744)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22385, 1, 34.854524, -82.398794, 166, 4883.0672661415538)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22386, 1, 34.854524, -82.398794, 167, 4883.0672661415538)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22387, 1, 34.8549102, -82.3986459, 168, 4928.1372398897875)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22388, 1, 34.8552753, -82.398506, 169, 4970.741758649986)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22389, 1, 34.8552753, -82.398506, 170, 4970.741758649986)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22390, 1, 34.855416, -82.398457, 171, 4987.0313485116521)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22391, 1, 34.855416, -82.398457, 172, 4987.0313485116521)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22392, 1, 34.85569, -82.398354, 173, 5018.9511858449087)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22393, 1, 34.856403, -82.398103, 174, 5101.5673386965673)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22394, 1, 34.857666, -82.397668, 175, 5247.6710992330954)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22395, 1, 34.858066, -82.397535, 176, 5293.8265028525375)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22396, 1, 34.858579, -82.397365, 177, 5353.00706452712)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22397, 1, 34.858579, -82.397365, 178, 5353.00706452712)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22398, 1, 34.858706, -82.397352, 179, 5367.1940755115429)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22399, 1, 34.859272, -82.39718, 180, 5432.1302479940623)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22400, 1, 34.85939, -82.397134, 181, 5445.9217659315045)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22401, 1, 34.860346, -82.39669, 182, 5559.8091890779888)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22402, 1, 34.860794, -82.396485, 183, 5613.0798250658072)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22403, 1, 34.86159, -82.39611, 184, 5708.0801858009863)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22404, 1, 34.861714, -82.396078, 185, 5722.1899454257555)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22405, 1, 34.863003, -82.395912, 186, 5866.4795866027007)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22406, 1, 34.863003, -82.395912, 187, 5866.4795866027007)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22407, 1, 34.862797, -82.393742, 188, 6066.0097244144126)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22408, 2, 34.8413229, -82.4086575, 0, 0)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22409, 2, 34.8414045, -82.4086855, 1, 9.437398146356557)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22410, 2, 34.842127, -82.40896, 2, 93.685131602121288)
GO
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22411, 2, 34.842127, -82.40896, 3, 93.685131602121288)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22412, 2, 34.8429736, -82.4092959, 4, 192.79895811476112)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22413, 2, 34.843083, -82.409344, 5, 205.74626390268526)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22414, 2, 34.843083, -82.409344, 6, 205.74626390268526)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22415, 2, 34.8431161, -82.4092238, 7, 217.32926001478393)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22416, 2, 34.8435696, -82.4076083, 8, 373.31916528941775)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22417, 2, 34.8437897, -82.4068233, 9, 449.10768974431682)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22418, 2, 34.8441, -82.4057166, 10, 555.9546752139222)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22419, 2, 34.8442789, -82.4050744, 11, 617.91437530492715)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22420, 2, 34.8443957, -82.4046618, 12, 657.78906309607521)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22421, 2, 34.8444546, -82.4044559, 13, 677.71020333975662)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22422, 2, 34.844521, -82.404215, 14, 700.92721903767665)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22423, 2, 34.844521, -82.404215, 15, 700.92721903767665)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22424, 2, 34.84459, -82.404209, 16, 708.62734990433)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22425, 2, 34.844619, -82.4042173, 17, 711.94428874753862)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22426, 2, 34.844992, -82.404324, 18, 754.59542588119814)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22427, 2, 34.8453134, -82.4043812, 19, 790.75323461165965)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22428, 2, 34.845478, -82.404397, 20, 809.13291727213243)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22429, 2, 34.845478, -82.404397, 21, 809.13291727213243)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22430, 2, 34.8462646, -82.404344, 22, 896.83063559580785)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22431, 2, 34.846353, -82.404338, 23, 906.68659341392492)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22432, 2, 34.84653, -82.404319, 24, 926.46621320666259)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22433, 2, 34.84653, -82.404319, 25, 926.46621320666259)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22434, 2, 34.846642, -82.40429, 26, 939.21242453231116)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22435, 2, 34.846764, -82.404229, 27, 953.89197083330487)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22436, 2, 34.8467981, -82.4042084, 28, 958.127458701548)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22437, 2, 34.847171, -82.403983, 29, 1004.4652915973733)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22438, 2, 34.847512, -82.403757, 30, 1047.6769432494996)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22439, 2, 34.848032, -82.403413, 31, 1113.5438700458478)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22440, 2, 34.8481435, -82.4033269, 32, 1128.238484438514)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22441, 2, 34.8481977, -82.403277, 33, 1135.8001188275252)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22442, 2, 34.848224, -82.4032486, 34, 1139.711863709729)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22443, 2, 34.8482573, -82.4032, 35, 1145.4945818859665)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22444, 2, 34.8482573, -82.4032, 36, 1145.4945818859665)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22445, 2, 34.848372, -82.403049, 37, 1164.2914497003808)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22446, 2, 34.848518, -82.402843, 38, 1189.1575047562023)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22447, 2, 34.848518, -82.402843, 39, 1189.1575047562023)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22448, 2, 34.8486125, -82.4027172, 40, 1204.7379540206227)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22449, 2, 34.8488921, -82.4023453, 41, 1250.8148125308503)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22450, 2, 34.8489294, -82.4022956, 42, 1256.9668763430118)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22451, 2, 34.8489294, -82.4022956, 43, 1256.9668763430118)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22452, 2, 34.8489769, -82.4022439, 44, 1264.0562420592685)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22453, 2, 34.8489769, -82.4022439, 45, 1264.0562420592685)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22454, 2, 34.8490935, -82.4021634, 46, 1278.9744461912321)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22455, 2, 34.8492141, -82.4020964, 47, 1293.7288729650711)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22456, 2, 34.8492141, -82.4020964, 48, 1293.7288729650711)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22457, 2, 34.8492822, -82.4020625, 49, 1301.9179093670953)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22458, 2, 34.850061, -82.4016799, 50, 1395.3940341190141)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22459, 2, 34.850061, -82.4016799, 51, 1395.3940341190141)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22460, 2, 34.8501292, -82.401641, 52, 1403.7771142710208)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22461, 2, 34.850193, -82.4015847, 53, 1412.5457015175302)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22462, 2, 34.85025, -82.4015094, 54, 1421.9042851005131)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22463, 2, 34.85025, -82.4015094, 55, 1421.9042851005131)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22464, 2, 34.8503642, -82.4013695, 56, 1439.9304005784911)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22465, 2, 34.8504775, -82.4012045, 57, 1459.5842625920177)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22466, 2, 34.8505403, -82.4011173, 58, 1470.1834272070148)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22467, 2, 34.8506107, -82.4010315, 59, 1481.2670892293174)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22468, 2, 34.85068, -82.4009712, 60, 1490.7455550311158)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22469, 2, 34.8507494, -82.4009175, 61, 1499.8967352998109)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22470, 2, 34.8511927, -82.4007197, 62, 1552.4489061646866)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22471, 2, 34.8512766, -82.4006823, 63, 1562.3938205327409)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22472, 2, 34.8512766, -82.4006823, 64, 1562.3938205327409)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22473, 2, 34.8513617, -82.4006448, 65, 1572.4673353554224)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22474, 2, 34.852291, -82.4002356, 66, 1682.4632169556953)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22475, 2, 34.8523937, -82.4001903, 67, 1694.6218595776491)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22476, 2, 34.8524809, -82.4001519, 68, 1704.9433967684674)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22477, 2, 34.8529968, -82.3999247, 69, 1766.0085052252064)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22478, 2, 34.8529968, -82.3999247, 70, 1766.0085052252064)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22479, 2, 34.853233, -82.399817, 71, 1794.0826472606659)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22480, 2, 34.853366, -82.399751, 72, 1810.068862084436)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22481, 2, 34.853545, -82.399636, 73, 1832.5947280178639)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22482, 2, 34.85375, -82.3994669, 74, 1860.1518807814848)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22483, 2, 34.853918, -82.399292, 75, 1884.7491215177327)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22484, 2, 34.854085, -82.399121, 76, 1909.0312783785489)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22485, 2, 34.85431, -82.398929, 77, 1939.6086941558228)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22486, 2, 34.854524, -82.398794, 78, 1966.4336751456331)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22487, 2, 34.854524, -82.398794, 79, 1966.4336751456331)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22488, 2, 34.854691, -82.399241, 80, 2011.299560430173)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22489, 2, 34.8547474, -82.3993579, 81, 2023.6870969032393)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22490, 2, 34.8548802, -82.3996333, 82, 2052.8665762031728)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22491, 2, 34.854937, -82.399751, 83, 2065.3398607112831)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22492, 2, 34.8550754, -82.4001561, 84, 2105.4243320019109)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22493, 2, 34.8551261, -82.4003076, 85, 2120.370665166593)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22494, 2, 34.8551261, -82.4003076, 86, 2120.370665166593)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22495, 2, 34.8551808, -82.4004524, 87, 2134.932207266419)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22496, 2, 34.8552145, -82.4005417, 88, 2143.9109997108353)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22497, 2, 34.855328, -82.4008424, 89, 2174.1458879563811)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22498, 2, 34.8556092, -82.4015872, 90, 2249.037838461606)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22499, 2, 34.8557044, -82.4018394, 91, 2274.3963242044106)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22500, 2, 34.8558946, -82.4023433, 92, 2325.0626888293832)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22501, 2, 34.8558946, -82.4023433, 93, 2325.0626888293832)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22502, 2, 34.8559338, -82.4024194, 94, 2333.2704556452254)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22503, 2, 34.8559756, -82.4025008, 95, 2342.0421327798604)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22504, 2, 34.8561175, -82.4026932, 96, 2365.6729271138711)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22505, 2, 34.8562525, -82.4028649, 97, 2387.3948754610196)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22506, 2, 34.8564019, -82.4030516, 98, 2411.2162184724912)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22507, 2, 34.8564019, -82.4030516, 99, 2411.2162184724912)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22508, 2, 34.8569558, -82.4035033, 100, 2485.4082401762876)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22509, 2, 34.8569558, -82.4035033, 101, 2485.4082401762876)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22510, 2, 34.8570834, -82.4034416, 102, 2500.6895610019269)
GO
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22511, 2, 34.8573552, -82.4032806, 103, 2534.33107178184)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22512, 2, 34.8574169, -82.4032364, 104, 2542.2987116574991)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22513, 2, 34.8574849, -82.4031629, 105, 2552.4169620889356)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22514, 2, 34.8575436, -82.4030741, 106, 2562.8330204248505)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22515, 2, 34.8576097, -82.4029483, 107, 2576.4780313250726)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22516, 2, 34.857724, -82.402761, 108, 2597.7997874050347)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22517, 2, 34.857892, -82.40247, 109, 2630.3009636380575)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22518, 2, 34.858079, -82.402181, 110, 2663.9199124441311)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22519, 2, 34.859161, -82.40073, 111, 2843.0144365012784)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22520, 2, 34.859227, -82.400612, 112, 2856.0590500147309)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22521, 2, 34.859227, -82.400612, 113, 2856.0590500147309)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22522, 2, 34.859238, -82.40054, 114, 2862.7491968452605)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22523, 2, 34.859212, -82.400388, 115, 2876.9317502100344)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22524, 2, 34.859135, -82.400019, 116, 2911.710489787306)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22525, 2, 34.859101, -82.399857, 117, 2926.9841242774787)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22526, 2, 34.85889, -82.398836, 118, 3023.1591036648783)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22527, 2, 34.858579, -82.397365, 119, 3161.9155040168084)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22528, 2, 34.858579, -82.397365, 120, 3161.9155040168084)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22529, 2, 34.858706, -82.397352, 121, 3176.102515001231)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22530, 2, 34.859272, -82.39718, 122, 3241.0386874837504)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22531, 2, 34.85939, -82.397134, 123, 3254.8302054211931)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22532, 2, 34.860346, -82.39669, 124, 3368.7176285676778)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22533, 2, 34.860794, -82.396485, 125, 3421.9882645554962)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22534, 2, 34.86159, -82.39611, 126, 3516.9886252906758)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22535, 2, 34.861714, -82.396078, 127, 3531.0983849154454)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22536, 2, 34.863003, -82.395912, 128, 3675.3880260923906)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22537, 2, 34.863003, -82.395912, 129, 3675.3880260923906)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22538, 2, 34.862797, -82.393742, 130, 3874.9181639041021)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22539, 2, 34.862797, -82.393742, 131, 3874.9181639041021)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22540, 2, 34.861544, -82.394283, 132, 4022.8961009684112)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22541, 2, 34.861544, -82.394283, 133, 4022.8961009684112)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22542, 2, 34.8604683, -82.394752, 134, 4150.0747838228617)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22543, 2, 34.859888, -82.395005, 135, 4218.6827202043823)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22544, 2, 34.8583026, -82.3956795, 136, 4405.6139024605309)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22545, 2, 34.858231, -82.39571, 137, 4414.0571079332585)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22546, 2, 34.858231, -82.39571, 138, 4414.0571079332585)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22547, 2, 34.8581408, -82.3957468, 139, 4424.6456143344558)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22548, 2, 34.8581325, -82.3957502, 140, 4425.6148524614882)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22549, 2, 34.857724, -82.395922, 141, 4473.7205594968818)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22550, 2, 34.8572429, -82.3961232, 142, 4530.3421566487159)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22551, 2, 34.85715, -82.396162, 143, 4541.2740086169724)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22552, 2, 34.85715, -82.396162, 144, 4541.2740086169724)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22553, 2, 34.8570122, -82.3962211, 145, 4557.5364042820956)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22554, 2, 34.855293, -82.396958, 146, 4760.4098781774137)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22555, 2, 34.854962, -82.3971008, 147, 4799.4975272727543)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22556, 2, 34.854858, -82.397156, 148, 4812.1251931071911)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22557, 2, 34.854858, -82.397156, 149, 4812.1251931071911)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22558, 2, 34.854588, -82.397282, 150, 4844.3099392534405)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22559, 2, 34.854146, -82.397464, 151, 4896.2460745768349)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22560, 2, 34.8540729, -82.39748, 152, 4904.5141490869464)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22561, 2, 34.8539543, -82.3975115, 153, 4918.0267811267631)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22562, 2, 34.8539543, -82.3975115, 154, 4918.0267811267631)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22563, 2, 34.8524767, -82.398182, 155, 5093.5464953566243)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22564, 2, 34.8515463, -82.3986011, 156, 5203.96784126108)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22565, 2, 34.8515463, -82.3986011, 157, 5203.96784126108)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22566, 2, 34.8508232, -82.3989461, 158, 5290.4130386003162)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22567, 2, 34.8507403, -82.3989856, 159, 5300.32155458706)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22568, 2, 34.8507403, -82.3989856, 160, 5300.32155458706)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22569, 2, 34.8506693, -82.3990179, 161, 5308.7583385564076)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22570, 2, 34.8506412, -82.3990306, 162, 5312.0942858007529)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22571, 2, 34.8496109, -82.3994984, 163, 5434.4898833632778)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22572, 2, 34.8495248, -82.3995375, 164, 5444.7182338290786)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22573, 2, 34.8492914, -82.3996435, 165, 5472.4459640921732)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22574, 2, 34.8488156, -82.3998595, 166, 5528.9680859497248)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22575, 2, 34.8487026, -82.3999109, 167, 5542.3948800537792)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22576, 2, 34.8486664, -82.3999273, 168, 5546.6959726878122)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22577, 2, 34.8485024, -82.4000017, 169, 5566.1764905790042)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22578, 2, 34.8483374, -82.4000767, 170, 5585.7804226022236)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22579, 2, 34.8479487, -82.4002528, 171, 5631.9442408309687)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22580, 2, 34.847705499999996, -82.4003635, 172, 5660.8443949389157)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22581, 2, 34.8475797, -82.4004207, 173, 5675.7916346104066)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22582, 2, 34.8474487, -82.4004802, 174, 5691.3546813794328)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22583, 2, 34.8464867, -82.400917, 175, 5805.6373559869735)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22584, 2, 34.8464867, -82.400917, 176, 5805.6373559869735)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22585, 2, 34.846392, -82.400971, 177, 5817.2759772513191)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22586, 2, 34.8461845, -82.4011174, 178, 5843.9674473120294)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22587, 2, 34.8461845, -82.4011174, 179, 5843.9674473120294)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22588, 2, 34.845958, -82.401324, 180, 5875.4633847942778)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22589, 2, 34.845895, -82.401377, 181, 5883.9853909666645)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22590, 2, 34.845834, -82.40143, 182, 5892.3252590775273)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22591, 2, 34.8455653, -82.4016592, 183, 5928.8378193106)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22592, 2, 34.8455653, -82.4016592, 184, 5928.8378193106)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22593, 2, 34.845494, -82.40172, 185, 5938.5255396615585)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22594, 2, 34.8451446, -82.4020518, 186, 5987.8378534944786)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22595, 2, 34.844934, -82.402251, 187, 6017.5164153299856)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22596, 2, 34.844857, -82.40235, 188, 6029.9781075637438)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22597, 2, 34.844755, -82.40253, 189, 6049.9621756515871)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22598, 2, 34.8447009, -82.4026392, 190, 6061.6155337719256)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22599, 2, 34.8446767, -82.4027505, 191, 6072.1347132329493)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22600, 2, 34.844664, -82.402825, 192, 6079.0864082572161)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22601, 2, 34.844631, -82.403026, 193, 6097.8137072856744)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22602, 2, 34.8445617, -82.4037552, 194, 6164.8788872582318)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22603, 2, 34.844521, -82.404215, 195, 6207.1299909190848)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22604, 2, 34.844521, -82.404215, 196, 6207.1299909190848)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22605, 2, 34.844473, -82.404229, 197, 6212.6243500471428)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22606, 2, 34.844406, -82.404275, 198, 6221.1849570096692)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22607, 2, 34.8441825, -82.4045141, 199, 6254.2935608989956)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22608, 2, 34.84409, -82.404614, 200, 6268.0532765514226)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22609, 2, 34.843726, -82.404983, 201, 6320.7640295211613)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22610, 2, 34.843453, -82.405245, 202, 6359.4491203035695)
GO
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22611, 2, 34.843372, -82.405325, 203, 6371.0562663480277)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22612, 2, 34.843052, -82.405586, 204, 6413.9228807859336)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22613, 2, 34.842519, -82.4059946, 205, 6484.0228875472949)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22614, 2, 34.842452, -82.406046, 206, 6492.8366845894816)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22615, 2, 34.842057, -82.406315, 207, 6543.2099972487167)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22616, 2, 34.841948, -82.40636, 208, 6556.0212406869377)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22617, 2, 34.8417973, -82.4063993, 209, 6573.1769766769867)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22618, 2, 34.8417225, -82.4064188, 210, 6581.6926207684774)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22619, 2, 34.8417225, -82.4064188, 211, 6581.6926207684774)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22620, 2, 34.8417222, -82.4065174, 212, 6590.7010421283549)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22621, 2, 34.8417213, -82.406557, 213, 6594.31887093757)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22622, 2, 34.8417035, -82.4067203, 214, 6609.3696946535347)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22623, 2, 34.8416888, -82.406861, 215, 6622.3285068354617)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22624, 2, 34.8416568, -82.4070651, 216, 6641.31305511241)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22625, 2, 34.841604, -82.407404, 217, 6672.82906192102)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (22626, 2, 34.8413229, -82.4086575, 218, 6791.5517549000242)
SET IDENTITY_INSERT [dbo].[Shapes] OFF
SET IDENTITY_INSERT [dbo].[Stops] ON 

INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (24, N'N Main @ Bohemian Cafe', N'N Main @ Bohemian Cafe', 34.8619016, -82.3942142)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (25, N'N Main @ Thomas McAfee', N'N Main @ Thomas McAfee', 34.8602415, -82.3950161)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (26, N'619 N Main', N'619 N Main', 34.8595832, -82.3952439)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (27, N'Towers East Apts', N'Towers East Apts', 34.8558375, -82.3968439)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (28, N'N Main @ NOMA Square', N'N Main @ NOMA Square', 34.8531554, -82.3979107)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (29, N'N Main @ Mast General Store', N'N Main @ Mast General Store', 34.8520171, -82.3984516)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (30, N'N Main @ Certus Bank', N'N Main @ Certus Bank / Project One', 34.8512226, -82.3988049)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (31, N'S Main @ Wells Fargo Plaza', N'S Main @ Wells Fargo Plaza', 34.8503157, -82.3992308)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (32, N'S Main @ Poinsett Plaza', N'S Main @ Poinsett Plaza', 34.8491211, -82.3997923)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (33, N'S Main @ City Hall', N'S Main @ City Hall', 34.8482581, -82.4002633)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (34, N'S Main @ Village Green', N'S Main @ Village Green', 34.8477894, -82.4003879)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (35, N'S Main @ Peace Center', N'S Main @ Peace Center', 34.8466131, -82.400934)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (36, N'S Main @ Falls Park', N'S Main @ Falls Park', 34.8453763, -82.4019207)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (37, N'S Main @ Pomegranate', N'S Main @ Pomegranate', 34.8447334, -82.402793)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (38, N'S Main @ Rick Erwin', N'S Main @ Rick Erwin', 34.844639, -82.4036105)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (39, N'Fluor Field', N'Fluor Field', 34.8416466, -82.407466)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (40, N'Greenville Drive Ticket Office', N'Greenville Drive Ticket Office', 34.8428768, -82.4092208)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (41, N'S Main @ Compadres', N'S Main @ Compadres', 34.8433129, -82.4082198)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (42, N'S Main @ American Grocery', N'S Main @ American Grocery', 34.8442468, -82.4050237)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (43, N'River St @ West Court St', N'River St @ West Court St', 34.8493456, -82.4019878)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (44, N'S Richardson St @ Transit Center', N'S Richardson St @ Transit Center', 34.850448, -82.4010785)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (45, N'Richardson St @ W North St', N'Richardson St @ W North St', 34.8528676, -82.3998933)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (46, N'Heritage Green', N'Heritage Green', 34.8554933, -82.4010898)
SET IDENTITY_INSERT [dbo].[Stops] OFF
SET IDENTITY_INSERT [dbo].[Trolley] ON 

INSERT [dbo].[Trolley] ([ID], [TrolleyName], [Number], [CurrentLat], [CurrentLon]) VALUES (1, N'Trolley', 6, 34.8506231, -82.4003675)
INSERT [dbo].[Trolley] ([ID], [TrolleyName], [Number], [CurrentLat], [CurrentLon]) VALUES (2, N'Trolley', 2, 34.85, -82.4001)
INSERT [dbo].[Trolley] ([ID], [TrolleyName], [Number], [CurrentLat], [CurrentLon]) VALUES (4, N'Trolley', 3, 34.850725, -82.4006867)
INSERT [dbo].[Trolley] ([ID], [TrolleyName], [Number], [CurrentLat], [CurrentLon]) VALUES (5, N'Trolley', 999, 34.8506231, -82.4003675)
INSERT [dbo].[Trolley] ([ID], [TrolleyName], [Number], [CurrentLat], [CurrentLon]) VALUES (6, N'Limo Trolley', 8, 34.872111, -82.396766)
SET IDENTITY_INSERT [dbo].[Trolley] OFF
ALTER TABLE [dbo].[RouteSchedule]  WITH CHECK ADD  CONSTRAINT [FK_RouteSchedule_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([ID])
GO
ALTER TABLE [dbo].[RouteSchedule] CHECK CONSTRAINT [FK_RouteSchedule_Routes]
GO
ALTER TABLE [dbo].[RouteStops]  WITH CHECK ADD  CONSTRAINT [FK_RouteStops_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([ID])
GO
ALTER TABLE [dbo].[RouteStops] CHECK CONSTRAINT [FK_RouteStops_Routes]
GO
ALTER TABLE [dbo].[RouteStops]  WITH CHECK ADD  CONSTRAINT [FK_RouteStops_Stops] FOREIGN KEY([StopID])
REFERENCES [dbo].[Stops] ([ID])
GO
ALTER TABLE [dbo].[RouteStops] CHECK CONSTRAINT [FK_RouteStops_Stops]
GO
ALTER TABLE [dbo].[Shapes]  WITH CHECK ADD  CONSTRAINT [FK_Shapes_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([ID])
GO
ALTER TABLE [dbo].[Shapes] CHECK CONSTRAINT [FK_Shapes_Routes]
GO
USE [master]
GO
ALTER DATABASE [TrolleyTracker] SET  READ_WRITE 
GO
