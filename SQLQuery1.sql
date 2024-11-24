USE [master]
GO
/****** Object:  Database [Course]    Script Date: 11/24/2024 12:07:28 PM ******/
CREATE DATABASE [Course]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Course', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Course.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Course_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Course_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Course] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Course].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Course] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Course] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Course] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Course] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Course] SET ARITHABORT OFF 
GO
ALTER DATABASE [Course] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Course] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Course] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Course] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Course] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Course] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Course] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Course] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Course] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Course] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Course] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Course] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Course] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Course] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Course] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Course] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Course] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Course] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Course] SET  MULTI_USER 
GO
ALTER DATABASE [Course] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Course] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Course] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Course] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Course] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Course] SET QUERY_STORE = OFF
GO
USE [Course]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Course]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 11/24/2024 12:07:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[courseYear] [date] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 11/24/2024 12:07:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](100) NOT NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 11/24/2024 12:07:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](100) NOT NULL,
	[isActive] [bit] NULL,
	[semesterId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 11/24/2024 12:07:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[num] [int] NOT NULL,
	[isActive] [bit] NULL,
	[semesterYear] [date] NULL,
	[courseId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 11/24/2024 12:07:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](100) NOT NULL,
	[subName] [varchar](500) NULL,
	[subDesc] [varchar](max) NULL,
	[createDate] [date] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 11/24/2024 12:07:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tmDay] [varchar](50) NULL,
	[tmTime] [varchar](50) NULL,
	[startDateTime] [datetime] NULL,
	[endDateTime] [datetime] NULL,
	[roomId] [int] NULL,
	[sectionId] [int] NULL,
	[isActive] [bit] NULL,
	[subjectId] [int] NULL,
	[createDateTime] [datetime] NULL,
	[updateDateTime] [datetime] NULL,
	[createdBy] [int] NULL,
	[updatedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 11/24/2024 12:07:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](500) NULL,
	[shortName] [varchar](30) NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/24/2024 12:07:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[initials] [varchar](100) NOT NULL,
	[userName] [varchar](500) NOT NULL,
	[isActive] [bit] NULL,
	[roleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 
GO
INSERT [dbo].[Course] ([id], [name], [courseYear], [isActive]) VALUES (1, N'MCA', CAST(N'2024-06-12' AS Date), 1)
GO
INSERT [dbo].[Course] ([id], [name], [courseYear], [isActive]) VALUES (2, N'BCA', CAST(N'2024-06-12' AS Date), 1)
GO
INSERT [dbo].[Course] ([id], [name], [courseYear], [isActive]) VALUES (3, N'Btech', CAST(N'2024-06-17' AS Date), 1)
GO
INSERT [dbo].[Course] ([id], [name], [courseYear], [isActive]) VALUES (4, N'Test', CAST(N'2024-06-17' AS Date), 0)
GO
INSERT [dbo].[Course] ([id], [name], [courseYear], [isActive]) VALUES (5, N'MBA', CAST(N'2024-06-18' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 
GO
INSERT [dbo].[Rooms] ([id], [code], [isActive]) VALUES (1, N'A210', 0)
GO
INSERT [dbo].[Rooms] ([id], [code], [isActive]) VALUES (2, N'A211', 0)
GO
INSERT [dbo].[Rooms] ([id], [code], [isActive]) VALUES (3, N'A212', 0)
GO
INSERT [dbo].[Rooms] ([id], [code], [isActive]) VALUES (4, N'A213', 0)
GO
INSERT [dbo].[Rooms] ([id], [code], [isActive]) VALUES (5, N'A214', 0)
GO
INSERT [dbo].[Rooms] ([id], [code], [isActive]) VALUES (6, N'A215', 0)
GO
INSERT [dbo].[Rooms] ([id], [code], [isActive]) VALUES (7, N'Test', 0)
GO
INSERT [dbo].[Rooms] ([id], [code], [isActive]) VALUES (8, N'Test', 0)
GO
INSERT [dbo].[Rooms] ([id], [code], [isActive]) VALUES (9, N'test', 0)
GO
INSERT [dbo].[Rooms] ([id], [code], [isActive]) VALUES (10, N'-----------', 0)
GO
INSERT [dbo].[Rooms] ([id], [code], [isActive]) VALUES (11, N'A-210', 0)
GO
INSERT [dbo].[Rooms] ([id], [code], [isActive]) VALUES (12, N'C-309', 1)
GO
INSERT [dbo].[Rooms] ([id], [code], [isActive]) VALUES (13, N'C-310', 1)
GO
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Section] ON 
GO
INSERT [dbo].[Section] ([id], [code], [isActive], [semesterId]) VALUES (1, N'A', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[Semester] ON 
GO
INSERT [dbo].[Semester] ([id], [num], [isActive], [semesterYear], [courseId]) VALUES (1, 1, 1, CAST(N'2024-06-12' AS Date), 1)
GO
INSERT [dbo].[Semester] ([id], [num], [isActive], [semesterYear], [courseId]) VALUES (2, 2, 1, CAST(N'2024-06-12' AS Date), 1)
GO
INSERT [dbo].[Semester] ([id], [num], [isActive], [semesterYear], [courseId]) VALUES (3, 2, 1, CAST(N'2024-06-12' AS Date), 2)
GO
INSERT [dbo].[Semester] ([id], [num], [isActive], [semesterYear], [courseId]) VALUES (4, 1, 1, CAST(N'2024-06-12' AS Date), 2)
GO
INSERT [dbo].[Semester] ([id], [num], [isActive], [semesterYear], [courseId]) VALUES (5, 3, 0, CAST(N'2024-06-17' AS Date), 3)
GO
INSERT [dbo].[Semester] ([id], [num], [isActive], [semesterYear], [courseId]) VALUES (6, 1, 0, CAST(N'2024-06-18' AS Date), 3)
GO
INSERT [dbo].[Semester] ([id], [num], [isActive], [semesterYear], [courseId]) VALUES (7, 1, 1, CAST(N'2024-06-18' AS Date), 5)
GO
INSERT [dbo].[Semester] ([id], [num], [isActive], [semesterYear], [courseId]) VALUES (8, 2, 1, CAST(N'2024-06-18' AS Date), 5)
GO
INSERT [dbo].[Semester] ([id], [num], [isActive], [semesterYear], [courseId]) VALUES (9, 3, 1, CAST(N'2024-06-18' AS Date), 5)
GO
INSERT [dbo].[Semester] ([id], [num], [isActive], [semesterYear], [courseId]) VALUES (10, 4, 0, CAST(N'2024-06-18' AS Date), 5)
GO
INSERT [dbo].[Semester] ([id], [num], [isActive], [semesterYear], [courseId]) VALUES (11, 4, 1, CAST(N'2024-09-10' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Semester] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 
GO
INSERT [dbo].[Subjects] ([id], [code], [subName], [subDesc], [createDate], [isActive]) VALUES (1, N'KCA-035', N'SQE', N'NA', CAST(N'2024-06-12' AS Date), 0)
GO
INSERT [dbo].[Subjects] ([id], [code], [subName], [subDesc], [createDate], [isActive]) VALUES (2, N'KCA-043', N'IOT', N'NA', CAST(N'2024-06-12' AS Date), 0)
GO
INSERT [dbo].[Subjects] ([id], [code], [subName], [subDesc], [createDate], [isActive]) VALUES (3, N'KCA-051', N'MoC', N'NA', CAST(N'2024-06-12' AS Date), 0)
GO
INSERT [dbo].[Subjects] ([id], [code], [subName], [subDesc], [createDate], [isActive]) VALUES (4, N'KCA-111', N'CN', N'Computer Network', CAST(N'2024-06-17' AS Date), 0)
GO
INSERT [dbo].[Subjects] ([id], [code], [subName], [subDesc], [createDate], [isActive]) VALUES (5, N'LUNCH', N'LUNCH', N'LUNCH', CAST(N'2024-06-17' AS Date), 0)
GO
INSERT [dbo].[Subjects] ([id], [code], [subName], [subDesc], [createDate], [isActive]) VALUES (6, N'KCA 054', N'ML', N'NA', CAST(N'2024-06-17' AS Date), 0)
GO
INSERT [dbo].[Subjects] ([id], [code], [subName], [subDesc], [createDate], [isActive]) VALUES (7, N'KCA-035', N'SQE', N'NA', CAST(N'2024-06-17' AS Date), 1)
GO
INSERT [dbo].[Subjects] ([id], [code], [subName], [subDesc], [createDate], [isActive]) VALUES (8, N'KCA-043', N'IOT', N'NA', CAST(N'2024-06-17' AS Date), 1)
GO
INSERT [dbo].[Subjects] ([id], [code], [subName], [subDesc], [createDate], [isActive]) VALUES (9, N'KCA-051', N'MoC', N'NA', CAST(N'2024-06-17' AS Date), 1)
GO
INSERT [dbo].[Subjects] ([id], [code], [subName], [subDesc], [createDate], [isActive]) VALUES (10, N'KCA-054', N'ML', N'NA', CAST(N'2024-06-17' AS Date), 1)
GO
INSERT [dbo].[Subjects] ([id], [code], [subName], [subDesc], [createDate], [isActive]) VALUES (11, N'na', N'LUNCH', N'na', CAST(N'2024-06-17' AS Date), 0)
GO
INSERT [dbo].[Subjects] ([id], [code], [subName], [subDesc], [createDate], [isActive]) VALUES (12, N'LUNCH', N'LUNCH', N'LUNCH', CAST(N'2024-06-17' AS Date), 1)
GO
INSERT [dbo].[Subjects] ([id], [code], [subName], [subDesc], [createDate], [isActive]) VALUES (13, N'KCA-035', N'ML', N'Machine learning', CAST(N'2024-06-17' AS Date), 0)
GO
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Timetable] ON 
GO
INSERT [dbo].[Timetable] ([id], [tmDay], [tmTime], [startDateTime], [endDateTime], [roomId], [sectionId], [isActive], [subjectId], [createDateTime], [updateDateTime], [createdBy], [updatedBy]) VALUES (1, N'Mon', NULL, CAST(N'2024-06-17T21:03:00.000' AS DateTime), CAST(N'2024-06-17T22:03:00.000' AS DateTime), 13, 1, 1, 13, CAST(N'2024-06-17T21:03:36.770' AS DateTime), NULL, 11, NULL)
GO
INSERT [dbo].[Timetable] ([id], [tmDay], [tmTime], [startDateTime], [endDateTime], [roomId], [sectionId], [isActive], [subjectId], [createDateTime], [updateDateTime], [createdBy], [updatedBy]) VALUES (2, N'Mon', NULL, CAST(N'2024-06-17T23:00:00.000' AS DateTime), CAST(N'2024-06-18T00:00:00.000' AS DateTime), 12, 1, 0, 10, CAST(N'2024-06-17T23:05:54.333' AS DateTime), NULL, 11, NULL)
GO
INSERT [dbo].[Timetable] ([id], [tmDay], [tmTime], [startDateTime], [endDateTime], [roomId], [sectionId], [isActive], [subjectId], [createDateTime], [updateDateTime], [createdBy], [updatedBy]) VALUES (3, N'Mon', NULL, CAST(N'2024-06-18T00:00:00.000' AS DateTime), CAST(N'2024-06-18T01:00:00.000' AS DateTime), 12, 1, 1, 8, CAST(N'2024-06-18T00:35:44.840' AS DateTime), NULL, 9, NULL)
GO
INSERT [dbo].[Timetable] ([id], [tmDay], [tmTime], [startDateTime], [endDateTime], [roomId], [sectionId], [isActive], [subjectId], [createDateTime], [updateDateTime], [createdBy], [updatedBy]) VALUES (4, N'Mon', NULL, CAST(N'2024-09-10T14:00:00.000' AS DateTime), CAST(N'2024-09-11T03:00:00.000' AS DateTime), 12, 1, 0, 10, CAST(N'2024-09-10T23:48:48.100' AS DateTime), NULL, 9, NULL)
GO
SET IDENTITY_INSERT [dbo].[Timetable] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 
GO
INSERT [dbo].[UserRole] ([id], [roleName], [shortName], [isActive]) VALUES (1, N'Teacher', N'L', 1)
GO
INSERT [dbo].[UserRole] ([id], [roleName], [shortName], [isActive]) VALUES (2, N'Admin', N'ADMN', 1)
GO
INSERT [dbo].[UserRole] ([id], [roleName], [shortName], [isActive]) VALUES (3, N'HOD', N'HOD', 1)
GO
INSERT [dbo].[UserRole] ([id], [roleName], [shortName], [isActive]) VALUES (4, N'Other', N'Other', 1)
GO
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([id], [initials], [userName], [isActive], [roleId]) VALUES (1, N'NEK', N'Neeraj Kaushik', 0, 1)
GO
INSERT [dbo].[Users] ([id], [initials], [userName], [isActive], [roleId]) VALUES (2, N'SAT', N'Sanjya tripathi', 0, 1)
GO
INSERT [dbo].[Users] ([id], [initials], [userName], [isActive], [roleId]) VALUES (3, N'NP', N'Neeraj Pathak', 0, 1)
GO
INSERT [dbo].[Users] ([id], [initials], [userName], [isActive], [roleId]) VALUES (4, N'LNCH', N'LUNCH', 0, 4)
GO
INSERT [dbo].[Users] ([id], [initials], [userName], [isActive], [roleId]) VALUES (5, N'ad', N'ADITYA', 0, 1)
GO
INSERT [dbo].[Users] ([id], [initials], [userName], [isActive], [roleId]) VALUES (6, N'NEK', N'Neeraj Kaushik', 0, 1)
GO
INSERT [dbo].[Users] ([id], [initials], [userName], [isActive], [roleId]) VALUES (7, N'NKS', N'dr. Nirpendra  Kumar Singh', 0, 1)
GO
INSERT [dbo].[Users] ([id], [initials], [userName], [isActive], [roleId]) VALUES (8, N'SAT', N'Mr. Sanjay Tripathi', 1, 1)
GO
INSERT [dbo].[Users] ([id], [initials], [userName], [isActive], [roleId]) VALUES (9, N'NEK', N'Mr. Neeraj Kaushik', 1, 1)
GO
INSERT [dbo].[Users] ([id], [initials], [userName], [isActive], [roleId]) VALUES (10, N'AN', N'Mr. Aditya Narayan', 1, 1)
GO
INSERT [dbo].[Users] ([id], [initials], [userName], [isActive], [roleId]) VALUES (11, N'NKS', N'Dr. Nripendra Kumar Singh', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Section] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Semester] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Subjects] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Timetable] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Timetable] ADD  DEFAULT (getdate()) FOR [createDateTime]
GO
ALTER TABLE [dbo].[Timetable] ADD  DEFAULT (NULL) FOR [updateDateTime]
GO
ALTER TABLE [dbo].[Timetable] ADD  DEFAULT (NULL) FOR [updatedBy]
GO
ALTER TABLE [dbo].[UserRole] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD FOREIGN KEY([semesterId])
REFERENCES [dbo].[Semester] ([id])
GO
ALTER TABLE [dbo].[Semester]  WITH CHECK ADD FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD FOREIGN KEY([createdBy])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD FOREIGN KEY([roomId])
REFERENCES [dbo].[Rooms] ([id])
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD FOREIGN KEY([sectionId])
REFERENCES [dbo].[Section] ([id])
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD FOREIGN KEY([updatedBy])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[UserRole] ([id])
GO
USE [master]
GO
ALTER DATABASE [Course] SET  READ_WRITE 
GO
