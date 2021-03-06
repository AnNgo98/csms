USE [master]
GO
/****** Object:  Database [CSMS.DB.Users]    Script Date: 2/21/2020 12:19:04 AM ******/
CREATE DATABASE [CSMS.DB.Users]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSMS.DB.Users].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSMS.DB.Users] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET ARITHABORT OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CSMS.DB.Users] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CSMS.DB.Users] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CSMS.DB.Users] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CSMS.DB.Users] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET RECOVERY FULL 
GO
ALTER DATABASE [CSMS.DB.Users] SET  MULTI_USER 
GO
ALTER DATABASE [CSMS.DB.Users] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CSMS.DB.Users] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CSMS.DB.Users] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CSMS.DB.Users] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CSMS.DB.Users] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CSMS.DB.Users', N'ON'
GO
ALTER DATABASE [CSMS.DB.Users] SET QUERY_STORE = OFF
GO
USE [CSMS.DB.Users]
GO
/****** Object:  Table [dbo].[CSMS_Log_User_Status]    Script Date: 2/21/2020 12:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Log_User_Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CSMS_User_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Permission]    Script Date: 2/21/2020 12:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Permission] [varchar](50) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_CSMS_Permisison] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Role]    Script Date: 2/21/2020 12:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](200) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_CSMS_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_Status]    Script Date: 2/21/2020 12:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](100) NULL,
	[IsBlockAccess] [bit] NULL,
 CONSTRAINT [PK_CSMS_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_User]    Script Date: 2/21/2020 12:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserCode] [nvarchar](50) NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NULL,
	[CitizenID] [varchar](20) NULL,
	[Gender] [varchar](20) NULL,
	[Birthday] [datetime] NULL,
	[Email] [varchar](200) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Username] [varchar](100) NULL,
	[Password] [varchar](200) NULL,
	[BranchId] [int] NULL,
	[RoleId] [int] NULL,
	[StatusId] [int] NULL,
	[Deleted] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_CSMS_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_User_Address]    Script Date: 2/21/2020 12:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_User_Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Receiver] [nvarchar](200) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Province] [nvarchar](100) NOT NULL,
	[District] [nvarchar](100) NOT NULL,
	[Ward] [nvarchar](100) NOT NULL,
	[Detail] [nvarchar](200) NULL,
	[IsDefault] [bit] NULL,
 CONSTRAINT [PK_CSMS_User_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMS_User_Other_Permission]    Script Date: 2/21/2020 12:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMS_User_Other_Permission](
	[UserId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
 CONSTRAINT [PK_CSMS_User_Other_Permission_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CSMS_Log_User_Status] ON 

INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (10, 1, 1, CAST(N'2020-02-05T00:16:25.010' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (11, 2, 1, CAST(N'2020-02-05T00:16:25.607' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (12, 5, 1, CAST(N'2020-02-05T00:16:26.083' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (13, 6, 1, CAST(N'2020-02-05T00:16:26.580' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (14, 7, 1, CAST(N'2020-02-05T00:16:27.107' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (15, 8, 1, CAST(N'2020-02-05T00:16:27.627' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (16, 9, 1, CAST(N'2020-02-05T00:16:28.113' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (17, 10, 1, CAST(N'2020-02-05T00:16:28.620' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (18, 11, 1, CAST(N'2020-02-05T00:16:29.147' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (19, 12, 1, CAST(N'2020-02-05T00:16:29.670' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (20, 13, 1, CAST(N'2020-02-05T00:16:30.170' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (21, 14, 1, CAST(N'2020-02-05T00:16:30.690' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (22, 15, 1, CAST(N'2020-02-05T00:16:31.193' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (23, 16, 1, CAST(N'2020-02-05T00:16:31.703' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (24, 17, 1, CAST(N'2020-02-05T00:16:32.220' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (25, 18, 1, CAST(N'2020-02-05T00:16:32.793' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (26, 19, 1, CAST(N'2020-02-05T00:16:33.303' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (27, 20, 1, CAST(N'2020-02-05T00:16:33.790' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (28, 21, 1, CAST(N'2020-02-05T00:16:34.290' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (29, 22, 1, CAST(N'2020-02-05T00:16:34.787' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (30, 23, 1, CAST(N'2020-02-05T00:16:35.280' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (31, 24, 1, CAST(N'2020-02-05T00:16:35.777' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (32, 25, 1, CAST(N'2020-02-05T00:16:36.317' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (33, 26, 1, CAST(N'2020-02-05T00:16:36.800' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (34, 27, 1, CAST(N'2020-02-05T00:16:37.297' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (35, 28, 1, CAST(N'2020-02-05T00:16:37.813' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (36, 29, 1, CAST(N'2020-02-05T00:16:38.343' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (37, 30, 1, CAST(N'2020-02-05T00:16:38.870' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (38, 31, 1, CAST(N'2020-02-05T00:16:39.380' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (39, 32, 1, CAST(N'2020-02-05T00:16:39.907' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (40, 1, 3, CAST(N'2020-02-05T16:03:31.950' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (41, 1, 1, CAST(N'2020-02-05T16:24:49.900' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (42, 2, 3, CAST(N'2020-02-05T23:31:13.510' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (43, 5, 2, CAST(N'2020-02-05T23:31:15.553' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (44, 2, 1, CAST(N'2020-02-05T23:31:28.160' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (45, 5, 1, CAST(N'2020-02-05T23:31:32.363' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (46, 33, 1, CAST(N'2020-02-07T22:34:48.567' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (47, 34, 1, CAST(N'2020-02-07T22:34:50.090' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (48, 35, 1, CAST(N'2020-02-07T22:34:51.147' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (49, 36, 1, CAST(N'2020-02-07T22:34:52.143' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (50, 37, 1, CAST(N'2020-02-07T22:34:53.220' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (51, 38, 1, CAST(N'2020-02-07T22:34:54.163' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (52, 39, 1, CAST(N'2020-02-07T22:34:55.083' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (53, 40, 1, CAST(N'2020-02-07T22:34:56.423' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (54, 41, 1, CAST(N'2020-02-07T22:34:57.187' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (55, 42, 1, CAST(N'2020-02-07T22:34:57.953' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (56, 43, 1, CAST(N'2020-02-07T22:34:58.640' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (57, 44, 1, CAST(N'2020-02-07T22:34:59.373' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (58, 45, 1, CAST(N'2020-02-07T22:35:00.190' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (59, 46, 1, CAST(N'2020-02-07T22:35:01.483' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (60, 47, 1, CAST(N'2020-02-07T22:35:01.590' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (61, 48, 1, CAST(N'2020-02-07T22:35:02.250' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (62, 49, 1, CAST(N'2020-02-07T22:35:02.913' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (63, 50, 1, CAST(N'2020-02-07T22:35:03.553' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (64, 51, 1, CAST(N'2020-02-07T22:35:04.260' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (65, 52, 1, CAST(N'2020-02-07T22:35:04.947' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (66, 53, 1, CAST(N'2020-02-07T22:35:05.610' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (67, 54, 1, CAST(N'2020-02-07T22:35:06.327' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (68, 55, 1, CAST(N'2020-02-07T22:35:07.033' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (69, 56, 1, CAST(N'2020-02-07T22:35:07.777' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (70, 57, 1, CAST(N'2020-02-07T22:35:08.480' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (71, 58, 1, CAST(N'2020-02-07T22:35:09.243' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (72, 59, 1, CAST(N'2020-02-07T22:35:09.950' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (73, 60, 1, CAST(N'2020-02-07T22:35:10.843' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (74, 61, 1, CAST(N'2020-02-07T22:35:11.610' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (75, 62, 1, CAST(N'2020-02-07T22:35:12.420' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (76, 63, 1, CAST(N'2020-02-07T22:35:13.520' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (77, 64, 1, CAST(N'2020-02-07T22:35:14.360' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (78, 65, 1, CAST(N'2020-02-07T22:35:15.137' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (79, 66, 1, CAST(N'2020-02-07T22:35:15.990' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (80, 67, 1, CAST(N'2020-02-07T22:35:16.733' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (81, 68, 1, CAST(N'2020-02-07T22:35:17.540' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (82, 69, 1, CAST(N'2020-02-07T22:35:18.400' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (83, 70, 1, CAST(N'2020-02-07T22:35:19.177' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (84, 71, 1, CAST(N'2020-02-07T22:35:19.917' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (85, 72, 1, CAST(N'2020-02-07T22:35:20.720' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (86, 73, 1, CAST(N'2020-02-07T22:35:21.537' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (87, 74, 1, CAST(N'2020-02-07T22:35:22.260' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (88, 75, 1, CAST(N'2020-02-07T22:35:22.933' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (89, 76, 1, CAST(N'2020-02-07T22:35:23.740' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (90, 77, 1, CAST(N'2020-02-07T22:35:24.727' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (91, 78, 1, CAST(N'2020-02-07T22:35:26.020' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (92, 79, 1, CAST(N'2020-02-07T22:35:27.323' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (93, 80, 1, CAST(N'2020-02-07T22:35:28.080' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (94, 81, 1, CAST(N'2020-02-07T22:35:28.817' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (95, 82, 1, CAST(N'2020-02-07T22:35:29.597' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (96, 83, 1, CAST(N'2020-02-07T22:35:30.443' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (97, 84, 1, CAST(N'2020-02-07T22:35:30.847' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (98, 85, 1, CAST(N'2020-02-07T22:35:30.990' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (99, 86, 1, CAST(N'2020-02-07T22:35:31.143' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (100, 87, 1, CAST(N'2020-02-07T22:35:32.007' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (101, 88, 1, CAST(N'2020-02-07T22:35:32.160' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (102, 89, 1, CAST(N'2020-02-07T22:35:32.947' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (103, 90, 1, CAST(N'2020-02-07T22:35:46.070' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (104, 91, 1, CAST(N'2020-02-07T22:35:47.653' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (105, 92, 1, CAST(N'2020-02-07T22:35:48.700' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (106, 93, 1, CAST(N'2020-02-07T22:35:49.610' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (107, 94, 1, CAST(N'2020-02-07T22:35:50.407' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (108, 95, 1, CAST(N'2020-02-07T22:35:51.233' AS DateTime))
GO
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (109, 96, 1, CAST(N'2020-02-07T22:35:52.097' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (110, 97, 1, CAST(N'2020-02-07T22:35:53.070' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (111, 98, 1, CAST(N'2020-02-07T22:35:53.940' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (112, 99, 1, CAST(N'2020-02-07T22:35:55.963' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (113, 100, 1, CAST(N'2020-02-07T22:35:57.083' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (114, 101, 1, CAST(N'2020-02-07T22:35:58.097' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (115, 102, 1, CAST(N'2020-02-07T22:35:59.180' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (131, 103, 1, CAST(N'2020-02-07T22:35:59.180' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (132, 104, 1, CAST(N'2020-02-07T22:35:59.180' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (135, 113, 1, CAST(N'2020-02-19T17:56:27.920' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (136, 2, 2, CAST(N'2020-02-20T15:52:34.163' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (137, 2, 3, CAST(N'2020-02-20T15:52:46.870' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (138, 2, 1, CAST(N'2020-02-20T15:52:57.057' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (139, 32, 3, CAST(N'2020-02-20T22:30:18.640' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (140, 114, 1, CAST(N'2020-02-20T22:57:07.980' AS DateTime))
INSERT [dbo].[CSMS_Log_User_Status] ([Id], [UserId], [StatusId], [ModifiedDate]) VALUES (141, 115, 1, CAST(N'2020-02-20T23:00:17.730' AS DateTime))
SET IDENTITY_INSERT [dbo].[CSMS_Log_User_Status] OFF
SET IDENTITY_INSERT [dbo].[CSMS_Role] ON 

INSERT [dbo].[CSMS_Role] ([Id], [Role], [Title]) VALUES (1, N'Customer', N'Customer')
INSERT [dbo].[CSMS_Role] ([Id], [Role], [Title]) VALUES (2, N'Admin', N'Admin')
INSERT [dbo].[CSMS_Role] ([Id], [Role], [Title]) VALUES (3, N'Sale', N'Sale')
INSERT [dbo].[CSMS_Role] ([Id], [Role], [Title]) VALUES (4, N'Waiter', N'Waiter')
INSERT [dbo].[CSMS_Role] ([Id], [Role], [Title]) VALUES (5, N'Shipper', N'Shipper')
SET IDENTITY_INSERT [dbo].[CSMS_Role] OFF
SET IDENTITY_INSERT [dbo].[CSMS_Status] ON 

INSERT [dbo].[CSMS_Status] ([Id], [Status], [IsBlockAccess]) VALUES (1, N'Working', 0)
INSERT [dbo].[CSMS_Status] ([Id], [Status], [IsBlockAccess]) VALUES (2, N'Terminated', 1)
INSERT [dbo].[CSMS_Status] ([Id], [Status], [IsBlockAccess]) VALUES (3, N'Blocked', 1)
SET IDENTITY_INSERT [dbo].[CSMS_Status] OFF
SET IDENTITY_INSERT [dbo].[CSMS_User] ON 

INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (1, N'0001', N'Thủy', N'Đào', N'Xuân', N'251125147', N'Male', CAST(N'1998-05-09T00:00:00.000' AS DateTime), N'thuydx.9598@gmai.com', N'0979 31 9598', N'thuydao', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 2, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (2, N'0002', N'Minh', N'Tran', N'Van', N'222322323', N'Male', CAST(N'2004-04-01T00:00:00.000' AS DateTime), N'minhtran@gmail.com', N'0978546212', N'minhtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (5, N'0003', N'David', N'Mike', N'', N'222322323', N'Male', CAST(N'2010-12-08T00:00:00.000' AS DateTime), N'david@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (6, N'0004', N'Hoàng', N'Đào', N'Xuân', N'222322323', N'Male', CAST(N'1999-09-19T00:00:00.000' AS DateTime), N'hoangdao@gmail.com', N'0928373811', N'hoangdao', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (7, N'0005', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (8, N'0006', N'Thanh', N'Lê', N'Thị Kim', N'12312334', N'Female', CAST(N'1999-02-22T00:00:00.000' AS DateTime), N'lekiimthanh@gmail.com', N'0352 456 377', N'thanhkiim', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (9, N'0007', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (10, N'0008', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (11, N'0009', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (12, N'0010', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (13, N'0011', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'2011-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (14, N'0012', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (15, N'0013', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (16, N'0014', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 3, 3, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (17, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 4, 2, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (18, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (19, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (20, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (21, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (22, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (23, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (24, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (25, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (26, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (27, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (28, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (29, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (30, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (31, N'', N'Minh', N'Luong', N'Vi', N'056236655', N'Female', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'minhluongvi@gmail.com', N'0956232558', N'minhluong', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (32, N'', N'Hòa', N'Nguyễn', N'', N'242387487', N'Male', CAST(N'1987-11-11T00:00:00.000' AS DateTime), N'hoanguyen@gmail.com', N'0123823482', N'hoanguyen', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', NULL, 1, 3, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (33, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (34, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (35, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (36, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (37, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (38, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (39, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (40, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (41, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (42, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (43, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (44, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (45, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (46, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (47, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (48, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (49, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (50, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (51, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (52, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (53, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (54, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (55, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (56, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (57, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (58, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (59, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (60, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (61, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (62, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (63, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (64, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (65, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (66, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (67, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (68, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (69, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (70, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (71, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (72, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (73, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (74, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (75, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (76, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (77, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (78, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (79, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (80, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (81, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (82, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (83, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (84, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (85, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (86, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (87, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (88, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (89, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (90, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (91, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (92, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (93, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (94, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (95, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (96, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (97, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (98, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (99, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (100, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 2, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (101, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 3, 5, 1, 0, NULL, NULL)
GO
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (102, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 4, 3, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (103, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 5, 4, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (104, N'0015', N'Luong', N'Tran', N'Duc', N'222322323', N'Male', CAST(N'1998-12-12T00:00:00.000' AS DateTime), N'luongtran@gmail.com', N'0978546212', N'luongtran', N'$2a$10$nrXjJd7pzyRFC1I.FJ1LhOuYH/.9.FR2aX2w0o01AiPojUlj0jVhq', 1, 5, 1, 0, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (113, N'0092', N'test', N'test', NULL, NULL, N'Male', CAST(N'2020-02-18T00:00:00.000' AS DateTime), NULL, NULL, N'test', N'$2a$10$NFMI6v5LCuq2jcJn/mhwoO9u3ZTJpqabr1nBP0fSDmnRIUA3hQCnS', 2, 5, 1, NULL, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (114, NULL, N'Nam', N'Phan', N'Thanh', N'282348', N'Male', CAST(N'2016-03-10T00:00:00.000' AS DateTime), N'phannamyoyo@gmail.com', N'012392348234', N'namphan', N'$2a$10$k.5ym/OFuFMVkwHTLdRVi.nCrakix4qoPD2ohPHDyConUes5RbMUC', NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[CSMS_User] ([Id], [UserCode], [FirstName], [LastName], [MiddleName], [CitizenID], [Gender], [Birthday], [Email], [PhoneNumber], [Username], [Password], [BranchId], [RoleId], [StatusId], [Deleted], [CreateDate], [UpdateDate]) VALUES (115, NULL, N'Thiện', N'Nguyễn', N'Út', N'2932949', N'Male', CAST(N'2020-02-05T00:00:00.000' AS DateTime), N'nguyenthien113@gmail.com', N'02923892838', N'thiennguyen', N'$2a$10$60jcKvL978kEB/RzXdQLueHH5/vCBCb340KXsbwIoW.EZ8P1aFJRG', NULL, 1, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CSMS_User] OFF
SET IDENTITY_INSERT [dbo].[CSMS_User_Address] ON 

INSERT [dbo].[CSMS_User_Address] ([Id], [UserId], [Receiver], [PhoneNumber], [Country], [Province], [District], [Ward], [Detail], [IsDefault]) VALUES (10, 8, N'Dao Xuan Thuy', N'0979 31 9598', N'Việt Nam', N'Lâm Đồng', N'Di Linh', N'Hòa Ninh', N'Ấp Sóc Trào', 1)
INSERT [dbo].[CSMS_User_Address] ([Id], [UserId], [Receiver], [PhoneNumber], [Country], [Province], [District], [Ward], [Detail], [IsDefault]) VALUES (15, 1, N'Dao Xuan Thuy', N'0979 31 9598', N'Việt Nam', N'Đồng Nai', N'Vĩnh Cửu', N'Trị An', N'101 ', 0)
INSERT [dbo].[CSMS_User_Address] ([Id], [UserId], [Receiver], [PhoneNumber], [Country], [Province], [District], [Ward], [Detail], [IsDefault]) VALUES (16, 1, N'Le Kim Thanh', N'0352 456 377', N'Việt Nam', N'Bình Dương', N'Bến Cát', N'Trừ Văn Thố', N'102', 1)
SET IDENTITY_INSERT [dbo].[CSMS_User_Address] OFF
ALTER TABLE [dbo].[CSMS_Log_User_Status]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Log_User_Status_CSMS_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[CSMS_Status] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Log_User_Status] CHECK CONSTRAINT [FK_CSMS_Log_User_Status_CSMS_Status]
GO
ALTER TABLE [dbo].[CSMS_Log_User_Status]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Log_User_Status_CSMS_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[CSMS_User] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Log_User_Status] CHECK CONSTRAINT [FK_CSMS_Log_User_Status_CSMS_User]
GO
ALTER TABLE [dbo].[CSMS_Permission]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_Permisison_CSMS_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[CSMS_Role] ([Id])
GO
ALTER TABLE [dbo].[CSMS_Permission] CHECK CONSTRAINT [FK_CSMS_Permisison_CSMS_Role]
GO
ALTER TABLE [dbo].[CSMS_User]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_User_CSMS_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[CSMS_Role] ([Id])
GO
ALTER TABLE [dbo].[CSMS_User] CHECK CONSTRAINT [FK_CSMS_User_CSMS_Role]
GO
ALTER TABLE [dbo].[CSMS_User]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_User_CSMS_Status_Custom] FOREIGN KEY([StatusId])
REFERENCES [dbo].[CSMS_Status] ([Id])
GO
ALTER TABLE [dbo].[CSMS_User] CHECK CONSTRAINT [FK_CSMS_User_CSMS_Status_Custom]
GO
ALTER TABLE [dbo].[CSMS_User_Address]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_User_Address_CSMS_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[CSMS_User] ([Id])
GO
ALTER TABLE [dbo].[CSMS_User_Address] CHECK CONSTRAINT [FK_CSMS_User_Address_CSMS_User]
GO
ALTER TABLE [dbo].[CSMS_User_Other_Permission]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_User_Other_Permission_CSMS_Permisison] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[CSMS_Permission] ([Id])
GO
ALTER TABLE [dbo].[CSMS_User_Other_Permission] CHECK CONSTRAINT [FK_CSMS_User_Other_Permission_CSMS_Permisison]
GO
ALTER TABLE [dbo].[CSMS_User_Other_Permission]  WITH CHECK ADD  CONSTRAINT [FK_CSMS_User_Other_Permission_CSMS_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[CSMS_User] ([Id])
GO
ALTER TABLE [dbo].[CSMS_User_Other_Permission] CHECK CONSTRAINT [FK_CSMS_User_Other_Permission_CSMS_User]
GO
/****** Object:  Trigger [dbo].[Csms_User.AfterInsertUpdateTrigger]    Script Date: 2/21/2020 12:19:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Csms_User.AfterInsertUpdateTrigger] ON [dbo].[CSMS_User]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @user_id int;
	DECLARE @old_status int;
	DECLARE @new_status int;

	SELECT @user_id = i.Id, @new_status = i.StatusId FROM inserted i;

	IF NOT EXISTS(SELECT * FROM DELETED)
    BEGIN  -- Insert
		UPDATE CSMS_User
		SET StatusId = 1
		WHERE Id = @user_id

		INSERT INTO CSMS_Log_User_Status (UserId, StatusId, ModifiedDate)
		VALUES (@user_id, 1, GETDATE())
    END
	ELSE  -- Update
	BEGIN
		SELECT @old_status = i.StatusId FROM deleted i;
		IF @old_status != @new_status
		BEGIN
			INSERT INTO CSMS_Log_User_Status (UserId, StatusId, ModifiedDate)
			VALUES (@user_id, @new_status, GETDATE())
		END
	END
END
GO
ALTER TABLE [dbo].[CSMS_User] ENABLE TRIGGER [Csms_User.AfterInsertUpdateTrigger]
GO
/****** Object:  Trigger [dbo].[Csms_User_Address.AfterInsertTrigger]    Script Date: 2/21/2020 12:19:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Csms_User_Address.AfterInsertTrigger] ON [dbo].[CSMS_User_Address]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @address_id int;
	DECLARE @user_id int;
	DECLARE @count int;
	DECLARE @new_is_default_value bit;

	SELECT @address_id = i.Id, @user_id = i.UserId, @new_is_default_value = i.IsDefault FROM inserted i;
	SELECT @count = COUNT(*) FROM CSMS_User_Address i WHERE i.UserId = @user_id;

	IF @count = 1
    BEGIN
		UPDATE CSMS_User_Address
		SET IsDefault = 1
		WHERE Id = @address_id
    END

	IF @count != 1 AND @new_is_default_value = 1
	BEGIN
		UPDATE CSMS_User_Address
		SET IsDefault = 0
		WHERE Id != @address_id AND UserId = @user_id
	END
END
GO
ALTER TABLE [dbo].[CSMS_User_Address] ENABLE TRIGGER [Csms_User_Address.AfterInsertTrigger]
GO
USE [master]
GO
ALTER DATABASE [CSMS.DB.Users] SET  READ_WRITE 
GO
