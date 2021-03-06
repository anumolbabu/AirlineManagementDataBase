USE [master]
GO
/****** Object:  Database [AirLineDB]    Script Date: 20-05-2022 11:04:43 ******/
CREATE DATABASE [AirLineDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AirLineDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AirLineDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AirLineDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AirLineDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AirLineDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AirLineDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AirLineDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AirLineDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AirLineDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AirLineDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AirLineDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AirLineDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AirLineDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AirLineDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AirLineDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AirLineDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AirLineDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AirLineDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AirLineDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AirLineDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AirLineDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AirLineDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AirLineDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AirLineDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AirLineDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AirLineDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AirLineDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AirLineDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AirLineDB] SET RECOVERY FULL 
GO
ALTER DATABASE [AirLineDB] SET  MULTI_USER 
GO
ALTER DATABASE [AirLineDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AirLineDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AirLineDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AirLineDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AirLineDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AirLineDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AirLineDB', N'ON'
GO
ALTER DATABASE [AirLineDB] SET QUERY_STORE = OFF
GO
USE [AirLineDB]
GO
/****** Object:  Table [dbo].[Airline]    Script Date: 20-05-2022 11:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airline](
	[AirlineID] [int] IDENTITY(1,1) NOT NULL,
	[AirlineName] [nchar](500) NULL,
	[ContactNumber] [int] NULL,
	[ContactAddress] [nchar](500) NULL,
	[IsBlocked] [int] NULL,
	[IsDeleted] [int] NULL,
	[CreatedDate] [date] NULL,
	[CreatedBy] [nchar](500) NULL,
	[UpdatedDate] [date] NULL,
	[UpdatedBy] [nchar](500) NULL,
 CONSTRAINT [PK_Airline] PRIMARY KEY CLUSTERED 
(
	[AirlineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 20-05-2022 11:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetails](
	[PnrNumber] [int] IDENTITY(2000,1) NOT NULL,
	[UserID] [int] NULL,
	[ScheduleID] [int] NULL,
	[BookingStatus] [int] NULL,
	[TotalPrice] [int] NULL,
	[IsRoundTrip] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nchar](500) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nchar](500) NULL,
 CONSTRAINT [PK_BookingDetails] PRIMARY KEY CLUSTERED 
(
	[PnrNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 20-05-2022 11:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[FlightID] [int] IDENTITY(10000,1) NOT NULL,
	[FlightNumber] [int] NOT NULL,
	[AirlineID] [int] NOT NULL,
	[InstrumentUsed] [nchar](500) NULL,
	[BusinessClassSeatsCount] [int] NULL,
	[NumberOfRows] [int] NULL,
	[TotalSeatsCount] [int] NOT NULL,
	[IsMealOpted] [int] NULL,
	[IsDeleted] [int] NULL,
	[CreatedBy] [nchar](500) NULL,
	[Createddate] [datetime] NULL,
	[UpdatedBy] [nchar](500) NULL,
	[UpadatedDate] [datetime] NULL,
 CONSTRAINT [PK_Flight] PRIMARY KEY CLUSTERED 
(
	[FlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealInfo]    Script Date: 20-05-2022 11:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealInfo](
	[MealID] [int] NULL,
	[FlightID] [int] NULL,
	[MealType] [nchar](200) NULL,
	[MealName] [nchar](500) NULL,
	[CreatedBy] [nchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nchar](500) NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 20-05-2022 11:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger](
	[PassengerID] [int] IDENTITY(1,1) NOT NULL,
	[PnrNumber] [int] NULL,
	[PassengerName] [nchar](500) NULL,
	[Gender] [nchar](10) NULL,
	[Age] [int] NULL,
	[MealID] [nchar](10) NULL,
	[SeatNumber] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nchar](500) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nchar](500) NULL,
 CONSTRAINT [PK_Passenger] PRIMARY KEY CLUSTERED 
(
	[PassengerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 20-05-2022 11:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[FlightID] [int] NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [datetime] NOT NULL,
	[FromPlace] [nchar](500) NOT NULL,
	[ToPlace] [nchar](500) NOT NULL,
	[TicketCost] [int] NULL,
	[MealID] [int] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 20-05-2022 11:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](500) NOT NULL,
	[Email] [nchar](500) NOT NULL,
	[Password] [nchar](500) NOT NULL,
	[Role] [int] NOT NULL,
	[IsDeleted] [int] NOT NULL,
	[CreatedBy] [nchar](500) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedBy] [nchar](500) NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [AirLineDB] SET  READ_WRITE 
GO
