USE [master]
GO
/**/
/****** Object:  Database [RickRollGeneratorM151]    Script Date: 08.11.2021 08:48:41 ******/
create DATABASE [RickRollGeneratorM151]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RickRollGeneratorM151', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\RickRollGeneratorM151.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RickRollGeneratorM151_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\RickRollGeneratorM151_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 with CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RickRollGeneratorM151].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [RickRollGeneratorM151] SET ANSI_NULL_DEFAULT OFF 
GO

alter database [RickRollGeneratorM151] SET ANSI_NULLS OFF
GO

alter database [RickRollGeneratorM151] SET ANSI_PADDING OFF
GO

alter database [RickRollGeneratorM151] SET ANSI_WARNINGS OFF
GO

alter database [RickRollGeneratorM151] SET ARITHABORT OFF
GO

alter database [RickRollGeneratorM151] SET AUTO_CLOSE OFF
GO

alter database [RickRollGeneratorM151] SET AUTO_SHRINK OFF
GO

alter database [RickRollGeneratorM151] SET AUTO_UPDATE_STATISTICS ON
GO

alter database [RickRollGeneratorM151] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

alter database [RickRollGeneratorM151] SET CURSOR_DEFAULT  GLOBAL
GO

alter database [RickRollGeneratorM151] SET CONCAT_NULL_YIELDS_NULL OFF
GO

alter database [RickRollGeneratorM151] SET NUMERIC_ROUNDABORT OFF
GO

alter database [RickRollGeneratorM151] SET QUOTED_IDENTIFIER OFF
GO

alter database [RickRollGeneratorM151] SET RECURSIVE_TRIGGERS OFF
GO

alter database [RickRollGeneratorM151] SET  DISABLE_BROKER
GO

alter database [RickRollGeneratorM151] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

alter database [RickRollGeneratorM151] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

alter database [RickRollGeneratorM151] SET TRUSTWORTHY OFF
GO

alter database [RickRollGeneratorM151] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

alter database [RickRollGeneratorM151] SET PARAMETERIZATION SIMPLE
GO

alter database [RickRollGeneratorM151] SET READ_COMMITTED_SNAPSHOT OFF
GO

alter database [RickRollGeneratorM151] SET HONOR_BROKER_PRIORITY OFF
GO

alter database [RickRollGeneratorM151] SET RECOVERY SIMPLE
GO

alter database [RickRollGeneratorM151] SET  MULTI_USER
GO

alter database [RickRollGeneratorM151] SET PAGE_VERIFY CHECKSUM
GO

alter database [RickRollGeneratorM151] SET DB_CHAINING OFF
GO

alter database [RickRollGeneratorM151] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO

alter database [RickRollGeneratorM151] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO

alter database [RickRollGeneratorM151] SET DELAYED_DURABILITY = DISABLED
GO

alter database [RickRollGeneratorM151] SET ACCELERATED_DATABASE_RECOVERY = OFF
GO

alter database [RickRollGeneratorM151] SET QUERY_STORE = OFF
GO

alter database [RickRollGeneratorM151] SET  READ_WRITE
GO
