USE [master]
GO
/****** Object:  Database [PREMIERE]    Script Date: 6/13/2017 12:43:25 AM ******/
CREATE DATABASE [PREMIERE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PREMIERE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\PREMIERE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PREMIERE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\PREMIERE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PREMIERE] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PREMIERE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PREMIERE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PREMIERE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PREMIERE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PREMIERE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PREMIERE] SET ARITHABORT OFF 
GO
ALTER DATABASE [PREMIERE] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PREMIERE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PREMIERE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PREMIERE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PREMIERE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PREMIERE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PREMIERE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PREMIERE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PREMIERE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PREMIERE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PREMIERE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PREMIERE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PREMIERE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PREMIERE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PREMIERE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PREMIERE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PREMIERE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PREMIERE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PREMIERE] SET  MULTI_USER 
GO
ALTER DATABASE [PREMIERE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PREMIERE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PREMIERE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PREMIERE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PREMIERE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PREMIERE] SET QUERY_STORE = OFF
GO
USE [PREMIERE]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [yehuda]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [yehuda] WITH PASSWORD=N'qOH+X4cnp4t46qto90FAnbsVQ1soQTic+/tt/NzwKw0=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [yehuda] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [yehoshua]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [yehoshua] WITH PASSWORD=N'q9bwCbcjbw/lSj+WRxfi0Ua5ELw3M72R6Bdl8tC+KnA=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [yehoshua] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [valKai]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [valKai] WITH PASSWORD=N'uPJYOl5uTgj7SsUWcColgR2LFo0hvUhQ234T+/WGWiQ=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [valKai] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [tobi]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [tobi] WITH PASSWORD=N'TkhDgoxE/pH0SoBj6U7+HbxFtiSdVrjWkZU5HukdHE8=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [tobi] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [sqlLogin]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [sqlLogin] WITH PASSWORD=N'RrX7nfPA4ZkqFzua7BJtI747lfnqvkX5D5x4l3Qnmms=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [sqlLogin] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [rivka]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [rivka] WITH PASSWORD=N'ZzIQ/UuEwkVHTqGlolJZwK6+lY0+h5UEeSfGq811xPk=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [rivka] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [pessie]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [pessie] WITH PASSWORD=N'uZyiV560tteT0qR9OhFYfgQpk7p8zOlwYTrsrxrEbks=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [pessie] DISABLE
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY$SQLEXPRESS]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [NT SERVICE\SQLTELEMETRY$SQLEXPRESS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQL$SQLEXPRESS]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [NT Service\MSSQL$SQLEXPRESS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [NanMarks]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [NanMarks] WITH PASSWORD=N'HO2MOC03LxImM04/QKaIJZFbmGbv+cYPxK0yeI/dIJ8=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [NanMarks] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [miriam]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [miriam] WITH PASSWORD=N'7HDOjP9+7mKZeARTw3oXDecruAVbIwJ1x9CRMJ7kuk0=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [miriam] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [MarkM]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [MarkM] WITH PASSWORD=N'pLfwW2s9FrMH0TSNIyw++Xpp3ZijQMhrw6e4+rpqWQc=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [MarkM] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [guest]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [guest] WITH PASSWORD=N'lRfMIqBQzSMjPo5e3b3qIXj0lZjHlliVT1XQ+iJPF+Y=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [guest] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [goldy]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [goldy] WITH PASSWORD=N's3GkLDMFLhRcdIWplNV1z9025oOeP9Ak7uDmtNp+8LU=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [goldy] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [FergCust]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [FergCust] WITH PASSWORD=N'MR8kMgSQFK0mQN1JlnQ760HL6aDcHqYL45a3HoIRm20=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [FergCust] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [everyCust]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [everyCust] WITH PASSWORD=N'V+fHHWmA0mkWjunFKl+B1ulzxUO3QgVVRCaL8fr5RPs=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [everyCust] DISABLE
GO
/****** Object:  Login [DESKTOP-MTVC8J7\me]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [DESKTOP-MTVC8J7\me] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [BUILTIN\Users]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [BUILTIN\Users] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [BillD]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [BillD] WITH PASSWORD=N'xzIqvQ/r+UzHJrcRhvCO6CxVZIsplsi6+O2JSM7rQPQ=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [BillD] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [BettyG]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [BettyG] WITH PASSWORD=N'Hl9PzrSj6Oli/lvFrFtor0oxeVVsVmrZ/MwVQdgT95o=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [BettyG] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [baila]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [baila] WITH PASSWORD=N'R+ObHYYeLhuX0oppYIML+ux1bhw3MD00/9cID64bRwE=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [baila] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [123]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [123] WITH PASSWORD=N'XccszrTqTIsVWXp6PREBEZhMpwKn/LbaQWEmqGzoWcE=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [123] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'KzEnbk5aT+vX1I+ZlQ8H6wej6PWjoNVYWljHVMUhknM=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'IL6BKGTauVtuvhFzVhHc1gz+ec73X38zebPjuDBB9Hk=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQL$SQLEXPRESS]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DESKTOP-MTVC8J7\me]
GO
USE [PREMIERE]
GO
/****** Object:  User [yehudaUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [yehudaUser] FOR LOGIN [yehuda] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [yehoshuaUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [yehoshuaUser] FOR LOGIN [yehoshua] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [valKaiUSer]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [valKaiUSer] FOR LOGIN [valKai] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [tobiUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [tobiUser] FOR LOGIN [tobi] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rivkaUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [rivkaUser] FOR LOGIN [rivka] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [pessieUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [pessieUser] FOR LOGIN [pessie] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NanMarksUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [NanMarksUser] FOR LOGIN [NanMarks] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [miriamUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [miriamUser] FOR LOGIN [miriam] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MarkMuser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [MarkMuser] FOR LOGIN [MarkM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [guestUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [guestUser] FOR LOGIN [guest] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [goldyUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [goldyUser] FOR LOGIN [goldy] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [FergUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [FergUser] FOR LOGIN [FergCust] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [EveryCustUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [EveryCustUser] FOR LOGIN [everyCust] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BillDUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [BillDUser] FOR LOGIN [BillD] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BettyGUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [BettyGUser] FOR LOGIN [BettyG] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [bailaUser]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE USER [bailaUser] FOR LOGIN [baila] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [PR_WarehouseManagerRole]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE ROLE [PR_WarehouseManagerRole]
GO
/****** Object:  DatabaseRole [PR_SalesRole]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE ROLE [PR_SalesRole]
GO
/****** Object:  DatabaseRole [PR_PayrollRole]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE ROLE [PR_PayrollRole]
GO
/****** Object:  DatabaseRole [PR_OfficeRole]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE ROLE [PR_OfficeRole]
GO
/****** Object:  DatabaseRole [PR_GuestRole]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE ROLE [PR_GuestRole]
GO
/****** Object:  DatabaseRole [PR_EmployeeRole]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE ROLE [PR_EmployeeRole]
GO
/****** Object:  DatabaseRole [PR_CustomerRole]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE ROLE [PR_CustomerRole]
GO
/****** Object:  DatabaseRole [PR_BuyerRole]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE ROLE [PR_BuyerRole]
GO
/****** Object:  DatabaseRole [PR_AccountantRole]    Script Date: 6/13/2017 12:43:27 AM ******/
CREATE ROLE [PR_AccountantRole]
GO
ALTER ROLE [PR_CustomerRole] ADD MEMBER [yehudaUser]
GO
ALTER ROLE [PR_WarehouseManagerRole] ADD MEMBER [yehoshuaUser]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [yehoshuaUser]
GO
ALTER ROLE [PR_SalesRole] ADD MEMBER [valKaiUSer]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [valKaiUSer]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [tobiUser]
GO
ALTER ROLE [PR_PayrollRole] ADD MEMBER [tobiUser]
GO
ALTER ROLE [PR_OfficeRole] ADD MEMBER [rivkaUser]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [rivkaUser]
GO
ALTER ROLE [PR_SalesRole] ADD MEMBER [pessieUser]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [pessieUser]
GO
ALTER ROLE [PR_SalesRole] ADD MEMBER [NanMarksUser]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [NanMarksUser]
GO
ALTER ROLE [PR_AccountantRole] ADD MEMBER [miriamUser]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [miriamUser]
GO
ALTER ROLE [PR_BuyerRole] ADD MEMBER [MarkMuser]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [MarkMuser]
GO
ALTER ROLE [PR_GuestRole] ADD MEMBER [guestUser]
GO
ALTER ROLE [PR_BuyerRole] ADD MEMBER [goldyUser]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [goldyUser]
GO
ALTER ROLE [PR_CustomerRole] ADD MEMBER [FergUser]
GO
ALTER ROLE [PR_CustomerRole] ADD MEMBER [EveryCustUser]
GO
ALTER ROLE [PR_WarehouseManagerRole] ADD MEMBER [BillDUser]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [BillDUser]
GO
ALTER ROLE [PR_OfficeRole] ADD MEMBER [BettyGUser]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [BettyGUser]
GO
ALTER ROLE [PR_AccountantRole] ADD MEMBER [bailaUser]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [bailaUser]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [PR_WarehouseManagerRole]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [PR_SalesRole]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [PR_PayrollRole]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [PR_OfficeRole]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [PR_BuyerRole]
GO
ALTER ROLE [PR_EmployeeRole] ADD MEMBER [PR_AccountantRole]
GO
GRANT CONNECT TO [bailaUser] AS [dbo]
GO
GRANT CONNECT TO [BettyGUser] AS [dbo]
GO
GRANT CONNECT TO [BillDUser] AS [dbo]
GO
GRANT CONNECT TO [EveryCustUser] AS [dbo]
GO
GRANT CONNECT TO [FergUser] AS [dbo]
GO
GRANT CONNECT TO [goldyUser] AS [dbo]
GO
GRANT CONNECT TO [guestUser] AS [dbo]
GO
GRANT CONNECT TO [MarkMuser] AS [dbo]
GO
GRANT CONNECT TO [miriamUser] AS [dbo]
GO
GRANT CONNECT TO [NanMarksUser] AS [dbo]
GO
GRANT CONNECT TO [pessieUser] AS [dbo]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
GRANT CONNECT TO [rivkaUser] AS [dbo]
GO
GRANT CONNECT TO [tobiUser] AS [dbo]
GO
GRANT CONNECT TO [valKaiUSer] AS [dbo]
GO
GRANT CONNECT TO [yehoshuaUser] AS [dbo]
GO
GRANT CONNECT TO [yehudaUser] AS [dbo]
GO
/****** Object:  Table [dbo].[PART]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PART](
	[PART_NUM] [nchar](10) NOT NULL,
	[PART_DESCRIPTION] [varchar](30) NOT NULL,
	[UNITS_ON_HAND] [smallint] NOT NULL,
	[CATEGORY] [nchar](2) NOT NULL,
	[WAREHOUSEID] [int] NOT NULL,
	[PRICE] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Part] PRIMARY KEY CLUSTERED 
(
	[PART_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[viewAllProducts]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewAllProducts]
AS
  select  part_num, PART_DESCRIPTION, PRICE
  
   from part



GO
GRANT SELECT ON [dbo].[viewAllProducts] TO [PR_BuyerRole] AS [dbo]
GO
GRANT SELECT ON [dbo].[viewAllProducts] TO [PR_GuestRole] AS [dbo]
GO
/****** Object:  View [dbo].[updatePartPrice]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[updatePartPrice]
as
select part_num, price from part

GO
GRANT SELECT ON [dbo].[updatePartPrice] TO [PR_AccountantRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[updatePartPrice] ([price]) TO [PR_AccountantRole] AS [dbo]
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[ORDER_NUM] [int] NOT NULL,
	[ORDER_DATE] [date] NOT NULL,
	[CUST_NUM] [int] NOT NULL,
 CONSTRAINT [PK_ORDER] PRIMARY KEY CLUSTERED 
(
	[ORDER_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[GetNextOrderNum]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[GetNextOrderNum]
as
select max(order_num) as maxNum from orders
GO
GRANT SELECT ON [dbo].[GetNextOrderNum] TO [PR_SalesRole] AS [dbo]
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](40) NOT NULL,
	[Street] [varchar](35) NOT NULL,
	[City] [varchar](25) NOT NULL,
	[EmpState] [char](2) NOT NULL,
	[ZipCode] [char](5) NULL,
	[PhoneNumber] [char](10) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[HireDate] [date] NOT NULL,
	[EmpTypeID] [int] NOT NULL,
	[EmpLogin] [sysname] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[EmployeeData]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EmployeeData]
AS
  select EmpID ,FirstName ,  LastName,
   Street ,   City ,   EmpState ,
   ZipCode ,   PhoneNumber ,
   BirthDate ,   HireDate ,
   EmpTypeID 
   from employee 
       where 
        ( EmpLogin = SUSER_SNAME() and
		 is_member ('PR_EmployeeRole') = 1)
    

GO
/****** Object:  View [dbo].[PartView]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[PartView]
as
select * from part

GO
GRANT INSERT ON [dbo].[PartView] TO [PR_BuyerRole] AS [dbo]
GO
GRANT SELECT ON [dbo].[PartView] TO [PR_BuyerRole] AS [dbo]
GO
/****** Object:  Table [dbo].[PURCHASE]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PURCHASE](
	[PurchaseID] [int] IDENTITY(500,1) NOT NULL,
	[Part_Num] [nchar](10) NOT NULL,
	[Emp_Num] [int] NOT NULL,
	[QtyPurchased] [int] NOT NULL,
	[UnitPricePaid] [smallmoney] NOT NULL,
	[DatePurchased] [date] NOT NULL,
	[DateReceived] [date] NULL,
	[QtyReceived] [int] NULL,
	[ReceivedBy] [int] NULL,
	[WarehouseID] [int] NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[purchasedataview]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[purchasedataview] 
as
select * from purchase
GO
GRANT SELECT ON [dbo].[purchasedataview] TO [PR_WarehouseManagerRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[purchasedataview] ([DateReceived]) TO [PR_WarehouseManagerRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[purchasedataview] ([QtyReceived]) TO [PR_WarehouseManagerRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[purchasedataview] ([ReceivedBy]) TO [PR_WarehouseManagerRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[purchasedataview] ([WarehouseID]) TO [PR_WarehouseManagerRole] AS [dbo]
GO
/****** Object:  Table [dbo].[EmpType]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpType](
	[EmpTypeID] [int] NOT NULL,
	[EmpTypeDesc] [varchar](40) NOT NULL,
 CONSTRAINT [PK_EmpType] PRIMARY KEY CLUSTERED 
(
	[EmpTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[AllEmployeeDataView]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[AllEmployeeDataView]
as
select empid, FirstName, LastName, street, City , EmpState ,zipcode, PHONEnumber, empTypeDesc 
  
   from employee

   inner join EmpType
   on EMPLOYEE.EmpTypeID = EmpType.EmpTypeID

GO
GRANT SELECT ON [dbo].[AllEmployeeDataView] TO [PR_OfficeRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[AllEmployeeDataView] TO [PR_OfficeRole] AS [dbo]
GO
/****** Object:  Table [dbo].[SALESREP]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALESREP](
	[REP_NUM] [int] NOT NULL,
	[COMMISSION] [smallmoney] NOT NULL,
	[RATE] [decimal](5, 2) NULL,
 CONSTRAINT [PK_SALESREP] PRIMARY KEY CLUSTERED 
(
	[REP_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[SalesRepNumView]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE VIEW [dbo].[SalesRepNumView]
AS
  select rep_Num 
  
   from SALESREP

    
GO
GRANT SELECT ON [dbo].[SalesRepNumView] TO [PR_OfficeRole] AS [dbo]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CUST_NUM] [int] IDENTITY(1,1) NOT NULL,
	[CUST_NAME] [varchar](40) NOT NULL,
	[CUST_STREET] [varchar](30) NOT NULL,
	[CUST_CITY] [varchar](25) NOT NULL,
	[CUST_STATE] [char](2) NOT NULL,
	[CUST_ZIP] [nchar](9) NOT NULL,
	[CUST_BALANCE] [smallmoney] NOT NULL,
	[CREDIT_LIMIT] [decimal](7, 2) NOT NULL,
	[REP_NUM] [int] NOT NULL,
	[PHONE] [char](10) NOT NULL,
	[BEGIN_DATE]  AS (getdate()),
	[Cust_Login] [sysname] NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[CUST_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[allCustomerDataView]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[allCustomerDataView]
as 
select * from CUSTOMER

GO
GRANT SELECT ON [dbo].[allCustomerDataView] TO [PR_OfficeRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[allCustomerDataView] TO [PR_OfficeRole] AS [dbo]
GO
GRANT SELECT ON [dbo].[allCustomerDataView] ([CUST_NUM]) TO [PR_AccountantRole] AS [dbo]
GO
GRANT SELECT ON [dbo].[allCustomerDataView] ([CREDIT_LIMIT]) TO [PR_AccountantRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[allCustomerDataView] ([CREDIT_LIMIT]) TO [PR_AccountantRole] AS [dbo]
GO
/****** Object:  View [dbo].[ModifyEmployeeData]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ModifyEmployeeData]
AS
  select FirstName ,  LastName,
   Street ,   City ,   EmpState ,
   ZipCode ,   PhoneNumber
  
   from employee 
       where 
        ( EmpLogin = SUSER_SNAME() and
		 is_member ('PR_EmployeeRole') = 1)
    

GO
GRANT SELECT ON [dbo].[ModifyEmployeeData] TO [PR_EmployeeRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ModifyEmployeeData] TO [PR_EmployeeRole] AS [dbo]
GO
/****** Object:  Table [dbo].[WAREHOUSE]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WAREHOUSE](
	[WarehouseID] [int] IDENTITY(1,1) NOT NULL,
	[Street] [varchar](35) NOT NULL,
	[City] [varchar](35) NOT NULL,
	[WarehouseState] [char](2) NOT NULL,
	[ZipCode] [char](9) NULL,
	[PhoneNumber] [char](10) NOT NULL,
	[ManagerID] [int] NOT NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[WarehouseDataView]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[WarehouseDataView]
AS
  select part_num, part_description, units_on_hand, price
  from part

  inner join WAREHOUSE

  on part.WAREHOUSEID = WAREHOUSE.WarehouseID
  inner join EMPLOYEE on

  EMPLOYEE.empid = warehouse.managerid
   
       where 
        ( EmpLogin = SUSER_SNAME() and
		 is_member ('PR_WarehouseManagerRole') = 1)
    


GO
GRANT SELECT ON [dbo].[WarehouseDataView] TO [PR_WarehouseManagerRole] AS [dbo]
GO
/****** Object:  View [dbo].[ModifyCustomerDataView]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[ModifyCustomerDataView]
as 
select CUST_NAME, CUST_STREET, CUST_CITY, CUST_STATE, CUST_ZIP, PHONE
  
   from Customer
       where 
        ( Cust_Login = SUSER_SNAME() and
		 is_member ('PR_CustomerRole') = 1)
    


GO
GRANT SELECT ON [dbo].[ModifyCustomerDataView] TO [PR_CustomerRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ModifyCustomerDataView] ([CUST_NAME]) TO [PR_CustomerRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ModifyCustomerDataView] ([CUST_STREET]) TO [PR_CustomerRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ModifyCustomerDataView] ([CUST_CITY]) TO [PR_CustomerRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ModifyCustomerDataView] ([CUST_STATE]) TO [PR_CustomerRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ModifyCustomerDataView] ([CUST_ZIP]) TO [PR_CustomerRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[ModifyCustomerDataView] ([PHONE]) TO [PR_CustomerRole] AS [dbo]
GO
/****** Object:  Table [dbo].[ORDER_LINE]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_LINE](
	[ORDER_NUM] [int] NOT NULL,
	[PART_NUM] [nchar](10) NOT NULL,
	[QTY_ORDERED] [smallint] NOT NULL,
	[QUOTED_PRICE] [smallmoney] NOT NULL,
	[Subtotal]  AS ([qty_ordered]*[quoted_price]),
	[Modified_Date] [date] NOT NULL,
 CONSTRAINT [PK_ORDER_LINE] PRIMARY KEY CLUSTERED 
(
	[ORDER_NUM] ASC,
	[PART_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ViewAllOrdersView]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewAllOrdersView]
AS
  select orders.order_num, part_num, Qty_ordered, quoted_price, subtotal
  
   from ORDER_LINE

   inner join orders
   on ORDER_LINE.ORDER_NUM = orders.ORDER_NUM

   inner join customer on 
   orders.CUST_NUM = customer.CUST_NUM

       where 
        ( Cust_Login = SUSER_SNAME() and
		 is_member ('PR_CustomerRole') = 1)
    

GO
GRANT SELECT ON [dbo].[ViewAllOrdersView] TO [PR_CustomerRole] AS [dbo]
GO
/****** Object:  View [dbo].[placeOrderView]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[placeOrderView]
AS
  select orders.order_num, part_num, Qty_ordered, quoted_price, subtotal, Modified_Date
  
   from ORDER_LINE

   inner join orders
   on ORDER_LINE.ORDER_NUM = orders.ORDER_NUM

   inner join customer on 
   orders.CUST_NUM = customer.CUST_NUM

   inner join EMPLOYEE
   on customer.REP_NUM     =EMPLOYEE.EmpID

       where 
        (EmpLogin = SUSER_SNAME() and
		 is_member ('PR_SalesRole') = 1)
  
GO
GRANT INSERT ON [dbo].[placeOrderView] TO [PR_SalesRole] AS [dbo]
GO
GRANT SELECT ON [dbo].[placeOrderView] TO [PR_SalesRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[placeOrderView] TO [PR_SalesRole] AS [dbo]
GO
/****** Object:  View [dbo].[viewAllCustomerOrders]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[viewAllCustomerOrders]
as
select orders.ORDER_NUM, PART_NUM, QTY_ORDERED, QUOTED_PRICE, customer.cust_num, CUST_NAME, ORDER_DATE

from ORDER_LINE inner join orders 
on ORDER_LINE.ORDER_NUM = orders.ORDER_NUM

inner join customer on orders.CUST_NUM = customer.CUST_NUM
inner join Employee  on customer.REP_NUM = Employee.EmpID
  where 
        ( empLogin = SUSER_SNAME() and
		 is_member ('PR_SalesRole') = 1)

GO
GRANT SELECT ON [dbo].[viewAllCustomerOrders] TO [PR_SalesRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[viewAllCustomerOrders] ([PART_NUM]) TO [PR_SalesRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[viewAllCustomerOrders] ([QTY_ORDERED]) TO [PR_SalesRole] AS [dbo]
GO
GRANT UPDATE ON [dbo].[viewAllCustomerOrders] ([QUOTED_PRICE]) TO [PR_SalesRole] AS [dbo]
GO
SET IDENTITY_INSERT [dbo].[CUSTOMER] ON 

INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (11, N'AI''s Appliance and Sport', N'2837 Greenway', N'Fillmore', N'FL', N'33336    ', 1840.0000, CAST(4000.00 AS Decimal(7, 2)), 6, N'3057089012', NULL)
INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (12, N'Brookings Direct', N'3827 Devon', N'Grove', N'FL', N'33321    ', 0.0000, CAST(10000.00 AS Decimal(7, 2)), 8, N'3529018765', N'BrooksCust')
INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (13, N'Ferguson''s', N'382 Wildwood', N'Northfield', N'FL', N'33146    ', 0.0000, CAST(7500.00 AS Decimal(7, 2)), 11, N'2397865432', N'fergCust')
INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (14, N'The Everything Shop', N'1828 Raven', N'Crystal', N'HI', N'33503    ', 0.0000, CAST(5000.00 AS Decimal(7, 2)), 8, N'5615432356', N'EveryCust')
INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (15, N'Bargains Galore', N'3829 Central', N'Grove', N'FL', N'33321    ', 0.0000, CAST(10000.00 AS Decimal(7, 2)), 11, N'8053467896', NULL)
INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (16, N'Kline''s', N'838 Ridgeland', N'Fillmore', N'FL', N'33336    ', 0.0000, CAST(5000.00 AS Decimal(7, 2)), 6, N'3058765234', N'KlineCust')
INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (17, N'Johnson''s Department Store', N'372 Oxford', N'Sheldon', N'FL', N'33553    ', 0.0000, CAST(5000.00 AS Decimal(7, 2)), 11, N'3215064536', NULL)
INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (18, N'Lee''s Sport and Appliance', N'282 Evergreen', N'Altonville', N'FL', N'32543    ', 0.0000, CAST(5000.00 AS Decimal(7, 2)), 8, N'8135678943', N'LeeCust')
INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (19, N'Deerfield''s Four Seasons', N'282 Columbia', N'Sheldon', N'FL', N'33553    ', 0.0000, CAST(7500.00 AS Decimal(7, 2)), 8, N'8634412345', N'DeerCust')
INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (20, N'All Season', N'28 Lakeview', N'Grove', N'FL', N'33321    ', 0.0000, CAST(1000.00 AS Decimal(7, 2)), 6, N'7723452310', NULL)
INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (25, N'me', N'street', N'rookl', N'NY', N'11210    ', 0.0000, CAST(5000.00 AS Decimal(7, 2)), 6, N'7584126598', NULL)
INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (28, N'bg', N'bg', N'bgb', N'AK', N'11210    ', 0.0000, CAST(5000.00 AS Decimal(7, 2)), 8, N'1234561236', NULL)
INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (29, N'TC', N'hjk', N'hkj', N'NY', N'11210    ', 0.0000, CAST(4000.00 AS Decimal(7, 2)), 30, N'1235268956', N'TCCustomer')
INSERT [dbo].[CUSTOMER] ([CUST_NUM], [CUST_NAME], [CUST_STREET], [CUST_CITY], [CUST_STATE], [CUST_ZIP], [CUST_BALANCE], [CREDIT_LIMIT], [REP_NUM], [PHONE], [Cust_Login]) VALUES (32, N'grfg', N'gdfg', N'gdfg', N'NY', N'15246    ', 0.0000, CAST(5000.00 AS Decimal(7, 2)), 30, N'1252568459', N'TCCustomer')
SET IDENTITY_INSERT [dbo].[CUSTOMER] OFF
SET IDENTITY_INSERT [dbo].[EMPLOYEE] ON 

INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (1, N'Valerie', N'Kaisery', N'624 Randall', N'Grove', N'FL', N'33321', N'3478902123', CAST(N'1980-05-12' AS Date), CAST(N'2005-05-04' AS Date), 1, N'valKai')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (2, N'Richard', N'Hull', N'532 Jackson', N'Sheldon', N'FL', N'33553', N'9283456789', CAST(N'1975-09-04' AS Date), CAST(N'2006-09-04' AS Date), 1, N'richhull')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (3, N'Juan', N'Perez', N'1626 Taylor', N'Fillmore', N'FL', N'33336', N'6467812345', CAST(N'1968-03-17' AS Date), CAST(N'2008-11-12' AS Date), 1, N'JuanP')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (4, N'Lisa', N'Lancy', N'1 Ave A', N'Brooklyn', N'NY', N'11230', N'7182213434', CAST(N'1972-09-25' AS Date), CAST(N'2007-06-23' AS Date), 2, N'LisaL')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (5, N'Mark', N'Midlin', N'3 Ave C', N'NYC', N'OH', N'10005', N'7183453245', CAST(N'1978-07-01' AS Date), CAST(N'2008-09-25' AS Date), 2, N'MarkM')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (6, N'Nancy', N'Markson', N'4 Ave D', N'Brooklyn', N'NY', N'11214', N'3479024587', CAST(N'1976-11-10' AS Date), CAST(N'2006-01-11' AS Date), 1, N'NanMarks')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (7, N'Betty', N'Gnatt', N'5 Ave E', N'NYC', N'NY', N'11234', N'9178823487', CAST(N'1972-12-18' AS Date), CAST(N'2003-08-11' AS Date), 3, N'BettyG')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (8, N'David', N'Carlson', N'7 Ave F', N'Brooklyn', N'NY', N'11218', N'9176543423', CAST(N'1971-09-16' AS Date), CAST(N'2005-08-15' AS Date), 4, N'DavidC')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (9, N'Frank', N'Frankson', N'9 Ave L', N'Brooklyn', N'NY', N'11214', N'9177864567', CAST(N'1980-05-04' AS Date), CAST(N'2006-03-01' AS Date), 5, N'FrankF')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (10, N'Bill', N'Dickens', N'10 Main St', N'Brooklyn', N'NY', N'11232', N'6462348756', CAST(N'1978-06-07' AS Date), CAST(N'2005-09-08' AS Date), 5, N'BillD')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (11, N'Harold', N'Harkins', N'15 Palm Drive', N'Queens', N'NY', NULL, N'3476054532', CAST(N'1968-04-08' AS Date), CAST(N'2004-03-11' AS Date), 5, N'HarryH')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (12, N'Gary', N'Garson', N'10 Ave X', N'Brooklyn', N'NY', N'11236', N'7184421239', CAST(N'1964-05-30' AS Date), CAST(N'2005-05-02' AS Date), 6, N'GaryG')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (13, N'baila', N'beaches', N'2813 ave J', N'Brooklyn', N'NY', N'11210', N'7186922267', CAST(N'1999-11-08' AS Date), CAST(N'2010-05-06' AS Date), 6, N'baila')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (15, N'miriam', N'Halpert', N'2813 ave J', N'Brooklyn', N'NY', N'11210', N'6464671045', CAST(N'1996-02-23' AS Date), CAST(N'2014-06-04' AS Date), 6, N'miriam')
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (27, N'rivka', N'schuster', N'2813 ave J', N'Brooklyn', N'NY', N'11210', N'7195682257', CAST(N'1996-02-02' AS Date), CAST(N'2014-08-05' AS Date), 1, NULL)
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (30, N'me', N'tyou', N'my street', N'bklyn', N'NY', N'11210', N'7185896258', CAST(N'1996-02-02' AS Date), CAST(N'2004-02-02' AS Date), 1, NULL)
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (34, N'jl', N'jlk', N'jl', N'jk', N'AK', N'11210', N'1234568523', CAST(N'1969-12-31' AS Date), CAST(N'1969-12-31' AS Date), 1, NULL)
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (35, N'h', N'hkj', N'hjk', N'hjk', N'AK', N'11210', N'1232123213', CAST(N'1969-12-31' AS Date), CAST(N'1969-12-31' AS Date), 1, NULL)
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (42, N'jlk', N'jk', N'jkl', N'jkl', N'AK', N'11210', N'1238596589', CAST(N'1969-12-31' AS Date), CAST(N'1969-12-31' AS Date), 1, NULL)
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (43, N'fed', N'fdsf', N'fds', N'fsd', N'AK', N'11210', N'2589568523', CAST(N'1969-12-31' AS Date), CAST(N'1969-12-31' AS Date), 1, NULL)
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (44, N'ght', N'ghdf', N'hgdf', N'hdf', N'AK', N'1996-', N'1234589626', CAST(N'1969-12-31' AS Date), CAST(N'1969-12-31' AS Date), 1, NULL)
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (45, N'tr', N'ter', N'ter', N'tert', N'AK', N'1996-', N'1232568956', CAST(N'1996-02-03' AS Date), CAST(N'2017-02-03' AS Date), 1, NULL)
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (46, N'dsa', N'das', N'das', N'dsa', N'AK', N'02-23', N'1233256895', CAST(N'1996-02-23' AS Date), CAST(N'2017-06-11' AS Date), 1, NULL)
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (47, N'g', N'gdf', N'gdf', N'gfd', N'AK', N'11210', N'1235268956', CAST(N'1996-02-23' AS Date), CAST(N'2017-02-23' AS Date), 1, NULL)
INSERT [dbo].[EMPLOYEE] ([EmpID], [FirstName], [LastName], [Street], [City], [EmpState], [ZipCode], [PhoneNumber], [BirthDate], [HireDate], [EmpTypeID], [EmpLogin]) VALUES (48, N'tf', N'dfds', N'fsd', N'fds', N'AK', N'11210', N'1234568923', CAST(N'1996-02-23' AS Date), CAST(N'2017-02-23' AS Date), 1, NULL)
SET IDENTITY_INSERT [dbo].[EMPLOYEE] OFF
INSERT [dbo].[EmpType] ([EmpTypeID], [EmpTypeDesc]) VALUES (1, N'SALESPERSON')
INSERT [dbo].[EmpType] ([EmpTypeID], [EmpTypeDesc]) VALUES (2, N'BUYER')
INSERT [dbo].[EmpType] ([EmpTypeID], [EmpTypeDesc]) VALUES (3, N'SECRETARY')
INSERT [dbo].[EmpType] ([EmpTypeID], [EmpTypeDesc]) VALUES (4, N'PAYROLL')
INSERT [dbo].[EmpType] ([EmpTypeID], [EmpTypeDesc]) VALUES (5, N'WAREHOUSE MANAGER')
INSERT [dbo].[EmpType] ([EmpTypeID], [EmpTypeDesc]) VALUES (6, N'ACCOUNTANT')
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (11, N'CD52      ', 1, 150.0000, CAST(N'2017-06-08' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (1112, N'BV06      ', 1, 750.0000, CAST(N'2017-06-08' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (11111, N'AT94      ', 2, 20.0000, CAST(N'2017-06-08' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21606, N'DR93      ', 3, 495.0000, CAST(N'2007-09-20' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21606, N'KV29      ', 2, 1290.0000, CAST(N'2007-09-20' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21608, N'AT94      ', 11, 21.9500, CAST(N'2007-10-20' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21610, N'DR93      ', 1, 495.0000, CAST(N'2007-10-21' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21610, N'DW11      ', 1, 399.9900, CAST(N'2007-10-21' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21614, N'KT03      ', 2, 595.0000, CAST(N'2007-10-22' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21617, N'BV06      ', 2, 794.9500, CAST(N'2007-10-23' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21617, N'CD52      ', 4, 150.0000, CAST(N'2007-10-23' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21619, N'AT94      ', 1, 22.0000, CAST(N'2007-10-23' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21619, N'DR93      ', 1, 495.0000, CAST(N'2007-10-23' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21620, N'CD52      ', 1, 150.0000, CAST(N'2017-06-11' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21621, N'CD52      ', 2, 150.0000, CAST(N'2017-06-11' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21622, N'CD52      ', 1, 150.0000, CAST(N'2017-02-02' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21623, N'KV29      ', 2, 1290.0000, CAST(N'2007-10-23' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (21625, N'CD52      ', 1, 150.0000, CAST(N'2017-02-02' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (32000, N'CD52      ', 1, 150.0000, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (98766, N'AT94      ', 1, 24.0000, CAST(N'2011-12-13' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (98766, N'DW11      ', 1, 400.0000, CAST(N'2011-12-13' AS Date))
INSERT [dbo].[ORDER_LINE] ([ORDER_NUM], [PART_NUM], [QTY_ORDERED], [QUOTED_PRICE], [Modified_Date]) VALUES (98767, N'CD52      ', 1, 150.0000, CAST(N'2017-06-11' AS Date))
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (11, CAST(N'2017-06-08' AS Date), 11)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (1112, CAST(N'2017-06-08' AS Date), 11)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (11111, CAST(N'2017-06-08' AS Date), 11)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (21606, CAST(N'2007-09-20' AS Date), 11)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (21608, CAST(N'2007-10-20' AS Date), 11)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (21610, CAST(N'2007-10-21' AS Date), 13)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (21613, CAST(N'2007-10-22' AS Date), 14)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (21614, CAST(N'2007-10-22' AS Date), 17)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (21617, CAST(N'2007-10-23' AS Date), 18)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (21619, CAST(N'2007-10-23' AS Date), 11)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (21620, CAST(N'2017-06-11' AS Date), 11)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (21621, CAST(N'2017-06-11' AS Date), 11)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (21622, CAST(N'2017-02-02' AS Date), 11)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (21623, CAST(N'2007-10-23' AS Date), 18)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (21625, CAST(N'2017-02-02' AS Date), 11)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (32000, CAST(N'2017-05-01' AS Date), 18)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (98766, CAST(N'2011-12-13' AS Date), 19)
INSERT [dbo].[ORDERS] ([ORDER_NUM], [ORDER_DATE], [CUST_NUM]) VALUES (98767, CAST(N'2017-06-11' AS Date), 11)
INSERT [dbo].[PART] ([PART_NUM], [PART_DESCRIPTION], [UNITS_ON_HAND], [CATEGORY], [WAREHOUSEID], [PRICE]) VALUES (N'AT94      ', N'Iron', 42, N'HW', 3, 30.0000)
INSERT [dbo].[PART] ([PART_NUM], [PART_DESCRIPTION], [UNITS_ON_HAND], [CATEGORY], [WAREHOUSEID], [PRICE]) VALUES (N'BV06      ', N'Home Gym', 44, N'SG', 2, 755.2000)
INSERT [dbo].[PART] ([PART_NUM], [PART_DESCRIPTION], [UNITS_ON_HAND], [CATEGORY], [WAREHOUSEID], [PRICE]) VALUES (N'CD52      ', N'Microwave Oven', 25, N'AP', 4, 156.7500)
INSERT [dbo].[PART] ([PART_NUM], [PART_DESCRIPTION], [UNITS_ON_HAND], [CATEGORY], [WAREHOUSEID], [PRICE]) VALUES (N'DL71      ', N'Cordless Drill', 21, N'HW', 3, 123.4500)
INSERT [dbo].[PART] ([PART_NUM], [PART_DESCRIPTION], [UNITS_ON_HAND], [CATEGORY], [WAREHOUSEID], [PRICE]) VALUES (N'DR93      ', N'Gas Range', 5, N'AP', 2, 470.2500)
INSERT [dbo].[PART] ([PART_NUM], [PART_DESCRIPTION], [UNITS_ON_HAND], [CATEGORY], [WAREHOUSEID], [PRICE]) VALUES (N'DW11      ', N'Washer', 9, N'AP', 3, 379.9900)
INSERT [dbo].[PART] ([PART_NUM], [PART_DESCRIPTION], [UNITS_ON_HAND], [CATEGORY], [WAREHOUSEID], [PRICE]) VALUES (N'FD21      ', N'Stand Mixer', 22, N'HW', 3, 151.9500)
INSERT [dbo].[PART] ([PART_NUM], [PART_DESCRIPTION], [UNITS_ON_HAND], [CATEGORY], [WAREHOUSEID], [PRICE]) VALUES (N'KL62      ', N'Dryer', 12, N'AP', 4, 332.4500)
INSERT [dbo].[PART] ([PART_NUM], [PART_DESCRIPTION], [UNITS_ON_HAND], [CATEGORY], [WAREHOUSEID], [PRICE]) VALUES (N'KT03      ', N'Dishwasher', 8, N'AP', 3, 565.2500)
INSERT [dbo].[PART] ([PART_NUM], [PART_DESCRIPTION], [UNITS_ON_HAND], [CATEGORY], [WAREHOUSEID], [PRICE]) VALUES (N'KV29      ', N'Treadmill', 7, N'SG', 2, 1320.5000)
INSERT [dbo].[PART] ([PART_NUM], [PART_DESCRIPTION], [UNITS_ON_HAND], [CATEGORY], [WAREHOUSEID], [PRICE]) VALUES (N'RR321     ', N'more screws', 0, N'AP', 2, 12.0000)
INSERT [dbo].[PART] ([PART_NUM], [PART_DESCRIPTION], [UNITS_ON_HAND], [CATEGORY], [WAREHOUSEID], [PRICE]) VALUES (N'RS123     ', N'screws for your head', 0, N'AP', 2, 12.0000)
INSERT [dbo].[PART] ([PART_NUM], [PART_DESCRIPTION], [UNITS_ON_HAND], [CATEGORY], [WAREHOUSEID], [PRICE]) VALUES (N'RS145     ', N'screws for your head', 0, N'AP', 2, 12.0000)
SET IDENTITY_INSERT [dbo].[PURCHASE] ON 

INSERT [dbo].[PURCHASE] ([PurchaseID], [Part_Num], [Emp_Num], [QtyPurchased], [UnitPricePaid], [DatePurchased], [DateReceived], [QtyReceived], [ReceivedBy], [WarehouseID]) VALUES (500, N'DR93      ', 10, 4, 340.0000, CAST(N'2016-05-04' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[PURCHASE] ([PurchaseID], [Part_Num], [Emp_Num], [QtyPurchased], [UnitPricePaid], [DatePurchased], [DateReceived], [QtyReceived], [ReceivedBy], [WarehouseID]) VALUES (501, N'KT03      ', 10, 2, 400.0000, CAST(N'2016-04-09' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[PURCHASE] ([PurchaseID], [Part_Num], [Emp_Num], [QtyPurchased], [UnitPricePaid], [DatePurchased], [DateReceived], [QtyReceived], [ReceivedBy], [WarehouseID]) VALUES (502, N'KV29      ', 11, 3, 1000.0000, CAST(N'2017-02-07' AS Date), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PURCHASE] OFF
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (6, 0.0000, CAST(0.07 AS Decimal(5, 2)))
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (8, 0.0000, CAST(0.05 AS Decimal(5, 2)))
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (11, 0.0000, CAST(0.05 AS Decimal(5, 2)))
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (27, 10.0000, CAST(0.50 AS Decimal(5, 2)))
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (30, 0.5000, CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (34, 0.5000, CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (35, 0.5000, CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (42, 0.5000, CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (43, 0.5000, CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (44, 10.0000, CAST(5.00 AS Decimal(5, 2)))
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (45, 10.0000, CAST(0.50 AS Decimal(5, 2)))
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (46, 10.0000, CAST(0.50 AS Decimal(5, 2)))
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (47, 10.0000, CAST(0.50 AS Decimal(5, 2)))
INSERT [dbo].[SALESREP] ([REP_NUM], [COMMISSION], [RATE]) VALUES (48, 10.0000, CAST(0.50 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[WAREHOUSE] ON 

INSERT [dbo].[WAREHOUSE] ([WarehouseID], [Street], [City], [WarehouseState], [ZipCode], [PhoneNumber], [ManagerID]) VALUES (2, N'100 Lexington Ave', N'Newark', N'NJ', NULL, N'2015678901', 10)
INSERT [dbo].[WAREHOUSE] ([WarehouseID], [Street], [City], [WarehouseState], [ZipCode], [PhoneNumber], [ManagerID]) VALUES (3, N'200 Empire Blvd', N'Linden', N'NJ', NULL, N'2015893021', 5)
INSERT [dbo].[WAREHOUSE] ([WarehouseID], [Street], [City], [WarehouseState], [ZipCode], [PhoneNumber], [ManagerID]) VALUES (4, N'300 Troy Ave', N'Staten Island', N'NY', NULL, N'7184565432', 7)
SET IDENTITY_INSERT [dbo].[WAREHOUSE] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UIX_CustPhone]    Script Date: 6/13/2017 12:43:29 AM ******/
ALTER TABLE [dbo].[CUSTOMER] ADD  CONSTRAINT [UIX_CustPhone] UNIQUE NONCLUSTERED 
(
	[PHONE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UIX_phone]    Script Date: 6/13/2017 12:43:29 AM ******/
ALTER TABLE [dbo].[CUSTOMER] ADD  CONSTRAINT [UIX_phone] UNIQUE NONCLUSTERED 
(
	[PHONE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UIX_PhoneNumber]    Script Date: 6/13/2017 12:43:29 AM ******/
ALTER TABLE [dbo].[EMPLOYEE] ADD  CONSTRAINT [UIX_PhoneNumber] UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UIX_Warehouse_Manager]    Script Date: 6/13/2017 12:43:29 AM ******/
ALTER TABLE [dbo].[WAREHOUSE] ADD  CONSTRAINT [UIX_Warehouse_Manager] UNIQUE NONCLUSTERED 
(
	[WarehouseID] ASC,
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CUSTOMER] ADD  CONSTRAINT [check_def_balance]  DEFAULT ((0)) FOR [CUST_BALANCE]
GO
ALTER TABLE [dbo].[CUSTOMER] ADD  DEFAULT ((5000)) FOR [CREDIT_LIMIT]
GO
ALTER TABLE [dbo].[PART] ADD  CONSTRAINT [def]  DEFAULT ((0)) FOR [UNITS_ON_HAND]
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_SALESREP] FOREIGN KEY([REP_NUM])
REFERENCES [dbo].[SALESREP] ([REP_NUM])
GO
ALTER TABLE [dbo].[CUSTOMER] CHECK CONSTRAINT [FK_CUSTOMER_SALESREP]
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [FK_Emp_EmpType] FOREIGN KEY([EmpTypeID])
REFERENCES [dbo].[EmpType] ([EmpTypeID])
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [FK_Emp_EmpType]
GO
ALTER TABLE [dbo].[ORDER_LINE]  WITH CHECK ADD  CONSTRAINT [FK_ORder_LINE_ORDERS] FOREIGN KEY([ORDER_NUM])
REFERENCES [dbo].[ORDERS] ([ORDER_NUM])
GO
ALTER TABLE [dbo].[ORDER_LINE] CHECK CONSTRAINT [FK_ORder_LINE_ORDERS]
GO
ALTER TABLE [dbo].[ORDER_LINE]  WITH CHECK ADD  CONSTRAINT [FK_Order_LINE_PART] FOREIGN KEY([PART_NUM])
REFERENCES [dbo].[PART] ([PART_NUM])
GO
ALTER TABLE [dbo].[ORDER_LINE] CHECK CONSTRAINT [FK_Order_LINE_PART]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_CUSTOMER] FOREIGN KEY([CUST_NUM])
REFERENCES [dbo].[CUSTOMER] ([CUST_NUM])
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDER_CUSTOMER]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_CUSTOMER] FOREIGN KEY([CUST_NUM])
REFERENCES [dbo].[CUSTOMER] ([CUST_NUM])
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_CUSTOMER]
GO
ALTER TABLE [dbo].[PART]  WITH CHECK ADD  CONSTRAINT [FK_PART_WAREHOUSE] FOREIGN KEY([WAREHOUSEID])
REFERENCES [dbo].[WAREHOUSE] ([WarehouseID])
GO
ALTER TABLE [dbo].[PART] CHECK CONSTRAINT [FK_PART_WAREHOUSE]
GO
ALTER TABLE [dbo].[PURCHASE]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Employee] FOREIGN KEY([Emp_Num])
REFERENCES [dbo].[EMPLOYEE] ([EmpID])
GO
ALTER TABLE [dbo].[PURCHASE] CHECK CONSTRAINT [FK_Purchase_Employee]
GO
ALTER TABLE [dbo].[PURCHASE]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Part] FOREIGN KEY([Part_Num])
REFERENCES [dbo].[PART] ([PART_NUM])
GO
ALTER TABLE [dbo].[PURCHASE] CHECK CONSTRAINT [FK_Purchase_Part]
GO
ALTER TABLE [dbo].[PURCHASE]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Warehouse] FOREIGN KEY([WarehouseID], [ReceivedBy])
REFERENCES [dbo].[WAREHOUSE] ([WarehouseID], [ManagerID])
GO
ALTER TABLE [dbo].[PURCHASE] CHECK CONSTRAINT [FK_Purchase_Warehouse]
GO
ALTER TABLE [dbo].[SALESREP]  WITH CHECK ADD  CONSTRAINT [FK_SALESREP_EMPLOYEE] FOREIGN KEY([REP_NUM])
REFERENCES [dbo].[EMPLOYEE] ([EmpID])
GO
ALTER TABLE [dbo].[SALESREP] CHECK CONSTRAINT [FK_SALESREP_EMPLOYEE]
GO
ALTER TABLE [dbo].[WAREHOUSE]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_Emp] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[EMPLOYEE] ([EmpID])
GO
ALTER TABLE [dbo].[WAREHOUSE] CHECK CONSTRAINT [FK_Warehouse_Emp]
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH CHECK ADD  CONSTRAINT [chk_phone10] CHECK  ((len([phone])=(10)))
GO
ALTER TABLE [dbo].[CUSTOMER] CHECK CONSTRAINT [chk_phone10]
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH CHECK ADD  CONSTRAINT [chk_phoneDigits] CHECK  (([phone] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[CUSTOMER] CHECK CONSTRAINT [chk_phoneDigits]
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH CHECK ADD  CONSTRAINT [CK_creditlimit] CHECK  (([cust_balance]<=[credit_limit]))
GO
ALTER TABLE [dbo].[CUSTOMER] CHECK CONSTRAINT [CK_creditlimit]
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [chck_phone] CHECK  ((len([phoneNumber])=(10)))
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [chck_phone]
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [chck_phoneDigits] CHECK  (([phonenumber] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [chck_phoneDigits]
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [CHK_birthday] CHECK  ((datediff(year,[birthdate],getdate())>=(18)))
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [CHK_birthday]
GO
ALTER TABLE [dbo].[PURCHASE]  WITH CHECK ADD  CONSTRAINT [CHK_DateReceived] CHECK  (([DateReceived]>[DatePurchased]))
GO
ALTER TABLE [dbo].[PURCHASE] CHECK CONSTRAINT [CHK_DateReceived]
GO
ALTER TABLE [dbo].[PURCHASE]  WITH CHECK ADD  CONSTRAINT [CHK_UnitPricePaid] CHECK  (([UnitPricePaid]>(0.0)))
GO
ALTER TABLE [dbo].[PURCHASE] CHECK CONSTRAINT [CHK_UnitPricePaid]
GO
ALTER TABLE [dbo].[SALESREP]  WITH CHECK ADD  CONSTRAINT [CK_RATE] CHECK  (([RATE]>=(0)))
GO
ALTER TABLE [dbo].[SALESREP] CHECK CONSTRAINT [CK_RATE]
GO
/****** Object:  StoredProcedure [dbo].[addCustomer]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[addCustomer] --dont pass in credit limit, it defalut to 5000, or balance starts at 0
@name varchar(40),
@street varchar(30),
@city varchar(25),
@state char(2),
@zip nchar(9),

@repnum int,
@phone char(10),
@custLogin sysname --could be null ??!!

as

--if not exists(select cust_name from customer where Phone=@phone) --name should be unique
--contrarint already on db
begin
	insert into CUSTOMER values(@name, @street, @city, @state, @zip, 0, 5000, @repnum, @phone, null)
end

GO
/****** Object:  StoredProcedure [dbo].[PlaceOrder]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[PlaceOrder]
@orderNum int
,@partNum nchar(10)
, @quantity int
, @quotedprice smallmoney
,@date date
,@custNum int

as
begin
set nocount on
	begin transaction
	begin try

	if @custNum  not  in  (select cust_num from customer)
	begin
		raiserror('invalid customer', 16,1)
	end
		insert into orders(order_num, order_date, cust_num)
	values(@ordernum, @date, @custNum)


	insert into order_line(order_num, part_num, qty_ordered, Quoted_price, modified_date)
	 values(@orderNum, @partnum, @quantity, @quotedPrice, @date)


	commit transaction
	end try
	begin catch
	declare @errorMessage varchar(2000)
	 SET @ErrorMessage  = ERROR_MESSAGE()
	rollback transaction 
	raiserror(@errorMessage, 16,1)
	end catch
end

select * from ORDERS
GO
GRANT EXECUTE ON [dbo].[PlaceOrder] TO [PR_SalesRole] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[spAddSalesRep]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spAddSalesRep] 


   @EmpFName varchar(20) ,
   @EmpLName varchar(40),
    @empStreet varchar(35),
 @City varchar(25),
 @state char(2),
	   @zip char(5),
	    @phone char(10),
		 @birthdate date,
		  @hireDate date,
		  @empLoginName sysname,

		  @repComission smallmoney,
		  @rate decimal(5,2)

   as
     
  -- if not exists (select PhoneNumber from EMPLOYEE where PhoneNumber= @phone) --need to add employee
	begin try
	begin transaction
	begin
		set nocount on
		declare @empID int;
		
		 insert into EMPLOYEE (firstname, lastname, street, city, empstate, ZipCode, phonenumber, birthdate, hiredate, empTypeID, empLogin) values(@EmpFName,  @EmpLName, @empStreet, @City, @state, @zip, @phone, @birthdate, @hireDate, 1, @empLoginName)
	end

	select @empID = empID from EMPLOYEE where PhoneNumber = @phone

insert into SALESREP values(@empID, @repComission, @rate)
commit transaction
	end try
	begin catch
	Declare @errorMessage nvarchar(max)
	SELECT @ErrorMessage = ERROR_MESSAGE()
	rollback transaction
		RAISERROR (@ErrorMessage, 16, 1)
	end catch


GO
GRANT EXECUTE ON [dbo].[spAddSalesRep] TO [PR_AccountantRole] AS [dbo]
GO
/****** Object:  Trigger [dbo].[CheckQuotedPrice]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[CheckQuotedPrice]
   ON  [dbo].[ORDER_LINE]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Declare @currentPrice smallmoney;
   Declare @partNum nchar(10);
   Declare @quotedPrice smallmoney;
   Declare @MaxDiscount smallmoney;

   -- if exists (select * from inserted)
    begin   
       select @quotedPrice = QUOTED_PRICE from inserted
	   select @partNum = part_num from inserted
       select @currentPrice = price from PART where PART_NUM = @partNum
	  select  @MaxDiscount = @currentPrice * .95

	  if @quotedPrice < @MaxDiscount
			begin
				raiserror('Quoted price too low', 11,1)
				rollback transaction
			end

     
		end  
   
     
	 end

        
  select * from part


GO
ALTER TABLE [dbo].[ORDER_LINE] ENABLE TRIGGER [CheckQuotedPrice]
GO
/****** Object:  Trigger [dbo].[UpdateCustBalance]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[UpdateCustBalance]
   ON  [dbo].[ORDER_LINE] 
   AFTER  INSERT,DELETE,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @orderNum nchar(10);
	declare @custNum nchar(10);
	declare @qty int;--how many were ordered
	declare @quotedPrice smallmoney;--price per item
	declare @subtotal smallmoney;--total charge for this item
	if exists (select * from inserted)
	  --a new record is being inserted into orderline
	  print 'inserting a new record'
	  begin
	    if exists (select * from deleted)
	    --part of an order is being updated
	      
	    begin
	        print 'replacing an orderline record'
	        select @qty = QTY_ORDERED from deleted
	        select @quotedPrice = QUOTED_PRICE from deleted
	        select @orderNum = order_num from deleted
	        set @subtotal = @quotedPrice * @qty
	        --find which customer placed this order
	        select @custNum =
	            cust_num from orders
	                where order_num = @orderNum
	        --find the customer record of this customer
	        update customer
	        set cust_balance = cust_balance - @subtotal
	        where cust_num = @custNum        
	    end  --end update
	    select @qty = qty_ordered from inserted
	    select @quotedPrice = quoted_price from inserted
	    select @orderNum = order_num from inserted
	    set @subtotal = @qty * @quotedPrice --how much
	        -- will be owed for this order
	    
	    print 'verify that have enough credit'    
	    declare @remainCredit smallmoney;
	    select @custNum =
	            cust_num from orders
	                where order_num = @orderNum
	    select @remainCredit =
	         credit_limit - cust_balance
	         from customer
	            inner join orders
	                on customer.cust_num = 
	                  orders.cust_num
	                  where orders.order_num=
	                     @orderNum
	    if @subtotal > @remainCredit
	        begin
	            raiserror('insufficient credit',10,1);
	            rollback transaction
	        end   
	    print 'now update customer balance to reflect this order'              
	   
	    update customer
	       set cust_balance = cust_balance + @subtotal
	        where cust_num = @custNum 
	    print 'update customer record'                   
	   end
	  
	if 
	     exists (select * from deleted)
	      if   not exists (select * from inserted)
	    --a  record is being deleted from  orderline
   begin
            print 'deleting data from order_line'
	        select @qty = qty_ordered from deleted
	        select @quotedPrice = quoted_price from deleted
	        select @orderNum = order_num from deleted
	        set @subtotal = @quotedPrice * @qty
	        --find which customer placed this order
	        select @custNum =
	            cust_num from orders
	                where order_num = @orderNum
	        --find the customer record of this customer
	        update customer
	        set cust_balance = cust_balance - @subtotal
	        where cust_num = @custNum        
	    end  --end update
    
      
END
GO
ALTER TABLE [dbo].[ORDER_LINE] ENABLE TRIGGER [UpdateCustBalance]
GO
/****** Object:  Trigger [dbo].[UpdatePartsInv]    Script Date: 6/13/2017 12:43:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[UpdatePartsInv]
   ON  [dbo].[ORDER_LINE]
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Declare @PartNum nchar(10);
   Declare @qty smallint;
   Declare @qtyAvail smallint;
    if exists (select * from inserted)
    begin   --process an insert of a record
    if exists (select * from deleted)  --this is really an update
      begin       -- add the qty back to units on hand
       select @PartNum = Part_Num from deleted
       select @qty = qty_ordered from deleted
       update part
         set units_on_hand = units_on_hand + @qty
         where part_num = @PartNum
         
     end
      --continue to process the insert 
      select @PartNum = Part_Num from inserted
      select @qty = qty_ordered from inserted
   
      select @qtyAvail = units_on_hand from part
          where Part_Num = @PartNum
      --check if have enough inventory
      if @qtyAvail < @qty
          begin
             raiserror('insufficient inventory', 11,1)
             rollback transaction
          end     
       else
         --modify the part table
          update part
            set units_on_hand = units_on_hand - @qty
             where Part_Num = @PartNum   
    end   --process an insert or update
    else --just processing a delete
      begin
        select @PartNum = Part_Num from deleted
        select @qty = qty_ordered from deleted
        update part
         set units_on_hand = units_on_hand + @qty
         where part_num = @PartNum
      end  
   
     
  
        
   

END
GO
ALTER TABLE [dbo].[ORDER_LINE] ENABLE TRIGGER [UpdatePartsInv]
GO
USE [master]
GO
ALTER DATABASE [PREMIERE] SET  READ_WRITE 
GO
