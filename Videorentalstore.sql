USE [master]
GO
/****** Object:  Database [Videostore]    Script Date: 5/02/2019 11:01:40 AM ******/
CREATE DATABASE [Videostore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Videostore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Videostore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Videostore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Videostore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Videostore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Videostore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Videostore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Videostore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Videostore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Videostore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Videostore] SET ARITHABORT OFF 
GO
ALTER DATABASE [Videostore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Videostore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Videostore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Videostore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Videostore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Videostore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Videostore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Videostore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Videostore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Videostore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Videostore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Videostore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Videostore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Videostore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Videostore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Videostore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Videostore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Videostore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Videostore] SET  MULTI_USER 
GO
ALTER DATABASE [Videostore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Videostore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Videostore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Videostore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Videostore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Videostore] SET QUERY_STORE = OFF
GO
USE [Videostore]
GO
/****** Object:  Table [dbo].[Coustmer]    Script Date: 5/02/2019 11:01:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coustmer](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[Address] [nvarchar](20) NULL,
	[Phone] [nvarchar](20) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 5/02/2019 11:01:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MoviedID] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [nvarchar](5) NULL,
	[Title] [nvarchar](50) NULL,
	[Year] [nvarchar](10) NULL,
	[Rental_Cost] [money] NULL,
	[Plot] [ntext] NULL,
	[Genre] [nchar](10) NULL,
	[copies] [int] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MoviedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentedMovies]    Script Date: 5/02/2019 11:01:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentedMovies](
	[RMID] [int] IDENTITY(1,1) NOT NULL,
	[MovieIDFK] [int] NULL,
	[CustIDFK] [int] NULL,
	[DateRented] [datetime] NULL,
	[DateReturned] [datetime] NULL,
	[isout] [int] NOT NULL,
 CONSTRAINT [PK_RentedMovies] PRIMARY KEY CLUSTERED 
(
	[RMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userdata]    Script Date: 5/02/2019 11:01:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userdata](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Registrationtable] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Coustmer] ON 

INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1007, N'34', N'32', N'456', N'47')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1008, N'raj', N'mal', N'45 jes rd', N'20215169693')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1009, N'les', N'jes', N'15 jit rd', N'02019163635')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1010, N'het', N'peet', N'12 fed rd', N'252568683')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1011, N'jip', N'kel', N'12 nil rd', N'25063638')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1012, N'kip', N'lip', N'14 hed rd', N'0202484856')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1013, N'lok', N'nit', N'29 git rd', N'02035359')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1014, N'hiy', N'pol', N'53 gip rd', N'02015157')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1015, N'jus', N'jet', N'54 rit rd', N'02013136')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (1016, N'kil', N'jil', N'85ged rd', N'02019197')
SET IDENTITY_INSERT [dbo].[Coustmer] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MoviedID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (1, N'3', N'mr bean', N'2003', 2.0000, N'hj', N'comedy    ', 8)
INSERT [dbo].[Movies] ([MoviedID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (2, N'3', N'dfds', N'34', 2.0000, N'wer', N'wer       ', 3)
INSERT [dbo].[Movies] ([MoviedID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (1002, N'5', N'Avengers', N'2018', 5.0000, N'hi', N'Action    ', 1)
INSERT [dbo].[Movies] ([MoviedID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (1003, N'5', N'mission impossible 8', N'2018', 5.0000, N'lp', N'Action    ', 2)
INSERT [dbo].[Movies] ([MoviedID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (1004, N'4', N'Daddys Home 2', N'2016', 5.0000, N'kp', N'comedy    ', 5)
INSERT [dbo].[Movies] ([MoviedID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (1005, N'3', N'Amazing spiderman', N'2016', 5.0000, N'jk', N'super hero', 2)
INSERT [dbo].[Movies] ([MoviedID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (1006, N'3', N'Amazing spiderman', N'2016', 5.0000, N'jk', N'comic     ', 2)
INSERT [dbo].[Movies] ([MoviedID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (1007, N'5', N'fast and furious 8', N'2018', 5.0000, N'lp', N'Action    ', 3)
INSERT [dbo].[Movies] ([MoviedID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (1008, N'5', N'Aqua Man', N'2018', 5.0000, N'hi', N'Action    ', 1)
INSERT [dbo].[Movies] ([MoviedID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (1009, N'5', N'Bumblebee', N'2018', 5.0000, N'hi', N'Action    ', 2)
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[RentedMovies] ON 

INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [isout]) VALUES (1, 1, 1, CAST(N'2018-12-17T14:24:23.063' AS DateTime), CAST(N'2019-05-02T10:53:56.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [isout]) VALUES (2, 1, 1, CAST(N'2018-12-17T14:48:44.240' AS DateTime), NULL, 1)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [isout]) VALUES (3, 1, 1007, CAST(N'2018-12-21T06:43:14.013' AS DateTime), CAST(N'2019-05-02T11:00:12.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [isout]) VALUES (4, 1, 1007, CAST(N'2018-12-21T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [isout]) VALUES (5, 1002, 1009, CAST(N'2019-02-05T10:59:10.070' AS DateTime), CAST(N'2019-05-02T11:00:19.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[RentedMovies] OFF
INSERT [dbo].[userdata] ([Username], [Password]) VALUES (N'', N'')
INSERT [dbo].[userdata] ([Username], [Password]) VALUES (N'1', N'1')
INSERT [dbo].[userdata] ([Username], [Password]) VALUES (N'12', N'12')
INSERT [dbo].[userdata] ([Username], [Password]) VALUES (N'a1', N'a1')
INSERT [dbo].[userdata] ([Username], [Password]) VALUES (N'askaran', N'deep')
INSERT [dbo].[userdata] ([Username], [Password]) VALUES (N'deep', N'askaran')
INSERT [dbo].[userdata] ([Username], [Password]) VALUES (N'jati', N'abc123')
INSERT [dbo].[userdata] ([Username], [Password]) VALUES (N'simer', N'sidhu')
INSERT [dbo].[userdata] ([Username], [Password]) VALUES (N'Simerpreet', N'simer485859')
ALTER TABLE [dbo].[RentedMovies] ADD  CONSTRAINT [DF_RentedMovies_isout]  DEFAULT ((0)) FOR [isout]
GO
USE [master]
GO
ALTER DATABASE [Videostore] SET  READ_WRITE 
GO
