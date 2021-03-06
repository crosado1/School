/****** Object:  Database [School]    Script Date: 06/29/2016 16:54:38 ******/
CREATE DATABASE [School] ON  PRIMARY 
( NAME = N'School', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\School.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'School_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\School_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [School] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [School] SET ANSI_NULLS OFF
GO
ALTER DATABASE [School] SET ANSI_PADDING OFF
GO
ALTER DATABASE [School] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [School] SET ARITHABORT OFF
GO
ALTER DATABASE [School] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [School] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [School] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [School] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [School] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [School] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [School] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [School] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [School] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [School] SET  DISABLE_BROKER
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [School] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [School] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [School] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [School] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [School] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [School] SET  READ_WRITE
GO
ALTER DATABASE [School] SET RECOVERY FULL
GO
ALTER DATABASE [School] SET  MULTI_USER
GO
ALTER DATABASE [School] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [School] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'School', N'ON'
GO
/****** Object:  ForeignKey [FK_UserRole_Role]    Script Date: 06/29/2016 16:54:39 ******/
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_Role]
GO
/****** Object:  ForeignKey [FK_UserRole_User]    Script Date: 06/29/2016 16:54:39 ******/
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_User]
GO
/****** Object:  ForeignKey [FK_Student_City]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_City]
GO
/****** Object:  ForeignKey [FK_Student_Gender]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Gender]
GO
/****** Object:  ForeignKey [FK_PeriodStatus_Period]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodStatus] DROP CONSTRAINT [FK_PeriodStatus_Period]
GO
/****** Object:  ForeignKey [FK_PeriodGrade_Grade]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGrade] DROP CONSTRAINT [FK_PeriodGrade_Grade]
GO
/****** Object:  ForeignKey [FK_PeriodGrade_Period]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGrade] DROP CONSTRAINT [FK_PeriodGrade_Period]
GO
/****** Object:  ForeignKey [FK_PeriodGradeGroup_PeriodGrade]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeGroup] DROP CONSTRAINT [FK_PeriodGradeGroup_PeriodGrade]
GO
/****** Object:  ForeignKey [FK_PeriodGradeStudent_PeriodGradeGroup]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeStudent] DROP CONSTRAINT [FK_PeriodGradeStudent_PeriodGradeGroup]
GO
/****** Object:  ForeignKey [FK_PeriodGradeStudent_Student]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeStudent] DROP CONSTRAINT [FK_PeriodGradeStudent_Student]
GO
/****** Object:  ForeignKey [FK_PeriodGradeStudentTranTypeConfiguration_PeriodGradeStudent]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration] DROP CONSTRAINT [FK_PeriodGradeStudentTranTypeConfiguration_PeriodGradeStudent]
GO
/****** Object:  ForeignKey [FK_PeriodGradeStudentTranTypeConfiguration_RunSchedule]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration] DROP CONSTRAINT [FK_PeriodGradeStudentTranTypeConfiguration_RunSchedule]
GO
/****** Object:  ForeignKey [FK_PeriodGradeStudentTranTypeConfiguration_TransactionType]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration] DROP CONSTRAINT [FK_PeriodGradeStudentTranTypeConfiguration_TransactionType]
GO
/****** Object:  ForeignKey [FK_StudentPayTransaction_PeriodGradeStudentTranTypeConfiguration]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[StudentPayTransaction] DROP CONSTRAINT [FK_StudentPayTransaction_PeriodGradeStudentTranTypeConfiguration]
GO
/****** Object:  ForeignKey [FK_PayTransaction_StudentPayTransaction]    Script Date: 06/29/2016 16:54:41 ******/
ALTER TABLE [dbo].[PayTransaction] DROP CONSTRAINT [FK_PayTransaction_StudentPayTransaction]
GO
/****** Object:  ForeignKey [FK_StudentPayTransactionStatus_PayTransactionStatusType]    Script Date: 06/29/2016 16:54:41 ******/
ALTER TABLE [dbo].[StudentPayTransactionStatus] DROP CONSTRAINT [FK_StudentPayTransactionStatus_PayTransactionStatusType]
GO
/****** Object:  ForeignKey [FK_StudentPayTransactionStatus_StudentPayTransaction]    Script Date: 06/29/2016 16:54:41 ******/
ALTER TABLE [dbo].[StudentPayTransactionStatus] DROP CONSTRAINT [FK_StudentPayTransactionStatus_StudentPayTransaction]
GO
/****** Object:  StoredProcedure [dbo].[proc_Grade_ExpenceSummaryByPeriod]    Script Date: 06/29/2016 16:54:41 ******/
DROP PROCEDURE [dbo].[proc_Grade_ExpenceSummaryByPeriod]
GO
/****** Object:  StoredProcedure [dbo].[proc_PayTransaction_GetAll]    Script Date: 06/29/2016 16:54:41 ******/
DROP PROCEDURE [dbo].[proc_PayTransaction_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[proc_PayTransaction_GetAllByStudent]    Script Date: 06/29/2016 16:54:41 ******/
DROP PROCEDURE [dbo].[proc_PayTransaction_GetAllByStudent]
GO
/****** Object:  StoredProcedure [dbo].[proc_PayTransaction_SubmitPay]    Script Date: 06/29/2016 16:54:41 ******/
DROP PROCEDURE [dbo].[proc_PayTransaction_SubmitPay]
GO
/****** Object:  StoredProcedure [dbo].[proc_Student_PaymentAvailable]    Script Date: 06/29/2016 16:54:41 ******/
DROP PROCEDURE [dbo].[proc_Student_PaymentAvailable]
GO
/****** Object:  Table [dbo].[StudentPayTransactionStatus]    Script Date: 06/29/2016 16:54:41 ******/
ALTER TABLE [dbo].[StudentPayTransactionStatus] DROP CONSTRAINT [FK_StudentPayTransactionStatus_PayTransactionStatusType]
GO
ALTER TABLE [dbo].[StudentPayTransactionStatus] DROP CONSTRAINT [FK_StudentPayTransactionStatus_StudentPayTransaction]
GO
DROP TABLE [dbo].[StudentPayTransactionStatus]
GO
/****** Object:  Table [dbo].[PayTransaction]    Script Date: 06/29/2016 16:54:41 ******/
ALTER TABLE [dbo].[PayTransaction] DROP CONSTRAINT [FK_PayTransaction_StudentPayTransaction]
GO
DROP TABLE [dbo].[PayTransaction]
GO
/****** Object:  Table [dbo].[StudentPayTransaction]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[StudentPayTransaction] DROP CONSTRAINT [FK_StudentPayTransaction_PeriodGradeStudentTranTypeConfiguration]
GO
DROP TABLE [dbo].[StudentPayTransaction]
GO
/****** Object:  StoredProcedure [dbo].[proc_PeriodGradeStudentTranTypeConfiguration_Insert]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_PeriodGradeStudentTranTypeConfiguration_Insert]
GO
/****** Object:  StoredProcedure [dbo].[proc_Grade_GetGroups]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_Grade_GetGroups]
GO
/****** Object:  StoredProcedure [dbo].[proc_Grade_StudentSummaryByGroup]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_Grade_StudentSummaryByGroup]
GO
/****** Object:  StoredProcedure [dbo].[proc_Grade_StudentSummaryByPeriod]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_Grade_StudentSummaryByPeriod]
GO
/****** Object:  StoredProcedure [dbo].[proc_Period_StudentSummaryByPeriod]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_Period_StudentSummaryByPeriod]
GO
/****** Object:  StoredProcedure [dbo].[proc_PeriodGradeStudent_Insert]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_PeriodGradeStudent_Insert]
GO
/****** Object:  Table [dbo].[PeriodGradeStudentTranTypeConfiguration]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration] DROP CONSTRAINT [FK_PeriodGradeStudentTranTypeConfiguration_PeriodGradeStudent]
GO
ALTER TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration] DROP CONSTRAINT [FK_PeriodGradeStudentTranTypeConfiguration_RunSchedule]
GO
ALTER TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration] DROP CONSTRAINT [FK_PeriodGradeStudentTranTypeConfiguration_TransactionType]
GO
DROP TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration]
GO
/****** Object:  Table [dbo].[PeriodGradeStudent]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeStudent] DROP CONSTRAINT [FK_PeriodGradeStudent_PeriodGradeGroup]
GO
ALTER TABLE [dbo].[PeriodGradeStudent] DROP CONSTRAINT [FK_PeriodGradeStudent_Student]
GO
DROP TABLE [dbo].[PeriodGradeStudent]
GO
/****** Object:  StoredProcedure [dbo].[proc_PeriodGradeGroup_GetByPeriodGradeId]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_PeriodGradeGroup_GetByPeriodGradeId]
GO
/****** Object:  StoredProcedure [dbo].[proc_PeriodGradeGroup_Insert]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_PeriodGradeGroup_Insert]
GO
/****** Object:  StoredProcedure [dbo].[proc_Period_Insert]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_Period_Insert]
GO
/****** Object:  StoredProcedure [dbo].[proc_Period_ReadyToAdd]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_Period_ReadyToAdd]
GO
/****** Object:  StoredProcedure [dbo].[proc_PeriodGrade_GetByPeriod]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_PeriodGrade_GetByPeriod]
GO
/****** Object:  StoredProcedure [dbo].[proc_Grade_StudentDetailByPeriod]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_Grade_StudentDetailByPeriod]
GO
/****** Object:  StoredProcedure [dbo].[proc_Period_GetAll]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_Period_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[proc_PeriodStatus_Insert]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_PeriodStatus_Insert]
GO
/****** Object:  StoredProcedure [dbo].[proc_Student_GetById]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_Student_GetById]
GO
/****** Object:  StoredProcedure [dbo].[proc_Student_Insert]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_Student_Insert]
GO
/****** Object:  StoredProcedure [dbo].[proc_User_GetUserByRole]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_User_GetUserByRole]
GO
/****** Object:  Table [dbo].[PeriodGradeGroup]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeGroup] DROP CONSTRAINT [FK_PeriodGradeGroup_PeriodGrade]
GO
DROP TABLE [dbo].[PeriodGradeGroup]
GO
/****** Object:  Table [dbo].[PeriodGrade]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGrade] DROP CONSTRAINT [FK_PeriodGrade_Grade]
GO
ALTER TABLE [dbo].[PeriodGrade] DROP CONSTRAINT [FK_PeriodGrade_Period]
GO
DROP TABLE [dbo].[PeriodGrade]
GO
/****** Object:  Table [dbo].[PeriodStatus]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodStatus] DROP CONSTRAINT [FK_PeriodStatus_Period]
GO
DROP TABLE [dbo].[PeriodStatus]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_City]
GO
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Gender]
GO
DROP TABLE [dbo].[Student]
GO
/****** Object:  StoredProcedure [dbo].[proc_Grade_GetAll]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_Grade_GetAll]
GO
/****** Object:  StoredProcedure [dbo].[proc_Gender_GetAll]    Script Date: 06/29/2016 16:54:40 ******/
DROP PROCEDURE [dbo].[proc_Gender_GetAll]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 06/29/2016 16:54:39 ******/
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_User]
GO
DROP TABLE [dbo].[UserRole]
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 06/29/2016 16:54:39 ******/
DROP TABLE [dbo].[TransactionType]
GO
/****** Object:  Table [dbo].[User]    Script Date: 06/29/2016 16:54:39 ******/
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 06/29/2016 16:54:39 ******/
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[RunSchedule]    Script Date: 06/29/2016 16:54:39 ******/
DROP TABLE [dbo].[RunSchedule]
GO
/****** Object:  Table [dbo].[PeriodStatusType]    Script Date: 06/29/2016 16:54:39 ******/
DROP TABLE [dbo].[PeriodStatusType]
GO
/****** Object:  Table [dbo].[PayTransactionStatusType]    Script Date: 06/29/2016 16:54:39 ******/
DROP TABLE [dbo].[PayTransactionStatusType]
GO
/****** Object:  Table [dbo].[Period]    Script Date: 06/29/2016 16:54:39 ******/
DROP TABLE [dbo].[Period]
GO
/****** Object:  Table [dbo].[City]    Script Date: 06/29/2016 16:54:39 ******/
DROP TABLE [dbo].[City]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 06/29/2016 16:54:39 ******/
DROP TABLE [dbo].[Gender]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 06/29/2016 16:54:39 ******/
DROP TABLE [dbo].[Grade]
GO
/****** Object:  User [school]    Script Date: 06/29/2016 16:54:38 ******/
DROP USER [school]
GO
/****** Object:  User [school]    Script Date: 06/29/2016 16:54:38 ******/
CREATE USER [school] FOR LOGIN [school] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 06/29/2016 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grade](
	[gradeId] [int] NOT NULL,
	[gradeDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[gradeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Grade] ([gradeId], [gradeDescription]) VALUES (1, N'Pre-Kinder')
INSERT [dbo].[Grade] ([gradeId], [gradeDescription]) VALUES (2, N'Kinder')
INSERT [dbo].[Grade] ([gradeId], [gradeDescription]) VALUES (3, N'Primero')
INSERT [dbo].[Grade] ([gradeId], [gradeDescription]) VALUES (4, N'Segundo')
/****** Object:  Table [dbo].[Gender]    Script Date: 06/29/2016 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gender](
	[genderId] [int] NOT NULL,
	[genderDescription] [varchar](50) NOT NULL,
	[genderLetter] [char](1) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[genderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Gender] ([genderId], [genderDescription], [genderLetter]) VALUES (1, N'Femenino', N'F')
INSERT [dbo].[Gender] ([genderId], [genderDescription], [genderLetter]) VALUES (2, N'Masculino', N'M')
/****** Object:  Table [dbo].[City]    Script Date: 06/29/2016 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[cityId] [int] IDENTITY(1,1) NOT NULL,
	[cityDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON
INSERT [dbo].[City] ([cityId], [cityDescription]) VALUES (1, N'Naranjito')
SET IDENTITY_INSERT [dbo].[City] OFF
/****** Object:  Table [dbo].[Period]    Script Date: 06/29/2016 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Period](
	[periodId] [int] IDENTITY(1,1) NOT NULL,
	[yearFrom] [varchar](50) NOT NULL,
	[yearTo] [varchar](50) NOT NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_Period] PRIMARY KEY CLUSTERED 
(
	[periodId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Period] ON
INSERT [dbo].[Period] ([periodId], [yearFrom], [yearTo], [active]) VALUES (1, N'Aug-2012', N'May-2013', 0)
INSERT [dbo].[Period] ([periodId], [yearFrom], [yearTo], [active]) VALUES (2, N'Aug-2013', N'May-2014', 0)
INSERT [dbo].[Period] ([periodId], [yearFrom], [yearTo], [active]) VALUES (3, N'Aug-2014', N'May-2015', 0)
INSERT [dbo].[Period] ([periodId], [yearFrom], [yearTo], [active]) VALUES (4, N'Aug-2015', N'May-2016', 1)
INSERT [dbo].[Period] ([periodId], [yearFrom], [yearTo], [active]) VALUES (5, N'Aug-2016', N'May-2017', 0)
SET IDENTITY_INSERT [dbo].[Period] OFF
/****** Object:  Table [dbo].[PayTransactionStatusType]    Script Date: 06/29/2016 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PayTransactionStatusType](
	[payTransactionStatusTypeId] [int] NOT NULL,
	[payTransactionStatusTypeDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PayTransactionStatusType] PRIMARY KEY CLUSTERED 
(
	[payTransactionStatusTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[PayTransactionStatusType] ([payTransactionStatusTypeId], [payTransactionStatusTypeDescription]) VALUES (1, N'Ready To Pay')
INSERT [dbo].[PayTransactionStatusType] ([payTransactionStatusTypeId], [payTransactionStatusTypeDescription]) VALUES (2, N'Partial Payment')
INSERT [dbo].[PayTransactionStatusType] ([payTransactionStatusTypeId], [payTransactionStatusTypeDescription]) VALUES (3, N'Full Payment')
/****** Object:  Table [dbo].[PeriodStatusType]    Script Date: 06/29/2016 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PeriodStatusType](
	[periodStatusTypeId] [int] IDENTITY(1,1) NOT NULL,
	[periodStatusTypeDesc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PeriodStatusType] PRIMARY KEY CLUSTERED 
(
	[periodStatusTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PeriodStatusType] ON
INSERT [dbo].[PeriodStatusType] ([periodStatusTypeId], [periodStatusTypeDesc]) VALUES (1, N'In Configuration Step')
INSERT [dbo].[PeriodStatusType] ([periodStatusTypeId], [periodStatusTypeDesc]) VALUES (2, N'Configuration Completed')
INSERT [dbo].[PeriodStatusType] ([periodStatusTypeId], [periodStatusTypeDesc]) VALUES (3, N'Active Period')
INSERT [dbo].[PeriodStatusType] ([periodStatusTypeId], [periodStatusTypeDesc]) VALUES (4, N'Period Completed')
SET IDENTITY_INSERT [dbo].[PeriodStatusType] OFF
/****** Object:  Table [dbo].[RunSchedule]    Script Date: 06/29/2016 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RunSchedule](
	[runScheduleId] [int] NOT NULL,
	[runScheduleDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RunSchedule] PRIMARY KEY CLUSTERED 
(
	[runScheduleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[RunSchedule] ([runScheduleId], [runScheduleDescription]) VALUES (1, N'Anual')
INSERT [dbo].[RunSchedule] ([runScheduleId], [runScheduleDescription]) VALUES (2, N'Monthly')
INSERT [dbo].[RunSchedule] ([runScheduleId], [runScheduleDescription]) VALUES (3, N'Semanal')
/****** Object:  Table [dbo].[Role]    Script Date: 06/29/2016 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON
INSERT [dbo].[Role] ([roleId], [roleDescription]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([roleId], [roleDescription]) VALUES (2, N'Teacher')
INSERT [dbo].[Role] ([roleId], [roleDescription]) VALUES (3, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
/****** Object:  Table [dbo].[User]    Script Date: 06/29/2016 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[userPassword] [varchar](50) NOT NULL,
	[userFullName] [varchar](100) NOT NULL,
	[userEmailAddress] [varchar](200) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([userId], [userName], [userPassword], [userFullName], [userEmailAddress]) VALUES (1, N'admin_1', N'123456789', N'Admin 1', N'admin1@hotmail.com')
INSERT [dbo].[User] ([userId], [userName], [userPassword], [userFullName], [userEmailAddress]) VALUES (4, N'teacher_1', N'123456789', N'Teacher 1', N'teacher1@hotmail.com')
INSERT [dbo].[User] ([userId], [userName], [userPassword], [userFullName], [userEmailAddress]) VALUES (5, N'teacher_2', N'123456789', N'Teacher 2', N'teacher2@hotmail.com')
INSERT [dbo].[User] ([userId], [userName], [userPassword], [userFullName], [userEmailAddress]) VALUES (7, N'teacher_3', N'123456789', N'Teacher 3', N'teacher3@hotmail.com')
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[TransactionType]    Script Date: 06/29/2016 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionType](
	[transactionTypeId] [int] NOT NULL,
	[transactionTypeDescription] [varchar](50) NOT NULL,
	[markOfDefault] [bit] NULL,
	[runScheduleId] [int] NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[transactionTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TransactionType] ([transactionTypeId], [transactionTypeDescription], [markOfDefault], [runScheduleId]) VALUES (1, N'Matricula', 1, 1)
INSERT [dbo].[TransactionType] ([transactionTypeId], [transactionTypeDescription], [markOfDefault], [runScheduleId]) VALUES (2, N'Mensualidad', 1, 2)
INSERT [dbo].[TransactionType] ([transactionTypeId], [transactionTypeDescription], [markOfDefault], [runScheduleId]) VALUES (3, N'Tutoria', NULL, 3)
/****** Object:  Table [dbo].[UserRole]    Script Date: 06/29/2016 16:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[userRoleId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[roleId] [int] NOT NULL,
	[fromDate] [datetime] NOT NULL,
	[toDate] [datetime] NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[userRoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON
INSERT [dbo].[UserRole] ([userRoleId], [userId], [roleId], [fromDate], [toDate]) VALUES (1, 1, 1, CAST(0x0000A58000000000 AS DateTime), NULL)
INSERT [dbo].[UserRole] ([userRoleId], [userId], [roleId], [fromDate], [toDate]) VALUES (3, 4, 2, CAST(0x0000A58000000000 AS DateTime), NULL)
INSERT [dbo].[UserRole] ([userRoleId], [userId], [roleId], [fromDate], [toDate]) VALUES (4, 5, 2, CAST(0x0000A58000000000 AS DateTime), NULL)
INSERT [dbo].[UserRole] ([userRoleId], [userId], [roleId], [fromDate], [toDate]) VALUES (5, 7, 2, CAST(0x0000A58000000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
/****** Object:  StoredProcedure [dbo].[proc_Gender_GetAll]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_Gender_GetAll]	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from Gender
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Grade_GetAll]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_Grade_GetAll]	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from Grade
END
GO
/****** Object:  Table [dbo].[Student]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[studentId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[middleName] [varchar](10) NULL,
	[lastName] [varchar](50) NOT NULL,
	[genderId] [int] NOT NULL,
	[address1] [varchar](200) NULL,
	[address2] [varchar](200) NULL,
	[cityId] [int] NULL,
	[zipCode] [varchar](50) NULL,
	[stateCode] [char](2) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[studentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (1, N'Estudiante', N't', N'1', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (2, N'Estudiante', N't', N'2', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (3, N'Estudiante', N't', N'3', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (4, N'Estudiante', N't', N'4', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (5, N'Juan', N'D', N'Pueblo 1', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (6, N'Rosa', N'M', N'Rosario', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (7, N'Carlos', N'L', N'Rosado', 2, N'Address1', N'Address2', 1, N'ZipCode', N'PR')
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (12, N'Jose', N'M', N'Rosado', 2, N'adress 1', N'address 2', 1, N'12345', N'PR')
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (13, N'Jose', N'M', N'Pepito', 2, N'Address 1', N'Address 2', 1, N'001234', N'PR')
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (14, N'Juan', NULL, N'Rosa', 2, N'Address 1', N'Address 2', 1, N'78456', N'PR')
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (15, N'Pedrito', N'S', N'De la casa', 1, N'Address 1', NULL, 1, N'96857', N'PR')
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (19, N'test', N't', N'test', 2, N'Address 1', N'Address 1', 1, N'78965', N'PR')
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (20, N'Carlos 1', N'd', N'Test', 1, N'Address 1', NULL, 1, N'555555', N'PR')
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (21, N'Car', N'L', N'Testing', 2, N'Address 1', NULL, 1, N'96857', N'PR')
INSERT [dbo].[Student] ([studentId], [firstName], [middleName], [lastName], [genderId], [address1], [address2], [cityId], [zipCode], [stateCode]) VALUES (22, N'Prueba ', NULL, N'Test', 2, N'Address 1', NULL, 1, N'78965', N'PR')
SET IDENTITY_INSERT [dbo].[Student] OFF
/****** Object:  Table [dbo].[PeriodStatus]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodStatus](
	[periodStatusId] [int] IDENTITY(1,1) NOT NULL,
	[periodId] [int] NOT NULL,
	[periodStatusTypeId] [int] NOT NULL,
	[fromDate] [datetime] NOT NULL,
	[toDate] [datetime] NULL,
 CONSTRAINT [PK_PeriodStatus] PRIMARY KEY CLUSTERED 
(
	[periodStatusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PeriodStatus] ON
INSERT [dbo].[PeriodStatus] ([periodStatusId], [periodId], [periodStatusTypeId], [fromDate], [toDate]) VALUES (1, 1, 4, CAST(0x0000A58000000000 AS DateTime), NULL)
INSERT [dbo].[PeriodStatus] ([periodStatusId], [periodId], [periodStatusTypeId], [fromDate], [toDate]) VALUES (2, 2, 4, CAST(0x0000A58000000000 AS DateTime), NULL)
INSERT [dbo].[PeriodStatus] ([periodStatusId], [periodId], [periodStatusTypeId], [fromDate], [toDate]) VALUES (3, 3, 4, CAST(0x0000A58000000000 AS DateTime), NULL)
INSERT [dbo].[PeriodStatus] ([periodStatusId], [periodId], [periodStatusTypeId], [fromDate], [toDate]) VALUES (4, 4, 3, CAST(0x0000A58000000000 AS DateTime), NULL)
INSERT [dbo].[PeriodStatus] ([periodStatusId], [periodId], [periodStatusTypeId], [fromDate], [toDate]) VALUES (6, 5, 1, CAST(0x0000A63401159218 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PeriodStatus] OFF
/****** Object:  Table [dbo].[PeriodGrade]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodGrade](
	[periodGradeId] [int] IDENTITY(1,1) NOT NULL,
	[periodId] [int] NOT NULL,
	[gradeId] [int] NOT NULL,
 CONSTRAINT [PK_PeriodGrade] PRIMARY KEY CLUSTERED 
(
	[periodGradeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PeriodGrade] ON
INSERT [dbo].[PeriodGrade] ([periodGradeId], [periodId], [gradeId]) VALUES (1, 4, 1)
INSERT [dbo].[PeriodGrade] ([periodGradeId], [periodId], [gradeId]) VALUES (2, 4, 2)
INSERT [dbo].[PeriodGrade] ([periodGradeId], [periodId], [gradeId]) VALUES (3, 4, 3)
INSERT [dbo].[PeriodGrade] ([periodGradeId], [periodId], [gradeId]) VALUES (4, 4, 4)
INSERT [dbo].[PeriodGrade] ([periodGradeId], [periodId], [gradeId]) VALUES (6, 5, 1)
SET IDENTITY_INSERT [dbo].[PeriodGrade] OFF
/****** Object:  Table [dbo].[PeriodGradeGroup]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PeriodGradeGroup](
	[periodGradeGroupId] [int] IDENTITY(1,1) NOT NULL,
	[periodGradeId] [int] NOT NULL,
	[groupDescription] [varchar](50) NOT NULL,
	[groupNumber] [varchar](10) NULL,
	[leaderId] [int] NULL,
 CONSTRAINT [PK_PeriodGradeGroup] PRIMARY KEY CLUSTERED 
(
	[periodGradeGroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PeriodGradeGroup] ON
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (1, 1, N'01', N'01', NULL)
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (2, 1, N'02', N'02', NULL)
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (3, 2, N'01', N'01', NULL)
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (4, 2, N'02', N'02', NULL)
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (5, 3, N'01', N'01', NULL)
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (6, 3, N'02', N'02', NULL)
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (7, 4, N'01', N'01', NULL)
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (8, 4, N'02', N'02', NULL)
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (9, 1, N'Prueba de Carlos Rosado', N'003', 4)
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (10, 1, N'De prueba otra vez', N'04', 4)
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (11, 1, N'test', N'05', 3)
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (12, 2, N't', N'03', 3)
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (13, 1, N'fffffff', N'06', 3)
INSERT [dbo].[PeriodGradeGroup] ([periodGradeGroupId], [periodGradeId], [groupDescription], [groupNumber], [leaderId]) VALUES (14, 2, N'test', N'04', 4)
SET IDENTITY_INSERT [dbo].[PeriodGradeGroup] OFF
/****** Object:  StoredProcedure [dbo].[proc_User_GetUserByRole]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_User_GetUserByRole]
	@roleId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select ur.*,
			r.roleDescription,
			u.userName,
			u.userPassword,
			u.userFullName,
			u.userEmailAddress
	From UserRole ur inner join Role r
			on ur.roleId	= r.roleId inner join [User] u
			on ur.userId = u.userId
	where ur.roleId = @roleId
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Student_Insert]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_Student_Insert]
	@studentId int output,
	@firstName varchar(50),
	@middleName varchar(10),
	@lastName varchar(50),
	@genderId int,
	@address1 varchar(200),
	@address2 varchar(200),
	@cityId int,
	@zipCode varchar(50),
	@stateCode char(2)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Student]
           ([firstName]
           ,[middleName]
           ,[lastName]
           ,[genderId]
           ,[address1]
           ,[address2]
           ,[cityId]
           ,[zipCode]
           ,[stateCode])
     VALUES
           (@firstName
           ,@middleName
           ,@lastName
           ,@genderId
           ,@address1
           ,@address2
           ,@cityId
           ,@zipCode
           ,@stateCode)
     
     Select @studentId = SCOPE_IDENTITY()      
         
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Student_GetById]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Student_GetById]
	@studentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select s.*,
				g.genderDescription,g.genderLetter,c.cityDescription from dbo.Student s inner join Gender g
			on s.genderId = g.genderId left outer join City c
			on s.cityId = c.cityId
	where s.studentId = @studentId
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PeriodStatus_Insert]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_PeriodStatus_Insert]
	--@periodStatusId int output,
	@periodId int,
	@periodStatusTypeId int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @periodStatusId int
	 

    -- Insert statements for procedure here
	Insert into PeriodStatus(periodId,periodStatusTypeId,fromDate,toDate)Values(@periodId,@periodStatusTypeId,getdate(),null)
	Select @periodStatusId = Scope_Identity()

	Update PeriodStatus
		Set todate = getdate()
	Where periodId = @periodId
			and todate is null
			and periodStatusId != @periodStatusId
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Period_GetAll]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_Period_GetAll]	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select p.periodId,
			yearFrom,
			yearTo,
			'Period: '+cast(yearFrom as varchar(4000)) + ' To ' + cast(yearTo as  varchar(4000)) YearDescription,
			active,
			ps.fromDate,
			ps.toDate,
			pst.*
	From Period p inner join PeriodStatus ps
			on p.periodId = ps.periodId inner join PeriodStatusType pst
			on ps.periodStatusTypeId = pst.periodStatusTypeId
			
	order by 1 desc
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Grade_StudentDetailByPeriod]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Grade_StudentDetailByPeriod]
	@periodId int,
	@gradeId int,
	@firstName varchar(50),
	@lastName varchar(50),
	@genderId int,
	@studentCode varchar(max),
	@pageIndex int,
	@pageCount int,
	@sortBy varchar(100),
	@sortOrder varchar(10)

AS
BEGIN
	
Declare @sqlStatement varchar(max)
Declare @periodConfiguredId int

select @periodConfiguredId =  isnull(p.periodId,0) from period p inner join periodStatus ps
		on p.periodId = ps.periodId
where ps.todate is null
	and ps.periodstatustypeId in (1,2)

Set @periodConfiguredId = isnull(@periodConfiguredId,0)



Set @sqlStatement = 'Select * into #tempStudentSearch from 
						(Select pgs.*,
							pgg.periodGradeId,
							g.gradeId,
							g.gradeDescription,
							s.firstName,
							s.middleName,
							s.lastName,
							gen.*,
							pg.periodId,
							p.YearFrom,
							p.YearTo,
							p.YearFrom + '' - '' + p.YearTo YearDescription,
							case 
								when ' + cast(@periodConfiguredId as varchar(max)) + '!= 0 And ' + cast(@periodConfiguredId as varchar(max)) + ' != pg.periodId then
									 (select case when count(*) = 0 then
												1
											else
												0
											end from PeriodGradeStudent x inner join Student y
												on x.studentId = y.studentId inner join PeriodGradeGroup z
												on x.periodGradeGroupId = z.periodGradeGroupId inner join PeriodGrade t
												on z.periodGradeId = t.periodGradeId
											where t.periodId = ' + cast(@periodConfiguredId as varchar(max)) + '
												and y.studentId = s.studentId
													and x.todate is null)
								else
									0					
							end IsReadyToNextYear
					from dbo.PeriodGradeStudent pgs inner join dbo.PeriodGradeGroup pgg
								on pgs.periodGradeGroupId = pgg.periodGradeGroupId inner join PeriodGrade pg
								on pgg.periodGradeId = pg.periodGradeid inner join Grade g
								on pg.gradeId = g.gradeId inner join Student s
								on pgs.studentId = s.studentId inner join Gender gen
								on s.genderId = gen.genderId inner join Period p
								on pg.periodId = p.periodId
							where pgs.todate is null) masterTable where 1=1 '


if (LEN(@studentCode)  > 0)
begin
	Set @sqlStatement = @sqlStatement + ' and masterTable.studentId= ' + convert(varchar(max),@studentCode)
end

if (@periodId != 0)
begin
	Set @sqlStatement = @sqlStatement + ' and masterTable.PeriodId= ' + convert(varchar(max),@periodId)
end

if (@gradeId != 0)
begin
	Set @sqlStatement = @sqlStatement + ' and masterTable.GradeId= ' + convert(varchar(max),@gradeId)
end

if (@genderId != 0)
begin
	Set @sqlStatement = @sqlStatement + ' and masterTable.GenderId= ' + convert(varchar(max),@genderId)
end

if (LEN(@firstName)  > 0)
begin
	Set @sqlStatement = @sqlStatement + ' and masterTable.FirstName like ''' + @firstName + '%'''
end

if (LEN(@lastName)  > 0)
begin
	Set @sqlStatement = @sqlStatement + ' and masterTable.LastName like ''' + @lastName + '%'''
end

Set @sqlStatement = @sqlStatement + ' Select * From (Select ROW_NUMBER() OVER (order by '+ @sortBy + ' '+ @sortOrder+') as RowNum,*,(select count(*) from #tempStudentSearch) TotalRecord from #tempStudentSearch) ReturnResult where RowNum between ' + cast(@pageIndex as varchar(max)) + ' AND ' + cast(@pageCount as varchar(max)) + ' if exists (select  * from tempdb.dbo.sysobjects o where o.xtype in (''U'') and o.id = object_id(N''tempdb..#tempStudentSearch''))DROP TABLE #tempStudentSearch'

exec (@sqlStatement)
--print @sqlStatement

--Select pgs.*,
--							pgg.periodGradeId,
--							g.gradeId,
--							g.gradeDescription,
--							s.firstName,
--							s.middleName,
--							s.lastName,
--							gen.*,
--							pg.periodId,
--							p.YearFrom,
--							p.YearTo,
--							p.YearFrom + ' - ' + p.YearTo YearDescription,
--							0 IsReadyToNextYear
--					from dbo.PeriodGradeStudent pgs inner join dbo.PeriodGradeGroup pgg
--								on pgs.periodGradeGroupId = pgg.periodGradeGroupId inner join PeriodGrade pg
--								on pgg.periodGradeId = pg.periodGradeid inner join Grade g
--								on pg.gradeId = g.gradeId inner join Student s
--								on pgs.studentId = s.studentId inner join Gender gen
--								on s.genderId = gen.genderId inner join Period p
--								on pg.periodId = p.periodId
--							where pgs.todate is null
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PeriodGrade_GetByPeriod]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PeriodGrade_GetByPeriod]
@periodId int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select pg.*,
			p.yearFrom,
			p.yearTo,
			p.active,
			g.gradeDescription
	From dbo.PeriodGrade pg inner join dbo.Period p
		on pg.periodId = p.periodId inner join dbo.Grade g
		on pg.gradeId = g.gradeId
	Where pg.periodid = @periodId
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Period_ReadyToAdd]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Period_ReadyToAdd]
	@periodIsReady bit output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select @periodIsReady = case
								when count(*)=0 then
										1
								else
										0
								end 
	From Period p inner join PeriodStatus ps
		on p.periodId = ps.periodId
	where ps.todate is null
		and ps.periodStatusTypeId in (1,2)
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Period_Insert]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Period_Insert]
	@periodId int output,
	@yearFrom	varchar(50),
	@yearTo	varchar(50)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Period(yearFrom,yearTo,active)Values(@yearFrom,@yearTo,0)
	Select @periodId = Scope_Identity()

	exec dbo.proc_PeriodStatus_Insert @periodId,1
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PeriodGradeGroup_Insert]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PeriodGradeGroup_Insert]
	@periodGradeGroupId int output,
	@periodGradeId int,
	@groupNumber varchar(10),
	@groupDescription varchar(50),
	@leaderId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[PeriodGradeGroup]
           ([periodGradeId]
           ,[groupDescription]
           ,[groupNumber]
           ,[leaderId])
     VALUES
           (@periodGradeId
           ,@groupDescription
           ,@groupNumber
           ,@leaderId)
           
     Select @periodGradeGroupId = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PeriodGradeGroup_GetByPeriodGradeId]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PeriodGradeGroup_GetByPeriodGradeId]
@periodGradeId int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select pg.*,
			p.yearFrom,
			p.yearTo,
			p.active,
			g.gradeDescription,
			pgg.groupDescription,
			pgg.periodGradeGroupId
	From dbo.PeriodGrade pg inner join dbo.Period p
		on pg.periodId = p.periodId inner join dbo.Grade g 
		on pg.gradeId = g.gradeId inner join dbo.PeriodGradeGroup pgg
		on pg.periodGradeId = pgg.periodGradeId
	Where pg.periodgradeid = @periodGradeId
END
GO
/****** Object:  Table [dbo].[PeriodGradeStudent]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodGradeStudent](
	[periodGradeStudentId] [int] IDENTITY(1,1) NOT NULL,
	[periodGradeGroupId] [int] NOT NULL,
	[studentId] [int] NOT NULL,
	[fromDate] [datetime] NOT NULL,
	[toDate] [datetime] NULL,
 CONSTRAINT [PK_PeriodGradeStudent] PRIMARY KEY CLUSTERED 
(
	[periodGradeStudentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PeriodGradeStudent] ON
INSERT [dbo].[PeriodGradeStudent] ([periodGradeStudentId], [periodGradeGroupId], [studentId], [fromDate], [toDate]) VALUES (1, 1, 1, CAST(0x0000A41300000000 AS DateTime), NULL)
INSERT [dbo].[PeriodGradeStudent] ([periodGradeStudentId], [periodGradeGroupId], [studentId], [fromDate], [toDate]) VALUES (2, 1, 2, CAST(0x0000A41300000000 AS DateTime), NULL)
INSERT [dbo].[PeriodGradeStudent] ([periodGradeStudentId], [periodGradeGroupId], [studentId], [fromDate], [toDate]) VALUES (3, 2, 3, CAST(0x0000A41300000000 AS DateTime), NULL)
INSERT [dbo].[PeriodGradeStudent] ([periodGradeStudentId], [periodGradeGroupId], [studentId], [fromDate], [toDate]) VALUES (4, 2, 4, CAST(0x0000A41300000000 AS DateTime), NULL)
INSERT [dbo].[PeriodGradeStudent] ([periodGradeStudentId], [periodGradeGroupId], [studentId], [fromDate], [toDate]) VALUES (5, 3, 7, CAST(0x0000A41300000000 AS DateTime), NULL)
INSERT [dbo].[PeriodGradeStudent] ([periodGradeStudentId], [periodGradeGroupId], [studentId], [fromDate], [toDate]) VALUES (7, 7, 12, CAST(0x0000A62700F47B3C AS DateTime), NULL)
INSERT [dbo].[PeriodGradeStudent] ([periodGradeStudentId], [periodGradeGroupId], [studentId], [fromDate], [toDate]) VALUES (8, 5, 13, CAST(0x0000A6270111D896 AS DateTime), NULL)
INSERT [dbo].[PeriodGradeStudent] ([periodGradeStudentId], [periodGradeGroupId], [studentId], [fromDate], [toDate]) VALUES (9, 3, 14, CAST(0x0000A62701130D77 AS DateTime), NULL)
INSERT [dbo].[PeriodGradeStudent] ([periodGradeStudentId], [periodGradeGroupId], [studentId], [fromDate], [toDate]) VALUES (10, 5, 15, CAST(0x0000A6270113BE0A AS DateTime), NULL)
INSERT [dbo].[PeriodGradeStudent] ([periodGradeStudentId], [periodGradeGroupId], [studentId], [fromDate], [toDate]) VALUES (11, 8, 19, CAST(0x0000A62800A78587 AS DateTime), NULL)
INSERT [dbo].[PeriodGradeStudent] ([periodGradeStudentId], [periodGradeGroupId], [studentId], [fromDate], [toDate]) VALUES (12, 7, 20, CAST(0x0000A62800A85F9D AS DateTime), NULL)
INSERT [dbo].[PeriodGradeStudent] ([periodGradeStudentId], [periodGradeGroupId], [studentId], [fromDate], [toDate]) VALUES (13, 7, 21, CAST(0x0000A62800A8EA05 AS DateTime), NULL)
INSERT [dbo].[PeriodGradeStudent] ([periodGradeStudentId], [periodGradeGroupId], [studentId], [fromDate], [toDate]) VALUES (14, 1, 22, CAST(0x0000A62800AA4F8B AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PeriodGradeStudent] OFF
/****** Object:  Table [dbo].[PeriodGradeStudentTranTypeConfiguration]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration](
	[periodGradeStudentTranTypeConfigurationId] [int] IDENTITY(1,1) NOT NULL,
	[periodGradeStudentId] [int] NOT NULL,
	[transactionTypeId] [int] NOT NULL,
	[payConfiguration] [money] NOT NULL,
	[fromDate] [datetime] NOT NULL,
	[toDate] [datetime] NULL,
	[runScheduleId] [int] NOT NULL,
 CONSTRAINT [PK_PeriodGradeStudentTranTypeConfiguration] PRIMARY KEY CLUSTERED 
(
	[periodGradeStudentTranTypeConfigurationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ON
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (4, 1, 1, 350.0000, CAST(0x0000A41300000000 AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (5, 1, 2, 150.0000, CAST(0x0000A41300000000 AS DateTime), NULL, 2)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (6, 1, 3, 20.0000, CAST(0x0000A41300000000 AS DateTime), NULL, 3)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (7, 5, 1, 350.0000, CAST(0x0000A41300000000 AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (8, 5, 2, 150.0000, CAST(0x0000A41300000000 AS DateTime), NULL, 2)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (9, 7, 1, 350.0000, CAST(0x0000A62700F48CBF AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (10, 7, 2, 150.0000, CAST(0x0000A62700F49E6A AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (11, 8, 1, 350.0000, CAST(0x0000A6270111D89F AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (12, 8, 2, 155.0000, CAST(0x0000A6270111D8A2 AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (13, 9, 1, 350.0000, CAST(0x0000A62701130D7B AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (14, 9, 2, 120.0000, CAST(0x0000A62701130D7F AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (15, 10, 1, 350.0000, CAST(0x0000A6270113BE0D AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (16, 10, 2, 55.0000, CAST(0x0000A6270113BE14 AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (17, 11, 1, 350.0000, CAST(0x0000A62800A78594 AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (18, 11, 2, 150.0000, CAST(0x0000A62800A78598 AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (19, 12, 1, 350.0000, CAST(0x0000A62800A85FA0 AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (20, 12, 2, 150.0000, CAST(0x0000A62800A85FA3 AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (21, 13, 1, 360.0000, CAST(0x0000A62800A8EA09 AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (22, 13, 2, 150.0000, CAST(0x0000A62800A8EA0D AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (23, 14, 1, 350.0000, CAST(0x0000A62800AA4F93 AS DateTime), NULL, 1)
INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId], [periodGradeStudentId], [transactionTypeId], [payConfiguration], [fromDate], [toDate], [runScheduleId]) VALUES (24, 14, 2, 100.0000, CAST(0x0000A62800AA4F96 AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[PeriodGradeStudentTranTypeConfiguration] OFF
/****** Object:  StoredProcedure [dbo].[proc_PeriodGradeStudent_Insert]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PeriodGradeStudent_Insert]
	@periodGradeStudentId int output,
	@periodGradeGroupId int,
	@studentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[PeriodGradeStudent]
           ([periodGradeGroupId]
           ,[studentId]
           ,[fromDate]
           ,[toDate])
     VALUES
           (@periodGradeGroupId
           ,@studentId
           ,GETDATE()
           ,null)
           
     Select @periodGradeStudentId = SCOPE_IDENTITY()   
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Period_StudentSummaryByPeriod]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Period_StudentSummaryByPeriod]
	--@periodId int
AS
BEGIN
	Select 'Period '+cast(yearFrom as varchar(4)) + ' - ' + Cast(yearTo as varchar(4)) periodYear,
			count(info.studentId) studentCountByYear,
		p.periodId
 from Period p left outer join
	(Select pg.periodGradeId,pg.periodId,
			 s.studentId
			 from dbo.PeriodGradeStudent pgs inner join dbo.PeriodGradeGroup pgg
				on pgs.periodGradeGroupId = pgg.periodGradeGroupId inner join PeriodGrade pg
				on pgg.periodGradeId = pg.periodGradeid inner join Grade g
				on pg.gradeId = g.gradeId inner join Student s
				on pgs.studentId = s.studentId inner join Gender gen
				on s.genderId = gen.genderId
			--where pg.PeriodId = @periodId			
				and pgs.todate is null)info
	on p.periodId = info.periodId
Group by yearFrom,yearTo,p.periodId
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Grade_StudentSummaryByPeriod]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Grade_StudentSummaryByPeriod]
	@periodId int
AS
BEGIN
	Select g.gradeDescription,g.gradeId,count(info.gradeId) studentCountByGrade
from Grade g left outer join 
		(Select pg.gradeId from dbo.PeriodGradeStudent pgs inner join dbo.PeriodGradeGroup pgg
				on pgs.periodGradeGroupId = pgg.periodGradeGroupId inner join PeriodGrade pg
				on pgg.periodGradeId = pg.periodGradeid 
			where pg.PeriodId = @periodId
				and pgs.todate is null) info
	on g.gradeId = info.gradeId
	group by g.gradeDescription,g.gradeId
	order by g.gradeId
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Grade_StudentSummaryByGroup]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_Grade_StudentSummaryByGroup] 
	@periodId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select g.gradeDescription,pgg.groupNumber,count(pgs.periodGradeStudentId) studentCount
			 from dbo.PeriodGradeGroup pgg inner join PeriodGrade pg
			 on pgg.periodGradeId = pg.periodGradeId inner join Grade g
			 on pg.gradeId = g.gradeId left outer join dbo.PeriodGradeStudent pgs
			on pgg.periodGradeGroupId = pgs.periodGradeGroupId
		where pg.periodId = 4
				and pgs.toDate is null
	Group by 	g.gradeDescription,
				pgg.groupNumber
order by gradeDescription
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Grade_GetGroups]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_Grade_GetGroups]
	@periodGradeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select pgg.*,users.*,count(pgs.periodGradeStudentId) studentCount
			 from dbo.PeriodGradeGroup pgg left outer join (Select u.userId,u.userFullName, ur.userRoleId from UserRole ur inner join [User] u
																on ur.userId = u.userId
																	where ur.todate is null)users
		
		on pgg.leaderId = users.userRoleId left outer join dbo.PeriodGradeStudent pgs
			on pgg.periodGradeGroupId = pgs.periodGradeGroupId
		where periodGradeId = @periodGradeId
				and pgs.toDate is null
	Group by pgg.periodGradeGroupId,
			pgg.periodGradeId,
			pgg.groupDescription,
				pgg.groupNumber,
				pgg.leaderId,
				users.userId,
				users.userFullName,
				users.userRoleId
				
				
			
			
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PeriodGradeStudentTranTypeConfiguration_Insert]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_PeriodGradeStudentTranTypeConfiguration_Insert]
	@periodGradeStudentTranTypeConfigurationId int output,
	@periodGradeStudentId int,
	@transactionTypeId int,
	@payConfiguration money
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[PeriodGradeStudentTranTypeConfiguration]
           ([periodGradeStudentId]
           ,[transactionTypeId]
           ,[payConfiguration]
           ,[fromDate]
           ,[toDate]
           ,[runScheduleId])
     VALUES
           (@periodGradeStudentId
           ,@transactionTypeId
           ,@payConfiguration
           ,GETDATE()
           ,null
           ,1)
END
GO
/****** Object:  Table [dbo].[StudentPayTransaction]    Script Date: 06/29/2016 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentPayTransaction](
	[studentPayTransactionId] [int] IDENTITY(1,1) NOT NULL,
	[periodGradeStudentTranTypeConfigurationId] [int] NOT NULL,
	[transactionDate] [datetime] NOT NULL,
	[studentPayTransactionDescription] [varchar](200) NOT NULL,
 CONSTRAINT [PK_StudentPayTransaction] PRIMARY KEY CLUSTERED 
(
	[studentPayTransactionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[StudentPayTransaction] ON
INSERT [dbo].[StudentPayTransaction] ([studentPayTransactionId], [periodGradeStudentTranTypeConfigurationId], [transactionDate], [studentPayTransactionDescription]) VALUES (2, 8, CAST(0x0000A61800000000 AS DateTime), N'June Monthly payment')
SET IDENTITY_INSERT [dbo].[StudentPayTransaction] OFF
/****** Object:  Table [dbo].[PayTransaction]    Script Date: 06/29/2016 16:54:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayTransaction](
	[payTransactionId] [int] IDENTITY(1,1) NOT NULL,
	[studentPayTransactionId] [int] NOT NULL,
	[payAmount] [money] NOT NULL,
	[payDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PayTransaction] PRIMARY KEY CLUSTERED 
(
	[payTransactionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PayTransaction] ON
INSERT [dbo].[PayTransaction] ([payTransactionId], [studentPayTransactionId], [payAmount], [payDate]) VALUES (1, 2, 50.0000, CAST(0x0000A61900000000 AS DateTime))
INSERT [dbo].[PayTransaction] ([payTransactionId], [studentPayTransactionId], [payAmount], [payDate]) VALUES (2, 2, 40.0000, CAST(0x0000A61900000000 AS DateTime))
INSERT [dbo].[PayTransaction] ([payTransactionId], [studentPayTransactionId], [payAmount], [payDate]) VALUES (7, 2, 1.0000, CAST(0x0000A62001104528 AS DateTime))
INSERT [dbo].[PayTransaction] ([payTransactionId], [studentPayTransactionId], [payAmount], [payDate]) VALUES (8, 2, 2.0000, CAST(0x0000A62001106647 AS DateTime))
INSERT [dbo].[PayTransaction] ([payTransactionId], [studentPayTransactionId], [payAmount], [payDate]) VALUES (9, 2, 2.0000, CAST(0x0000A6200110FA38 AS DateTime))
INSERT [dbo].[PayTransaction] ([payTransactionId], [studentPayTransactionId], [payAmount], [payDate]) VALUES (10, 2, 1.0000, CAST(0x0000A620011163ED AS DateTime))
INSERT [dbo].[PayTransaction] ([payTransactionId], [studentPayTransactionId], [payAmount], [payDate]) VALUES (11, 2, 1.0000, CAST(0x0000A62001120AD6 AS DateTime))
INSERT [dbo].[PayTransaction] ([payTransactionId], [studentPayTransactionId], [payAmount], [payDate]) VALUES (12, 2, 2.0000, CAST(0x0000A620011323F6 AS DateTime))
INSERT [dbo].[PayTransaction] ([payTransactionId], [studentPayTransactionId], [payAmount], [payDate]) VALUES (13, 2, 2.0000, CAST(0x0000A620011375BF AS DateTime))
INSERT [dbo].[PayTransaction] ([payTransactionId], [studentPayTransactionId], [payAmount], [payDate]) VALUES (14, 2, 3.0000, CAST(0x0000A6200113A290 AS DateTime))
INSERT [dbo].[PayTransaction] ([payTransactionId], [studentPayTransactionId], [payAmount], [payDate]) VALUES (15, 2, 20.3000, CAST(0x0000A6200113CC4B AS DateTime))
INSERT [dbo].[PayTransaction] ([payTransactionId], [studentPayTransactionId], [payAmount], [payDate]) VALUES (17, 2, 10.2000, CAST(0x0000A62001166466 AS DateTime))
INSERT [dbo].[PayTransaction] ([payTransactionId], [studentPayTransactionId], [payAmount], [payDate]) VALUES (18, 2, 2.0000, CAST(0x0000A62800FFC092 AS DateTime))
SET IDENTITY_INSERT [dbo].[PayTransaction] OFF
/****** Object:  Table [dbo].[StudentPayTransactionStatus]    Script Date: 06/29/2016 16:54:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPayTransactionStatus](
	[studentPayTransactionStatusId] [int] IDENTITY(1,1) NOT NULL,
	[studentPayTransactionId] [int] NOT NULL,
	[payTransactionStatusTypeId] [int] NOT NULL,
	[fromDate] [datetime] NOT NULL,
	[toDate] [datetime] NULL,
 CONSTRAINT [PK_StudentPayTransactionStatus] PRIMARY KEY CLUSTERED 
(
	[studentPayTransactionStatusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[StudentPayTransactionStatus] ON
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (1, 2, 1, CAST(0x0000A61800000000 AS DateTime), CAST(0x0000A61800000000 AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (2, 2, 2, CAST(0x0000A61800000000 AS DateTime), CAST(0x0000A62000FDD132 AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (3, 2, 2, CAST(0x0000A62000FDD132 AS DateTime), CAST(0x0000A62000FE5E85 AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (4, 2, 2, CAST(0x0000A62000FE5E85 AS DateTime), CAST(0x0000A620010F1344 AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (6, 2, 2, CAST(0x0000A620010F1344 AS DateTime), CAST(0x0000A6200110452C AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (7, 2, 2, CAST(0x0000A6200110452C AS DateTime), CAST(0x0000A62001106647 AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (8, 2, 2, CAST(0x0000A62001106647 AS DateTime), CAST(0x0000A6200110FA5B AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (9, 2, 2, CAST(0x0000A6200110FA59 AS DateTime), CAST(0x0000A620011163F1 AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (10, 2, 2, CAST(0x0000A620011163F1 AS DateTime), CAST(0x0000A62001120AD6 AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (11, 2, 2, CAST(0x0000A62001120AD6 AS DateTime), CAST(0x0000A620011323F6 AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (12, 2, 2, CAST(0x0000A620011323F6 AS DateTime), CAST(0x0000A620011375BF AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (13, 2, 2, CAST(0x0000A620011375BF AS DateTime), CAST(0x0000A6200113A293 AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (14, 2, 2, CAST(0x0000A6200113A290 AS DateTime), CAST(0x0000A6200113CC57 AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (15, 2, 2, CAST(0x0000A6200113CC57 AS DateTime), CAST(0x0000A62001166466 AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (17, 2, 2, CAST(0x0000A62001166466 AS DateTime), CAST(0x0000A62800FFC092 AS DateTime))
INSERT [dbo].[StudentPayTransactionStatus] ([studentPayTransactionStatusId], [studentPayTransactionId], [payTransactionStatusTypeId], [fromDate], [toDate]) VALUES (18, 2, 2, CAST(0x0000A62800FFC092 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[StudentPayTransactionStatus] OFF
/****** Object:  StoredProcedure [dbo].[proc_Student_PaymentAvailable]    Script Date: 06/29/2016 16:54:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_Student_PaymentAvailable]
	@periodGradeStudentId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select payConfiguration,
			payAmount, 
			payConfiguration - payAmount remaining,
			spt.periodGradeStudentTranTypeConfigurationId,
			spt.studentPayTransactionDescription,
			spt.studentPayTransactionId,
			spt.transactionDate,
			pgs.periodGradeStudentId  
	
	from dbo.PeriodGradeStudent pgs inner join dbo.PeriodGradeStudentTranTypeConfiguration pgstc
		on pgs.periodGradeStudentId = pgstc.periodGradeStudentId inner join dbo.StudentPayTransaction spt
		on pgstc.periodGradeStudentTranTypeConfigurationId = spt.periodGradeStudentTranTypeConfigurationId inner join dbo.StudentPayTransactionStatus spts
		on spt.studentPayTransactionId = spts.studentPayTransactionId inner join dbo.PayTransactionStatusType ptst
		on spts.payTransactionStatusTypeId = ptst.payTransactionStatusTypeId left outer join (Select studentPayTransactionId ,sum(payAmount)payAmount from dbo.PayTransaction group by studentPayTransactionId) pt
		on spt.studentPayTransactionId = pt.studentPayTransactionId
Where pgs.periodGradeStudentId = @periodGradeStudentId -- 5
	and spts.payTransactionStatusTypeId in  (1,2) -- Ready to pay
	and spts.toDate is null
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PayTransaction_SubmitPay]    Script Date: 06/29/2016 16:54:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_PayTransaction_SubmitPay] 
	@studentPayTransactionId int,
	@paymentAmount money,
	@balance money,
	@submitById int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @payTransactionStatusTypeId int
	Declare @studentPayTransactionStatusId int
	
    -- Insert statements for procedure here
	Insert into dbo.PayTransaction(studentPayTransactionId,payAmount,payDate)Values(@studentPayTransactionId,@paymentAmount,GETDATE())
	
	if (@balance != @paymentAmount)
	begin
		Set @payTransactionStatusTypeId = 2
	end
	else
	begin
		Set @payTransactionStatusTypeId = 3
	end
	
	Insert into dbo.StudentPayTransactionStatus(studentPayTransactionId,payTransactionStatusTypeId,fromDate,toDate)Values
	(@studentPayTransactionId,@payTransactionStatusTypeId,GETDATE(),null)
	Select @studentPayTransactionStatusId = SCOPE_IDENTITY()
	
	Update StudentPayTransactionStatus
		Set toDate = GETDATE()
	Where studentPayTransactionId = @studentPayTransactionId
		and toDate is null
			and studentPayTransactionStatusId != @studentPayTransactionStatusId
	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PayTransaction_GetAllByStudent]    Script Date: 06/29/2016 16:54:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_PayTransaction_GetAllByStudent]
	-- Add the parameters for the stored procedure here
	@studentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select 
			cast(p.yearFrom as char(4)) +  ' - ' + cast(p.yearTo as char(4)) PeriodYear,
			pgstc.payConfiguration,
			sum(pt.payAmount) TotalAmount,			
			spt.studentPayTransactionDescription,
			pgstc.periodGradeStudentId,
			rs.runScheduleDescription,
			pgstc.payConfiguration - SUM(pt.payAmount) restante,
			ptst.payTransactionStatusTypeDescription,
			tt.transactionTypeDescription
	 from dbo.PayTransaction pt inner join dbo.StudentPayTransaction spt
		on pt.studentPayTransactionId = spt.studentPayTransactionId inner join PeriodGradeStudentTranTypeConfiguration pgstc
		on spt.periodGradeStudentTranTypeConfigurationId = pgstc.periodGradeStudentTranTypeConfigurationId inner join PeriodGradeStudent pgs
		on pgstc.periodGradeStudentId = pgs.periodGradeStudentId inner join PeriodGradeGroup pgg
		on pgs.periodGradeGroupId = pgg.periodGradeGroupId inner join PeriodGrade pg
		on pgg.periodGradeId = pg.periodGradeId inner join Period p
		on pg.periodId = p.periodId inner join dbo.RunSchedule rs
		on pgstc.runScheduleId = rs.runScheduleId inner join dbo.StudentPayTransactionStatus spts
		on spt.studentPayTransactionId = spts.studentPayTransactionId inner join dbo.PayTransactionStatusType ptst
		on spts.payTransactionStatusTypeId = ptst.payTransactionStatusTypeId inner join TransactionType tt
		on pgstc.transactionTypeId = tt.transactionTypeId		
where pgs.studentId = 7
	and spts.toDate is null
group by pgstc.payConfiguration,
			spt.studentPayTransactionDescription,
			pgstc.periodGradeStudentId,p.yearFrom,p.yearTo,
			rs.runScheduleDescription,
			ptst.payTransactionStatusTypeDescription,
			tt.transactionTypeDescription
END
GO
/****** Object:  StoredProcedure [dbo].[proc_PayTransaction_GetAll]    Script Date: 06/29/2016 16:54:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_PayTransaction_GetAll]
	-- Add the parameters for the stored procedure here
	@periodGradeStudentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select pt.payTransactionId,
			pt.payAmount,
			pt.payDate,
			spt.studentPayTransactionDescription
	 from dbo.PayTransaction pt inner join dbo.StudentPayTransaction spt
		on pt.studentPayTransactionId = spt.studentPayTransactionId inner join PeriodGradeStudentTranTypeConfiguration pgstc
		on spt.periodGradeStudentTranTypeConfigurationId = pgstc.periodGradeStudentTranTypeConfigurationId
	where pgstc.periodGradeStudentId = @periodGradeStudentId
	order by 1 desc
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Grade_ExpenceSummaryByPeriod]    Script Date: 06/29/2016 16:54:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_Grade_ExpenceSummaryByPeriod]
	@periodId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select g.gradeDescription,g.gradeId,isnull(summary.payAmount,0)payAmount from Grade g left outer join (
								Select pg.gradeId,SUM(pt.payAmount) payAmount  from dbo.PeriodGradeStudent pgs inner join dbo.PeriodGradeStudentTranTypeConfiguration pgstc
										on pgs.periodGradeStudentId = pgstc.periodGradeStudentId inner join dbo.StudentPayTransaction spt
										on pgstc.periodGradeStudentTranTypeConfigurationId = spt.periodGradeStudentTranTypeConfigurationId inner join dbo.StudentPayTransactionStatus spts
										on spt.studentPayTransactionId = spts.studentPayTransactionId inner join dbo.PayTransactionStatusType ptst
										on spts.payTransactionStatusTypeId = ptst.payTransactionStatusTypeId left outer join (Select studentPayTransactionId ,sum(payAmount)payAmount from dbo.PayTransaction group by studentPayTransactionId) pt
										on spt.studentPayTransactionId = pt.studentPayTransactionId inner join PeriodGradeGroup pgg
										on pgs.periodGradeGroupId = pgg.periodGradeGroupId inner join PeriodGrade pg
										on pgg.periodGradeId = pg.periodGradeId
								Where pg.periodId = 4
									and spts.payTransactionStatusTypeId in  (1,2) -- Ready to pay
									and spts.toDate is null
								group by pg.gradeId) summary
	on g.gradeId = summary.gradeId
END
GO
/****** Object:  ForeignKey [FK_UserRole_Role]    Script Date: 06/29/2016 16:54:39 ******/
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
/****** Object:  ForeignKey [FK_UserRole_User]    Script Date: 06/29/2016 16:54:39 ******/
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
/****** Object:  ForeignKey [FK_Student_City]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_City] FOREIGN KEY([cityId])
REFERENCES [dbo].[City] ([cityId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_City]
GO
/****** Object:  ForeignKey [FK_Student_Gender]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Gender] FOREIGN KEY([genderId])
REFERENCES [dbo].[Gender] ([genderId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Gender]
GO
/****** Object:  ForeignKey [FK_PeriodStatus_Period]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodStatus]  WITH CHECK ADD  CONSTRAINT [FK_PeriodStatus_Period] FOREIGN KEY([periodId])
REFERENCES [dbo].[Period] ([periodId])
GO
ALTER TABLE [dbo].[PeriodStatus] CHECK CONSTRAINT [FK_PeriodStatus_Period]
GO
/****** Object:  ForeignKey [FK_PeriodGrade_Grade]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGrade]  WITH CHECK ADD  CONSTRAINT [FK_PeriodGrade_Grade] FOREIGN KEY([gradeId])
REFERENCES [dbo].[Grade] ([gradeId])
GO
ALTER TABLE [dbo].[PeriodGrade] CHECK CONSTRAINT [FK_PeriodGrade_Grade]
GO
/****** Object:  ForeignKey [FK_PeriodGrade_Period]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGrade]  WITH CHECK ADD  CONSTRAINT [FK_PeriodGrade_Period] FOREIGN KEY([periodId])
REFERENCES [dbo].[Period] ([periodId])
GO
ALTER TABLE [dbo].[PeriodGrade] CHECK CONSTRAINT [FK_PeriodGrade_Period]
GO
/****** Object:  ForeignKey [FK_PeriodGradeGroup_PeriodGrade]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeGroup]  WITH CHECK ADD  CONSTRAINT [FK_PeriodGradeGroup_PeriodGrade] FOREIGN KEY([periodGradeId])
REFERENCES [dbo].[PeriodGrade] ([periodGradeId])
GO
ALTER TABLE [dbo].[PeriodGradeGroup] CHECK CONSTRAINT [FK_PeriodGradeGroup_PeriodGrade]
GO
/****** Object:  ForeignKey [FK_PeriodGradeStudent_PeriodGradeGroup]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeStudent]  WITH CHECK ADD  CONSTRAINT [FK_PeriodGradeStudent_PeriodGradeGroup] FOREIGN KEY([periodGradeGroupId])
REFERENCES [dbo].[PeriodGradeGroup] ([periodGradeGroupId])
GO
ALTER TABLE [dbo].[PeriodGradeStudent] CHECK CONSTRAINT [FK_PeriodGradeStudent_PeriodGradeGroup]
GO
/****** Object:  ForeignKey [FK_PeriodGradeStudent_Student]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeStudent]  WITH CHECK ADD  CONSTRAINT [FK_PeriodGradeStudent_Student] FOREIGN KEY([studentId])
REFERENCES [dbo].[Student] ([studentId])
GO
ALTER TABLE [dbo].[PeriodGradeStudent] CHECK CONSTRAINT [FK_PeriodGradeStudent_Student]
GO
/****** Object:  ForeignKey [FK_PeriodGradeStudentTranTypeConfiguration_PeriodGradeStudent]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_PeriodGradeStudentTranTypeConfiguration_PeriodGradeStudent] FOREIGN KEY([periodGradeStudentId])
REFERENCES [dbo].[PeriodGradeStudent] ([periodGradeStudentId])
GO
ALTER TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration] CHECK CONSTRAINT [FK_PeriodGradeStudentTranTypeConfiguration_PeriodGradeStudent]
GO
/****** Object:  ForeignKey [FK_PeriodGradeStudentTranTypeConfiguration_RunSchedule]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_PeriodGradeStudentTranTypeConfiguration_RunSchedule] FOREIGN KEY([runScheduleId])
REFERENCES [dbo].[RunSchedule] ([runScheduleId])
GO
ALTER TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration] CHECK CONSTRAINT [FK_PeriodGradeStudentTranTypeConfiguration_RunSchedule]
GO
/****** Object:  ForeignKey [FK_PeriodGradeStudentTranTypeConfiguration_TransactionType]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_PeriodGradeStudentTranTypeConfiguration_TransactionType] FOREIGN KEY([transactionTypeId])
REFERENCES [dbo].[TransactionType] ([transactionTypeId])
GO
ALTER TABLE [dbo].[PeriodGradeStudentTranTypeConfiguration] CHECK CONSTRAINT [FK_PeriodGradeStudentTranTypeConfiguration_TransactionType]
GO
/****** Object:  ForeignKey [FK_StudentPayTransaction_PeriodGradeStudentTranTypeConfiguration]    Script Date: 06/29/2016 16:54:40 ******/
ALTER TABLE [dbo].[StudentPayTransaction]  WITH CHECK ADD  CONSTRAINT [FK_StudentPayTransaction_PeriodGradeStudentTranTypeConfiguration] FOREIGN KEY([periodGradeStudentTranTypeConfigurationId])
REFERENCES [dbo].[PeriodGradeStudentTranTypeConfiguration] ([periodGradeStudentTranTypeConfigurationId])
GO
ALTER TABLE [dbo].[StudentPayTransaction] CHECK CONSTRAINT [FK_StudentPayTransaction_PeriodGradeStudentTranTypeConfiguration]
GO
/****** Object:  ForeignKey [FK_PayTransaction_StudentPayTransaction]    Script Date: 06/29/2016 16:54:41 ******/
ALTER TABLE [dbo].[PayTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PayTransaction_StudentPayTransaction] FOREIGN KEY([studentPayTransactionId])
REFERENCES [dbo].[StudentPayTransaction] ([studentPayTransactionId])
GO
ALTER TABLE [dbo].[PayTransaction] CHECK CONSTRAINT [FK_PayTransaction_StudentPayTransaction]
GO
/****** Object:  ForeignKey [FK_StudentPayTransactionStatus_PayTransactionStatusType]    Script Date: 06/29/2016 16:54:41 ******/
ALTER TABLE [dbo].[StudentPayTransactionStatus]  WITH CHECK ADD  CONSTRAINT [FK_StudentPayTransactionStatus_PayTransactionStatusType] FOREIGN KEY([payTransactionStatusTypeId])
REFERENCES [dbo].[PayTransactionStatusType] ([payTransactionStatusTypeId])
GO
ALTER TABLE [dbo].[StudentPayTransactionStatus] CHECK CONSTRAINT [FK_StudentPayTransactionStatus_PayTransactionStatusType]
GO
/****** Object:  ForeignKey [FK_StudentPayTransactionStatus_StudentPayTransaction]    Script Date: 06/29/2016 16:54:41 ******/
ALTER TABLE [dbo].[StudentPayTransactionStatus]  WITH CHECK ADD  CONSTRAINT [FK_StudentPayTransactionStatus_StudentPayTransaction] FOREIGN KEY([studentPayTransactionId])
REFERENCES [dbo].[StudentPayTransaction] ([studentPayTransactionId])
GO
ALTER TABLE [dbo].[StudentPayTransactionStatus] CHECK CONSTRAINT [FK_StudentPayTransactionStatus_StudentPayTransaction]
GO
