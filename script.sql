USE [master]
GO
/****** Object:  Database [RENT]    Script Date: 3/4/2019 2:47:04 PM ******/
CREATE DATABASE [RENT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RENT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RENT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RENT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RENT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RENT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RENT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RENT] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [RENT] SET ANSI_NULLS ON 
GO
ALTER DATABASE [RENT] SET ANSI_PADDING ON 
GO
ALTER DATABASE [RENT] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [RENT] SET ARITHABORT ON 
GO
ALTER DATABASE [RENT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RENT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RENT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RENT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RENT] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [RENT] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [RENT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RENT] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [RENT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RENT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RENT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RENT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RENT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RENT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RENT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RENT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RENT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RENT] SET RECOVERY FULL 
GO
ALTER DATABASE [RENT] SET  MULTI_USER 
GO
ALTER DATABASE [RENT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RENT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RENT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RENT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RENT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RENT', N'ON'
GO
ALTER DATABASE [RENT] SET QUERY_STORE = OFF
GO
USE [RENT]
GO
/****** Object:  Table [dbo].[Coustmer]    Script Date: 3/4/2019 2:47:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coustmer](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](10) NULL,
	[LastName] [nchar](10) NULL,
	[Address] [nchar](20) NULL,
	[Phone] [nchar](12) NULL,
 CONSTRAINT [PK_Coustmer] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 3/4/2019 2:47:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [nchar](3) NULL,
	[Title] [nchar](20) NULL,
	[Year] [nchar](5) NULL,
	[Rental_Cost] [money] NULL,
	[Plot] [ntext] NULL,
	[Genre] [nchar](10) NULL,
	[copies] [int] NULL,
 CONSTRAINT [PK_Movies_1] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentedMovies]    Script Date: 3/4/2019 2:47:05 PM ******/
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
	[Rented] [int] NOT NULL,
 CONSTRAINT [PK_RentedMovies] PRIMARY KEY CLUSTERED 
(
	[RMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Coustmer] ON 

INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (2007, N'Johon     ', N'morris    ', N'10 kent road        ', N'9882783827  ')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (2008, N'simer     ', N'sidhu     ', N'129 great South Road', N'0226738275  ')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (2009, N'summet    ', N'sardul    ', N'79 deep road        ', N'9277382637  ')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (2011, N'malkeet   ', N'kaku      ', N'56,east tamaki      ', N'9283784778  ')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (2012, N'Ashkara   ', N'azgar     ', N'39,roturua          ', N'9283748279  ')
INSERT [dbo].[Coustmer] ([CustID], [FirstName], [LastName], [Address], [Phone]) VALUES (2013, N'Nathan    ', N'Dreak     ', N'22 lwaye street     ', N'9284782736  ')
SET IDENTITY_INSERT [dbo].[Coustmer] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (9, N'5  ', N'Inception           ', N'2012 ', 2.0000, N'Space', N'Scfic     ', 10)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (11, N'4  ', N'Spider Man 1        ', N'2010 ', 2.0000, N'Web', N'Hero      ', 5)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (12, N'5  ', N'drang me to hell    ', N'2017 ', 5.0000, N'demon', N'horror    ', 16)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (13, N'5  ', N'drak night          ', N'2012 ', 2.0000, N'batman', N'3         ', 11)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (14, N'5  ', N'suicide squad       ', N'2017 ', 5.0000, N'hero', N'scfic     ', 15)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (15, N'5  ', N'godfather           ', N'2015 ', 5.0000, N'horor', N'sc-fic    ', 14)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (16, N'5  ', N'wrong turn          ', N'2013 ', 5.0000, N'horor', N'horor     ', 17)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (17, N'5  ', N'fast and furios     ', N'2012 ', 2.0000, N'cars', N'racing    ', 6)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (18, N'3  ', N'Project X           ', N'2012 ', 2.0000, N'party', N'real      ', 15)
INSERT [dbo].[Movies] ([MovieID], [Rating], [Title], [Year], [Rental_Cost], [Plot], [Genre], [copies]) VALUES (19, N'3  ', N'asdh                ', N'1991 ', 2.0000, N'asd199', N'asd       ', 1)
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[RentedMovies] ON 

INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (1, 3, 2004, CAST(N'2018-11-12T00:00:00.000' AS DateTime), CAST(N'2018-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (2, 2, 1002, CAST(N'2018-11-12T00:00:00.000' AS DateTime), CAST(N'2018-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (3, 4, 1002, CAST(N'2018-11-12T00:00:00.000' AS DateTime), CAST(N'2018-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (4, 3, 1002, CAST(N'2018-11-12T00:00:00.000' AS DateTime), CAST(N'2018-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (5, 4, 2004, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2018-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (6, 4, 2004, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2018-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (7, 5, 2004, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2018-12-18T00:52:34.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (8, 4, 2006, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2018-12-18T00:52:38.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (9, 5, 2006, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2018-12-18T00:52:42.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (10, 2, 2005, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2018-12-18T00:52:46.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (11, 3, 2006, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2018-12-18T00:52:49.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (12, 3, 2006, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2018-12-18T00:52:52.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (13, 3, 2006, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2018-12-18T00:52:56.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (14, 3, 2006, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2018-12-18T00:53:01.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (15, 2, 2006, CAST(N'2018-12-12T00:00:00.000' AS DateTime), CAST(N'2018-12-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (16, 4, 2006, CAST(N'2018-12-13T02:02:10.350' AS DateTime), CAST(N'2018-12-18T00:53:06.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (17, 3, 2006, CAST(N'2018-12-13T02:02:16.263' AS DateTime), CAST(N'2018-12-13T14:54:55.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (18, 4, 2006, CAST(N'2018-12-13T14:54:11.490' AS DateTime), CAST(N'2018-12-18T00:54:18.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (19, 2, 2004, CAST(N'2018-12-17T12:14:38.703' AS DateTime), CAST(N'2018-12-17T14:39:17.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (20, 15, 2011, CAST(N'2018-12-19T11:09:51.003' AS DateTime), CAST(N'2019-03-04T13:43:45.000' AS DateTime), 1)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (21, 17, 2007, CAST(N'2018-12-19T11:09:58.970' AS DateTime), CAST(N'2019-03-04T12:57:07.000' AS DateTime), 1)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (22, 12, 2011, CAST(N'2018-12-19T11:10:05.513' AS DateTime), CAST(N'2018-12-19T11:10:32.000' AS DateTime), 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (23, 12, 2009, CAST(N'2019-03-04T12:14:17.007' AS DateTime), NULL, 1)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (24, 14, 2011, CAST(N'2019-03-04T12:16:54.910' AS DateTime), NULL, 1)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (25, 13, 2012, CAST(N'2019-03-04T12:32:10.837' AS DateTime), NULL, 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (26, 18, 2013, CAST(N'2019-03-04T12:44:16.603' AS DateTime), NULL, 0)
INSERT [dbo].[RentedMovies] ([RMID], [MovieIDFK], [CustIDFK], [DateRented], [DateReturned], [Rented]) VALUES (27, 19, 2013, CAST(N'2019-03-04T12:48:06.177' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[RentedMovies] OFF
ALTER TABLE [dbo].[RentedMovies] ADD  CONSTRAINT [DF_RentedMovies_isout]  DEFAULT ((0)) FOR [Rented]
GO
USE [master]
GO
ALTER DATABASE [RENT] SET  READ_WRITE 
GO
