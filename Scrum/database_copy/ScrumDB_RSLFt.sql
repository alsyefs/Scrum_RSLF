USE [master]
GO
/****** Object:  Database [ScrumDB_RSLF]    Script Date: 1/30/2019 10:07:26 PM ******/
CREATE DATABASE [ScrumDB_RSLF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ScrumDB_RSLF', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ScrumDB_RSLF.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ScrumDB_RSLF_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ScrumDB_RSLF_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ScrumDB_RSLF] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ScrumDB_RSLF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ScrumDB_RSLF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET ARITHABORT OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ScrumDB_RSLF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ScrumDB_RSLF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ScrumDB_RSLF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ScrumDB_RSLF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET RECOVERY FULL 
GO
ALTER DATABASE [ScrumDB_RSLF] SET  MULTI_USER 
GO
ALTER DATABASE [ScrumDB_RSLF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ScrumDB_RSLF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ScrumDB_RSLF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ScrumDB_RSLF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ScrumDB_RSLF] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ScrumDB_RSLF', N'ON'
GO
ALTER DATABASE [ScrumDB_RSLF] SET QUERY_STORE = OFF
GO
USE [ScrumDB_RSLF]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[imageId] [int] IDENTITY(1,1) NOT NULL,
	[image_name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[imageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagesForProjects]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagesForProjects](
	[imagesForProjectsId] [int] IDENTITY(1,1) NOT NULL,
	[imageId] [int] NULL,
	[projectId] [int] NULL,
 CONSTRAINT [PK_ImagesForProjects] PRIMARY KEY CLUSTERED 
(
	[imagesForProjectsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagesForSprintTasks]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagesForSprintTasks](
	[imagesForSprintTasksId] [int] IDENTITY(1,1) NOT NULL,
	[imageId] [int] NULL,
	[sprintTaskId] [int] NULL,
 CONSTRAINT [PK_ImagesForSprintTasks] PRIMARY KEY CLUSTERED 
(
	[imagesForSprintTasksId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagesForTestCases]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagesForTestCases](
	[imagesForTestCasesId] [int] IDENTITY(1,1) NOT NULL,
	[imageId] [int] NULL,
	[testCaseId] [int] NULL,
 CONSTRAINT [PK_ImagesForTestCases] PRIMARY KEY CLUSTERED 
(
	[imagesForTestCasesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagesForUserStories]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagesForUserStories](
	[imagesForUserStoriesId] [int] IDENTITY(1,1) NOT NULL,
	[imageId] [int] NULL,
	[userStoryId] [int] NULL,
 CONSTRAINT [PK_ImagesForUserStories] PRIMARY KEY CLUSTERED 
(
	[imagesForUserStoriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Keys]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keys](
	[keyId] [int] IDENTITY(1,1) NOT NULL,
	[key_email] [nvarchar](max) NULL,
	[key_password] [nvarchar](max) NULL,
	[key_passwordHash] [nvarchar](max) NULL,
	[key_saltKey] [nvarchar](max) NULL,
	[key_vIKey] [nvarchar](max) NULL,
	[key_DBID] [nvarchar](max) NULL,
	[key_DBPassword] [nvarchar](max) NULL,
 CONSTRAINT [PK_Keys] PRIMARY KEY CLUSTERED 
(
	[keyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins](
	[loginId] [int] IDENTITY(1,1) NOT NULL,
	[login_username] [nvarchar](max) NULL,
	[login_password] [nvarchar](max) NULL,
	[roleId] [int] NULL,
	[login_token] [nvarchar](max) NULL,
	[login_attempts] [int] NULL,
	[login_securityQuestionsAttempts] [int] NULL,
	[login_initial] [bit] NULL,
	[login_isActive] [bit] NULL,
 CONSTRAINT [PK_Logins] PRIMARY KEY CLUSTERED 
(
	[loginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[log_time] [datetime] NULL,
	[loginId] [int] NULL,
	[log_username] [nvarchar](max) NULL,
	[log_roleId] [int] NULL,
	[log_token] [nvarchar](max) NULL,
	[log_currentPage] [nvarchar](max) NULL,
	[log_previousPage] [nvarchar](max) NULL,
	[log_userIP] [nvarchar](max) NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parameters]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parameters](
	[parameterId] [int] IDENTITY(1,1) NOT NULL,
	[testCaseId] [int] NULL,
	[parameter_name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Parameters] PRIMARY KEY CLUSTERED 
(
	[parameterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[projectId] [int] IDENTITY(1,1) NOT NULL,
	[project_name] [nvarchar](max) NULL,
	[project_description] [nvarchar](max) NULL,
	[project_createdBy] [int] NULL,
	[project_createdDate] [datetime] NULL,
	[project_isTerminated] [bit] NULL,
	[project_isDeleted] [bit] NULL,
	[project_hasImage] [bit] NULL,
	[project_startedDate] [datetime] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[projectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[questionId] [int] IDENTITY(1,1) NOT NULL,
	[question_text] [nvarchar](max) NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registrations]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrations](
	[registerId] [int] IDENTITY(1,1) NOT NULL,
	[register_firstname] [nvarchar](max) NULL,
	[register_lastname] [nvarchar](max) NULL,
	[register_email] [nvarchar](max) NULL,
	[register_phone] [nvarchar](max) NULL,
	[register_roleId] [int] NULL,
 CONSTRAINT [PK_Registrations] PRIMARY KEY CLUSTERED 
(
	[registerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityQuestions]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityQuestions](
	[securityQuestionId] [int] IDENTITY(1,1) NOT NULL,
	[loginId] [int] NULL,
	[questionId] [int] NULL,
	[securityQuestion_answer] [nvarchar](max) NULL,
 CONSTRAINT [PK_SecurityQuestions] PRIMARY KEY CLUSTERED 
(
	[securityQuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SprintTasks]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SprintTasks](
	[sprintTaskId] [int] IDENTITY(1,1) NOT NULL,
	[userStoryId] [int] NULL,
	[sprintTask_createdBy] [int] NULL,
	[sprintTask_createdDate] [datetime] NULL,
	[sprintTask_uniqueId] [nvarchar](max) NULL,
	[sprintTask_taskDescription] [nvarchar](max) NULL,
	[sprintTask_dateIntroduced] [datetime] NULL,
	[sprintTask_dateConsideredForImplementation] [datetime] NULL,
	[sprintTask_dateCompleted] [datetime] NULL,
	[sprintTask_editedBy] [int] NULL,
	[sprintTask_editedDate] [datetime] NULL,
	[sprintTask_previousVersion] [int] NULL,
	[sprintTask_isDeleted] [bit] NULL,
	[sprintTask_hasImage] [bit] NULL,
	[sprintTask_currentStatus] [nvarchar](max) NULL,
 CONSTRAINT [PK_SprintTasks] PRIMARY KEY CLUSTERED 
(
	[sprintTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestCases]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestCases](
	[testCaseId] [int] IDENTITY(1,1) NOT NULL,
	[sprintTaskId] [int] NULL,
	[testCase_createdBy] [int] NULL,
	[testCase_createdDate] [datetime] NULL,
	[testCase_uniqueId] [nvarchar](max) NULL,
	[testCase_testCaseScenario] [nvarchar](max) NULL,
	[testCase_expectedOutput] [nvarchar](max) NULL,
	[testCase_editedBy] [int] NULL,
	[testCase_editedDate] [datetime] NULL,
	[testcase_previousVersion] [int] NULL,
	[testCase_isDeleted] [bit] NULL,
	[testCase_hasImage] [bit] NULL,
	[testCase_currentStatus] [nvarchar](max) NULL,
 CONSTRAINT [PK_TestCases] PRIMARY KEY CLUSTERED 
(
	[testCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[user_firstname] [nvarchar](max) NULL,
	[user_lastname] [nvarchar](max) NULL,
	[user_email] [nvarchar](max) NULL,
	[user_phone] [nvarchar](max) NULL,
	[loginId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersForProjects]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersForProjects](
	[usersForProjectsId] [int] IDENTITY(1,1) NOT NULL,
	[projectId] [int] NULL,
	[usersForProjects_joinedTime] [datetime] NULL,
	[usersForProjects_isNotified] [bit] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_UsersForProjects] PRIMARY KEY CLUSTERED 
(
	[usersForProjectsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersForSprintTasks]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersForSprintTasks](
	[usersForSprintTasksId] [int] IDENTITY(1,1) NOT NULL,
	[sprintTaskId] [int] NULL,
	[usersForSprintTasks_isNotified] [bit] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_UsersForSprintTasks] PRIMARY KEY CLUSTERED 
(
	[usersForSprintTasksId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersForTestCases]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersForTestCases](
	[usersForTestCasesId] [int] IDENTITY(1,1) NOT NULL,
	[testCaseId] [int] NULL,
	[usersForTestCases_isNotified] [bit] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_UsersForTestCases] PRIMARY KEY CLUSTERED 
(
	[usersForTestCasesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersForUserStories]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersForUserStories](
	[usersForUserStoriesId] [int] IDENTITY(1,1) NOT NULL,
	[userStoryId] [int] NULL,
	[usersForUserStories_isNotified] [bit] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_UsersForUserStories] PRIMARY KEY CLUSTERED 
(
	[usersForUserStoriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStories]    Script Date: 1/30/2019 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStories](
	[userStoryId] [int] IDENTITY(1,1) NOT NULL,
	[projectId] [int] NULL,
	[userStory_createdBy] [int] NULL,
	[userStory_createdDate] [datetime] NULL,
	[userStory_uniqueId] [nvarchar](max) NULL,
	[userStory_asARole] [nvarchar](max) NULL,
	[userStory_iWantTo] [nvarchar](max) NULL,
	[userStory_soThat] [nvarchar](max) NULL,
	[userStory_dateIntroduced] [datetime] NULL,
	[userStory_dateConsideredForImplementation] [datetime] NULL,
	[userStory_editedBy] [int] NULL,
	[userStory_editedDate] [datetime] NULL,
	[userStory_previousVersion] [int] NULL,
	[userStory_isDeleted] [bit] NULL,
	[userStory_hasImage] [bit] NULL,
	[userStory_currentStatus] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserStories] PRIMARY KEY CLUSTERED 
(
	[userStoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Keys] ON 

INSERT [dbo].[Keys] ([keyId], [key_email], [key_password], [key_passwordHash], [key_saltKey], [key_vIKey], [key_DBID], [key_DBPassword]) VALUES (1, N'Scrum.UWL@gmail.com', N'Saleh.Alsyefi1988', N'P@@Sw0rd', N'S@LT&KEY', N'@1B2c3D4e5F6g7H8', N'sa', N'Saleh.Alsyefi1988')
SET IDENTITY_INSERT [dbo].[Keys] OFF
SET IDENTITY_INSERT [dbo].[Logins] ON 

INSERT [dbo].[Logins] ([loginId], [login_username], [login_password], [roleId], [login_token], [login_attempts], [login_securityQuestionsAttempts], [login_initial], [login_isActive]) VALUES (1, N'admin', N'a88ad46d145a91e022eb24eb7de9d896fe4447079a73306da19faf5360863572', 1, N'+3TDIeWG1kiOCDqiKOK1Rr1Ww8yB/bKL', 0, 0, 0, 1)
INSERT [dbo].[Logins] ([loginId], [login_username], [login_password], [roleId], [login_token], [login_attempts], [login_securityQuestionsAttempts], [login_initial], [login_isActive]) VALUES (2, N'Saleh.Alsyefi', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 2, NULL, 0, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Logins] OFF
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12322, CAST(N'2018-12-11T13:09:16.000' AS DateTime), 1, N'admin', 1, N'a+pnJZxf1khNlTY4yHv+QJVr9OArXEOh', N'http://138.49.101.87:88/SecurityQuestions.aspx', N'http://138.49.101.87:88/Login', N'10.62.109.189')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12323, CAST(N'2018-12-11T13:09:48.000' AS DateTime), 1, N'admin', 1, N'B0xZOJxf1khQxQZoiQOlQaDQ1mfy2Vu4', N'http://138.49.101.87:88/SecurityQuestions.aspx', N'http://138.49.101.87:88/Login', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12324, CAST(N'2018-12-11T13:09:59.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/Home.aspx', N'http://138.49.101.87:88/SecurityQuestions.aspx', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12325, CAST(N'2018-12-11T13:09:59.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/Home.aspx', N'http://138.49.101.87:88/SecurityQuestions.aspx', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12326, CAST(N'2018-12-11T13:10:09.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/Account', N'http://138.49.101.87:88/Accounts/Admin/Home.aspx', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12327, CAST(N'2018-12-11T13:10:09.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/Account', N'http://138.49.101.87:88/Accounts/Admin/Home.aspx', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12328, CAST(N'2018-12-11T13:10:12.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/Account', N'http://138.49.101.87:88/Accounts/Admin/Account', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12329, CAST(N'2018-12-11T13:10:12.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/Account', N'http://138.49.101.87:88/Accounts/Admin/Account', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12330, CAST(N'2018-12-11T13:10:12.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/ChangeSecurityQuestions', N'http://138.49.101.87:88/Accounts/Admin/Account', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12331, CAST(N'2018-12-11T13:10:12.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/ChangeSecurityQuestions', N'http://138.49.101.87:88/Accounts/Admin/Account', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12332, CAST(N'2018-12-11T13:10:31.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/ChangeSecurityQuestions', N'http://138.49.101.87:88/Accounts/Admin/ChangeSecurityQuestions', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12333, CAST(N'2018-12-11T13:10:31.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/ChangeSecurityQuestions', N'http://138.49.101.87:88/Accounts/Admin/ChangeSecurityQuestions', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12334, CAST(N'2018-12-11T13:10:38.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/Account', N'http://138.49.101.87:88/Accounts/Admin/ChangeSecurityQuestions', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12335, CAST(N'2018-12-11T13:10:38.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/Account', N'http://138.49.101.87:88/Accounts/Admin/ChangeSecurityQuestions', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12336, CAST(N'2018-12-11T13:10:40.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/Account', N'http://138.49.101.87:88/Accounts/Admin/Account', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12337, CAST(N'2018-12-11T13:10:40.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/Account', N'http://138.49.101.87:88/Accounts/Admin/Account', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12338, CAST(N'2018-12-11T13:10:40.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/ChangePassword', N'http://138.49.101.87:88/Accounts/Admin/Account', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12339, CAST(N'2018-12-11T13:10:40.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/ChangePassword', N'http://138.49.101.87:88/Accounts/Admin/Account', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12340, CAST(N'2018-12-11T13:10:56.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/ChangePassword', N'http://138.49.101.87:88/Accounts/Admin/ChangePassword', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12341, CAST(N'2018-12-11T13:10:56.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/ChangePassword', N'http://138.49.101.87:88/Accounts/Admin/ChangePassword', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12342, CAST(N'2018-12-11T13:11:22.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/ChangePassword', N'http://138.49.101.87:88/Accounts/Admin/ChangePassword', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12343, CAST(N'2018-12-11T13:11:22.000' AS DateTime), 1, N'admin', 1, N'6LDiO5xf1kh4nVfR4bqlQK0PDEYKihJm', N'http://138.49.101.87:88/Accounts/Admin/ChangePassword', N'http://138.49.101.87:88/Accounts/Admin/ChangePassword', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12344, CAST(N'2018-12-11T13:12:26.000' AS DateTime), 1, N'admin', 1, N'isW1lpxf1kjWKT0eaoXaQ7722TvvpCL2', N'http://138.49.101.87:88/SecurityQuestions.aspx', N'http://138.49.101.87:88/Login', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12345, CAST(N'2018-12-11T13:12:32.000' AS DateTime), 1, N'admin', 1, N'f4Mkmpxf1kinVD5xMKIbTaEG9zwth0tz', N'http://138.49.101.87:88/Accounts/Admin/Home.aspx', N'http://138.49.101.87:88/SecurityQuestions.aspx', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12346, CAST(N'2018-12-11T13:12:32.000' AS DateTime), 1, N'admin', 1, N'f4Mkmpxf1kinVD5xMKIbTaEG9zwth0tz', N'http://138.49.101.87:88/Accounts/Admin/Home.aspx', N'http://138.49.101.87:88/SecurityQuestions.aspx', N'138.49.31.81')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12347, CAST(N'2019-01-30T21:26:22.000' AS DateTime), 1, N'admin', 1, N'qsB2b+CG1khxREm486/SR7N63/eUIwxi', N'http://localhost:22739/CreateSecurityQuestions.aspx', N'http://localhost:22739/Login', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12348, CAST(N'2019-01-30T21:26:40.000' AS DateTime), 1, N'admin', 1, N'N55zeuCG1kjV1pviYLn0TIlYhjcbeN4T', N'http://localhost:22739/ChangePassword.aspx', N'http://localhost:22739/CreateSecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12349, CAST(N'2019-01-30T21:26:56.000' AS DateTime), 1, N'admin', 1, N'd+tkg+CG1kiMjRAk18zjSpUPGdC1cS23', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/ChangePassword.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12350, CAST(N'2019-01-30T21:26:56.000' AS DateTime), 1, N'admin', 1, N'd+tkg+CG1kiMjRAk18zjSpUPGdC1cS23', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/ChangePassword.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12351, CAST(N'2019-01-30T21:27:45.000' AS DateTime), 1, N'admin', 1, N'E0dNoeCG1kjCdQ5M31qaRbePtKG2N3KX', N'http://localhost:22739/SecurityQuestions.aspx', N'http://localhost:22739/Login', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12352, CAST(N'2019-01-30T21:27:48.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12353, CAST(N'2019-01-30T21:27:48.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12354, CAST(N'2019-01-30T21:27:49.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/Notifications', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12355, CAST(N'2019-01-30T21:27:49.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/Notifications', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12356, CAST(N'2019-01-30T21:27:50.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/Notifications', N'http://localhost:22739/Accounts/Admin/Notifications', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12357, CAST(N'2019-01-30T21:27:50.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/Notifications', N'http://localhost:22739/Accounts/Admin/Notifications', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12358, CAST(N'2019-01-30T21:27:50.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/ReviewUsers', N'http://localhost:22739/Accounts/Admin/Notifications', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12359, CAST(N'2019-01-30T21:27:50.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/ReviewUsers', N'http://localhost:22739/Accounts/Admin/Notifications', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12360, CAST(N'2019-01-30T21:27:51.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/ReviewUser.aspx?id=1', N'http://localhost:22739/Accounts/Admin/ReviewUsers', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12361, CAST(N'2019-01-30T21:27:51.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/ReviewUser.aspx?id=1', N'http://localhost:22739/Accounts/Admin/ReviewUsers', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12362, CAST(N'2019-01-30T21:27:53.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/ReviewUser.aspx?id=1', N'http://localhost:22739/Accounts/Admin/ReviewUser.aspx?id=1', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12363, CAST(N'2019-01-30T21:27:53.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/ReviewUser.aspx?id=1', N'http://localhost:22739/Accounts/Admin/ReviewUser.aspx?id=1', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12364, CAST(N'2019-01-30T21:27:56.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/ReviewUser.aspx?id=1', N'http://localhost:22739/Accounts/Admin/ReviewUser.aspx?id=1', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12365, CAST(N'2019-01-30T21:27:56.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/ReviewUsers', N'http://localhost:22739/Accounts/Admin/ReviewUser.aspx?id=1', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12366, CAST(N'2019-01-30T21:27:56.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/ReviewUsers', N'http://localhost:22739/Accounts/Admin/ReviewUser.aspx?id=1', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12367, CAST(N'2019-01-30T21:27:58.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/ReviewUsers', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12368, CAST(N'2019-01-30T21:27:58.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/ReviewUsers', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12369, CAST(N'2019-01-30T21:28:01.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12370, CAST(N'2019-01-30T21:28:01.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12371, CAST(N'2019-01-30T21:28:04.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12372, CAST(N'2019-01-30T21:28:04.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12373, CAST(N'2019-01-30T21:28:05.000' AS DateTime), 1, N'admin', 1, N'WhPYouCG1kjSg9lLbAbwTrh6/scg6KQQ', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12374, CAST(N'2019-01-30T21:28:10.000' AS DateTime), 1, N'admin', 1, N'Xjbbr+CG1khADTYRpEZ7Q6BowyDtv3/6', N'http://localhost:22739/SecurityQuestions.aspx', N'http://localhost:22739/Login', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12375, CAST(N'2019-01-30T21:28:12.000' AS DateTime), 1, N'admin', 1, N'VUUvseCG1khgj2mo91J7S4zk4z+kL948', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12376, CAST(N'2019-01-30T21:28:12.000' AS DateTime), 1, N'admin', 1, N'VUUvseCG1khgj2mo91J7S4zk4z+kL948', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12377, CAST(N'2019-01-30T21:28:13.000' AS DateTime), 1, N'admin', 1, N'VUUvseCG1khgj2mo91J7S4zk4z+kL948', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12378, CAST(N'2019-01-30T21:28:13.000' AS DateTime), 1, N'admin', 1, N'VUUvseCG1khgj2mo91J7S4zk4z+kL948', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12379, CAST(N'2019-01-30T21:28:15.000' AS DateTime), 1, N'admin', 1, N'VUUvseCG1khgj2mo91J7S4zk4z+kL948', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12380, CAST(N'2019-01-30T21:28:15.000' AS DateTime), 1, N'admin', 1, N'VUUvseCG1khgj2mo91J7S4zk4z+kL948', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12381, CAST(N'2019-01-30T21:28:18.000' AS DateTime), 1, N'admin', 1, N'VUUvseCG1khgj2mo91J7S4zk4z+kL948', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12382, CAST(N'2019-01-30T21:28:18.000' AS DateTime), 1, N'admin', 1, N'VUUvseCG1khgj2mo91J7S4zk4z+kL948', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12383, CAST(N'2019-01-30T21:28:26.000' AS DateTime), 1, N'admin', 1, N'VUUvseCG1khgj2mo91J7S4zk4z+kL948', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12384, CAST(N'2019-01-30T21:29:07.000' AS DateTime), 1, N'admin', 1, N'y7fg0eCG1kicgeXIzuWMSoOVwXlTp+At', N'http://localhost:22739/SecurityQuestions.aspx', N'http://localhost:22739/Login', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12385, CAST(N'2019-01-30T21:29:09.000' AS DateTime), 1, N'admin', 1, N'/bNr0+CG1kgPmJmB6oUkSrExUE4bLPYn', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12386, CAST(N'2019-01-30T21:29:09.000' AS DateTime), 1, N'admin', 1, N'/bNr0+CG1kgPmJmB6oUkSrExUE4bLPYn', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12387, CAST(N'2019-01-30T21:29:11.000' AS DateTime), 1, N'admin', 1, N'/bNr0+CG1kgPmJmB6oUkSrExUE4bLPYn', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12388, CAST(N'2019-01-30T21:29:11.000' AS DateTime), 1, N'admin', 1, N'/bNr0+CG1kgPmJmB6oUkSrExUE4bLPYn', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12389, CAST(N'2019-01-30T21:29:13.000' AS DateTime), 1, N'admin', 1, N'/bNr0+CG1kgPmJmB6oUkSrExUE4bLPYn', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12390, CAST(N'2019-01-30T21:29:13.000' AS DateTime), 1, N'admin', 1, N'/bNr0+CG1kgPmJmB6oUkSrExUE4bLPYn', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12391, CAST(N'2019-01-30T21:29:19.000' AS DateTime), 1, N'admin', 1, N'/bNr0+CG1kgPmJmB6oUkSrExUE4bLPYn', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12392, CAST(N'2019-01-30T21:29:19.000' AS DateTime), 1, N'admin', 1, N'/bNr0+CG1kgPmJmB6oUkSrExUE4bLPYn', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12393, CAST(N'2019-01-30T21:29:56.000' AS DateTime), 1, N'admin', 1, N'/bNr0+CG1kgPmJmB6oUkSrExUE4bLPYn', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12394, CAST(N'2019-01-30T21:32:45.000' AS DateTime), 0, N'', 0, N'', N'http://localhost:22739/Accounts/Developer/Profile.aspx', N'', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12395, CAST(N'2019-01-30T21:32:51.000' AS DateTime), 1, N'admin', 1, N'5t5RV+GG1kgfqXSnKxl/QbmjNnXW4cEr', N'http://localhost:22739/SecurityQuestions.aspx', N'http://localhost:22739/Login', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12396, CAST(N'2019-01-30T21:32:57.000' AS DateTime), 1, N'admin', 1, N'FPrAWuGG1kjfbERhyX6fS6plplpoPxD8', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12397, CAST(N'2019-01-30T21:32:57.000' AS DateTime), 1, N'admin', 1, N'FPrAWuGG1kjfbERhyX6fS6plplpoPxD8', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12398, CAST(N'2019-01-30T21:32:59.000' AS DateTime), 1, N'admin', 1, N'FPrAWuGG1kjfbERhyX6fS6plplpoPxD8', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12399, CAST(N'2019-01-30T21:32:59.000' AS DateTime), 1, N'admin', 1, N'FPrAWuGG1kjfbERhyX6fS6plplpoPxD8', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12400, CAST(N'2019-01-30T21:33:01.000' AS DateTime), 1, N'admin', 1, N'FPrAWuGG1kjfbERhyX6fS6plplpoPxD8', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12401, CAST(N'2019-01-30T21:33:01.000' AS DateTime), 1, N'admin', 1, N'FPrAWuGG1kjfbERhyX6fS6plplpoPxD8', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12402, CAST(N'2019-01-30T21:33:03.000' AS DateTime), 1, N'admin', 1, N'FPrAWuGG1kjfbERhyX6fS6plplpoPxD8', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12403, CAST(N'2019-01-30T21:33:03.000' AS DateTime), 1, N'admin', 1, N'FPrAWuGG1kjfbERhyX6fS6plplpoPxD8', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12404, CAST(N'2019-01-30T21:33:04.000' AS DateTime), 1, N'admin', 1, N'FPrAWuGG1kjfbERhyX6fS6plplpoPxD8', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12405, CAST(N'2019-01-30T21:33:04.000' AS DateTime), 1, N'admin', 1, N'FPrAWuGG1kjfbERhyX6fS6plplpoPxD8', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12406, CAST(N'2019-01-30T21:38:42.000' AS DateTime), 0, N'', 0, N'', N'http://localhost:22739/Accounts/Admin/Profile.aspx', N'', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12407, CAST(N'2019-01-30T21:38:46.000' AS DateTime), 1, N'admin', 1, N'4NjkKuKG1khLOmZBY+u3SaQZt+2WjCJi', N'http://localhost:22739/SecurityQuestions.aspx', N'http://localhost:22739/Login', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12408, CAST(N'2019-01-30T21:38:49.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12409, CAST(N'2019-01-30T21:38:49.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12410, CAST(N'2019-01-30T21:38:50.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12411, CAST(N'2019-01-30T21:38:50.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12412, CAST(N'2019-01-30T21:38:52.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12413, CAST(N'2019-01-30T21:38:52.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12414, CAST(N'2019-01-30T21:38:54.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12415, CAST(N'2019-01-30T21:38:54.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12416, CAST(N'2019-01-30T21:38:55.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1005', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12417, CAST(N'2019-01-30T21:38:55.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1005', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12418, CAST(N'2019-01-30T21:39:00.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12419, CAST(N'2019-01-30T21:39:00.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12420, CAST(N'2019-01-30T21:39:25.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
GO
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12421, CAST(N'2019-01-30T21:39:25.000' AS DateTime), 1, N'admin', 1, N'vNfTLOKG1kif3f6M0vkGQrzdAjlVX2Re', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12422, CAST(N'2019-01-30T21:39:43.000' AS DateTime), 0, N'', 0, N'', N'http://localhost:22739/Accounts/Admin/Profile.aspx', N'', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12423, CAST(N'2019-01-30T21:39:47.000' AS DateTime), 1, N'admin', 1, N'5+88T+KG1kj/EN64dftoTqlg+Hmxy86y', N'http://localhost:22739/SecurityQuestions.aspx', N'http://localhost:22739/Login', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12424, CAST(N'2019-01-30T21:39:49.000' AS DateTime), 1, N'admin', 1, N'sw+BUOKG1kjlL7gaBcAkQZoHLh2vU7C0', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12425, CAST(N'2019-01-30T21:39:49.000' AS DateTime), 1, N'admin', 1, N'sw+BUOKG1kjlL7gaBcAkQZoHLh2vU7C0', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12426, CAST(N'2019-01-30T21:39:50.000' AS DateTime), 1, N'admin', 1, N'sw+BUOKG1kjlL7gaBcAkQZoHLh2vU7C0', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12427, CAST(N'2019-01-30T21:39:50.000' AS DateTime), 1, N'admin', 1, N'sw+BUOKG1kjlL7gaBcAkQZoHLh2vU7C0', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12428, CAST(N'2019-01-30T21:39:52.000' AS DateTime), 1, N'admin', 1, N'sw+BUOKG1kjlL7gaBcAkQZoHLh2vU7C0', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12429, CAST(N'2019-01-30T21:39:52.000' AS DateTime), 1, N'admin', 1, N'sw+BUOKG1kjlL7gaBcAkQZoHLh2vU7C0', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12430, CAST(N'2019-01-30T21:39:54.000' AS DateTime), 1, N'admin', 1, N'sw+BUOKG1kjlL7gaBcAkQZoHLh2vU7C0', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12431, CAST(N'2019-01-30T21:39:54.000' AS DateTime), 1, N'admin', 1, N'sw+BUOKG1kjlL7gaBcAkQZoHLh2vU7C0', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12432, CAST(N'2019-01-30T21:39:55.000' AS DateTime), 1, N'admin', 1, N'sw+BUOKG1kjlL7gaBcAkQZoHLh2vU7C0', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12433, CAST(N'2019-01-30T21:39:55.000' AS DateTime), 1, N'admin', 1, N'sw+BUOKG1kjlL7gaBcAkQZoHLh2vU7C0', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12434, CAST(N'2019-01-30T21:41:22.000' AS DateTime), 1, N'admin', 1, N'zpjfh+KG1kj2dnFoe7hlT7wPozShp63O', N'http://localhost:22739/SecurityQuestions.aspx', N'http://localhost:22739/Login', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12435, CAST(N'2019-01-30T21:41:25.000' AS DateTime), 1, N'admin', 1, N'kjccieKG1kg1lqRWpqmMQY7FTGhPkmri', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12436, CAST(N'2019-01-30T21:41:25.000' AS DateTime), 1, N'admin', 1, N'kjccieKG1kg1lqRWpqmMQY7FTGhPkmri', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12437, CAST(N'2019-01-30T21:41:26.000' AS DateTime), 1, N'admin', 1, N'kjccieKG1kg1lqRWpqmMQY7FTGhPkmri', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12438, CAST(N'2019-01-30T21:41:26.000' AS DateTime), 1, N'admin', 1, N'kjccieKG1kg1lqRWpqmMQY7FTGhPkmri', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12439, CAST(N'2019-01-30T21:41:28.000' AS DateTime), 1, N'admin', 1, N'kjccieKG1kg1lqRWpqmMQY7FTGhPkmri', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12440, CAST(N'2019-01-30T21:41:28.000' AS DateTime), 1, N'admin', 1, N'kjccieKG1kg1lqRWpqmMQY7FTGhPkmri', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12441, CAST(N'2019-01-30T21:41:30.000' AS DateTime), 1, N'admin', 1, N'kjccieKG1kg1lqRWpqmMQY7FTGhPkmri', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12442, CAST(N'2019-01-30T21:41:30.000' AS DateTime), 1, N'admin', 1, N'kjccieKG1kg1lqRWpqmMQY7FTGhPkmri', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12443, CAST(N'2019-01-30T21:41:31.000' AS DateTime), 1, N'admin', 1, N'kjccieKG1kg1lqRWpqmMQY7FTGhPkmri', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12444, CAST(N'2019-01-30T21:41:31.000' AS DateTime), 1, N'admin', 1, N'kjccieKG1kg1lqRWpqmMQY7FTGhPkmri', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12445, CAST(N'2019-01-30T21:41:55.000' AS DateTime), 1, N'admin', 1, N'kjccieKG1kg1lqRWpqmMQY7FTGhPkmri', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12446, CAST(N'2019-01-30T21:41:55.000' AS DateTime), 1, N'admin', 1, N'kjccieKG1kg1lqRWpqmMQY7FTGhPkmri', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12447, CAST(N'2019-01-30T21:43:38.000' AS DateTime), 1, N'admin', 1, N'kjccieKG1kg1lqRWpqmMQY7FTGhPkmri', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12448, CAST(N'2019-01-30T21:44:45.000' AS DateTime), 0, N'', 0, N'', N'http://localhost:22739/Accounts/Admin/Profile.aspx', N'', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12449, CAST(N'2019-01-30T21:44:49.000' AS DateTime), 1, N'admin', 1, N'btBwA+OG1khg3fjwZ2/0SYOWsej6rf4c', N'http://localhost:22739/SecurityQuestions.aspx', N'http://localhost:22739/Login', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12450, CAST(N'2019-01-30T21:44:51.000' AS DateTime), 1, N'admin', 1, N'zhd1BOOG1khLHDBo87bhRauz2Hl04McE', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12451, CAST(N'2019-01-30T21:44:51.000' AS DateTime), 1, N'admin', 1, N'zhd1BOOG1khLHDBo87bhRauz2Hl04McE', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12452, CAST(N'2019-01-30T21:44:52.000' AS DateTime), 1, N'admin', 1, N'zhd1BOOG1khLHDBo87bhRauz2Hl04McE', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12453, CAST(N'2019-01-30T21:44:52.000' AS DateTime), 1, N'admin', 1, N'zhd1BOOG1khLHDBo87bhRauz2Hl04McE', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12454, CAST(N'2019-01-30T21:44:54.000' AS DateTime), 1, N'admin', 1, N'zhd1BOOG1khLHDBo87bhRauz2Hl04McE', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12455, CAST(N'2019-01-30T21:44:54.000' AS DateTime), 1, N'admin', 1, N'zhd1BOOG1khLHDBo87bhRauz2Hl04McE', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12456, CAST(N'2019-01-30T21:44:59.000' AS DateTime), 1, N'admin', 1, N'zhd1BOOG1khLHDBo87bhRauz2Hl04McE', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12457, CAST(N'2019-01-30T21:44:59.000' AS DateTime), 1, N'admin', 1, N'zhd1BOOG1khLHDBo87bhRauz2Hl04McE', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12458, CAST(N'2019-01-30T21:56:52.000' AS DateTime), 1, N'admin', 1, N'7VaIsuSG1kjLsBvfCdi2SZcYIx1QuVuv', N'http://localhost:22739/SecurityQuestions.aspx', N'http://localhost:22739/Login', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12459, CAST(N'2019-01-30T21:56:55.000' AS DateTime), 1, N'admin', 1, N'ooics+SG1kh1wyuXnnqzRpr8mMo0AE8f', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12460, CAST(N'2019-01-30T21:56:55.000' AS DateTime), 1, N'admin', 1, N'ooics+SG1kh1wyuXnnqzRpr8mMo0AE8f', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12461, CAST(N'2019-01-30T21:56:56.000' AS DateTime), 1, N'admin', 1, N'ooics+SG1kh1wyuXnnqzRpr8mMo0AE8f', N'http://localhost:22739/Accounts/Admin/Notifications', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12462, CAST(N'2019-01-30T21:56:56.000' AS DateTime), 1, N'admin', 1, N'ooics+SG1kh1wyuXnnqzRpr8mMo0AE8f', N'http://localhost:22739/Accounts/Admin/Notifications', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12463, CAST(N'2019-01-30T21:56:57.000' AS DateTime), 1, N'admin', 1, N'ooics+SG1kh1wyuXnnqzRpr8mMo0AE8f', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Notifications', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12464, CAST(N'2019-01-30T21:56:57.000' AS DateTime), 1, N'admin', 1, N'ooics+SG1kh1wyuXnnqzRpr8mMo0AE8f', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Notifications', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12465, CAST(N'2019-01-30T21:57:00.000' AS DateTime), 1, N'admin', 1, N'ooics+SG1kh1wyuXnnqzRpr8mMo0AE8f', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12466, CAST(N'2019-01-30T21:57:00.000' AS DateTime), 1, N'admin', 1, N'ooics+SG1kh1wyuXnnqzRpr8mMo0AE8f', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12467, CAST(N'2019-01-30T21:57:03.000' AS DateTime), 1, N'admin', 1, N'ooics+SG1kh1wyuXnnqzRpr8mMo0AE8f', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12468, CAST(N'2019-01-30T21:57:03.000' AS DateTime), 1, N'admin', 1, N'ooics+SG1kh1wyuXnnqzRpr8mMo0AE8f', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12469, CAST(N'2019-01-30T21:57:06.000' AS DateTime), 1, N'admin', 1, N'ooics+SG1kh1wyuXnnqzRpr8mMo0AE8f', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12470, CAST(N'2019-01-30T21:57:06.000' AS DateTime), 1, N'admin', 1, N'ooics+SG1kh1wyuXnnqzRpr8mMo0AE8f', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12471, CAST(N'2019-01-30T21:59:54.000' AS DateTime), 0, N'', 0, N'', N'http://localhost:22739/Accounts/Admin/Profile.aspx', N'', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12472, CAST(N'2019-01-30T21:59:57.000' AS DateTime), 1, N'admin', 1, N'uRGNIOWG1kh3RJMGEJY0T4s++h778GSs', N'http://localhost:22739/SecurityQuestions.aspx', N'http://localhost:22739/Login', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12473, CAST(N'2019-01-30T21:59:59.000' AS DateTime), 1, N'admin', 1, N'+3TDIeWG1kiOCDqiKOK1Rr1Ww8yB/bKL', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12474, CAST(N'2019-01-30T21:59:59.000' AS DateTime), 1, N'admin', 1, N'+3TDIeWG1kiOCDqiKOK1Rr1Ww8yB/bKL', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'http://localhost:22739/SecurityQuestions.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12475, CAST(N'2019-01-30T22:00:00.000' AS DateTime), 1, N'admin', 1, N'+3TDIeWG1kiOCDqiKOK1Rr1Ww8yB/bKL', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12476, CAST(N'2019-01-30T22:00:00.000' AS DateTime), 1, N'admin', 1, N'+3TDIeWG1kiOCDqiKOK1Rr1Ww8yB/bKL', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Home.aspx', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12477, CAST(N'2019-01-30T22:00:02.000' AS DateTime), 1, N'admin', 1, N'+3TDIeWG1kiOCDqiKOK1Rr1Ww8yB/bKL', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12478, CAST(N'2019-01-30T22:00:02.000' AS DateTime), 1, N'admin', 1, N'+3TDIeWG1kiOCDqiKOK1Rr1Ww8yB/bKL', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12479, CAST(N'2019-01-30T22:00:04.000' AS DateTime), 1, N'admin', 1, N'+3TDIeWG1kiOCDqiKOK1Rr1Ww8yB/bKL', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12480, CAST(N'2019-01-30T22:00:04.000' AS DateTime), 1, N'admin', 1, N'+3TDIeWG1kiOCDqiKOK1Rr1Ww8yB/bKL', N'http://localhost:22739/Accounts/Admin/Search', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12481, CAST(N'2019-01-30T22:00:05.000' AS DateTime), 1, N'admin', 1, N'+3TDIeWG1kiOCDqiKOK1Rr1Ww8yB/bKL', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12482, CAST(N'2019-01-30T22:00:05.000' AS DateTime), 1, N'admin', 1, N'+3TDIeWG1kiOCDqiKOK1Rr1Ww8yB/bKL', N'http://localhost:22739/Accounts/Admin/Profile.aspx?id=1006', N'http://localhost:22739/Accounts/Admin/Search', N'::1')
INSERT [dbo].[Logs] ([LogId], [log_time], [loginId], [log_username], [log_roleId], [log_token], [log_currentPage], [log_previousPage], [log_userIP]) VALUES (12483, CAST(N'2019-01-30T22:01:50.000' AS DateTime), 0, N'', 0, N'', N'http://localhost:22739/Accounts/Master/Profile.aspx', N'', N'::1')
SET IDENTITY_INSERT [dbo].[Logs] OFF
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (1, N'In what year were you born?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (2, N'In what city were you born?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (3, N'What is your mother''s last name?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (4, N'What is your favorite color?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (5, N'What is your maiden name?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (6, N'What is your mother''s maiden name?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (7, N'What is your favorite fruit?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (8, N'What is the name of your first pet?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (9, N'What is your grand father''s first name?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (10, N'Where did you study for your bachelor degree?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (11, N'When did you graduate from the bachelor school?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (12, N'Who is your favorite school teacher?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (13, N'What is the name of the high school you attended?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (14, N'What is your favorite film?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (15, N'Which year did you graduate from high school?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (16, N'Who is your favorite singer?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (17, N'What is your mother’s sister’s name?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (18, N'In which year your immediate elder sibling was born?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (19, N'In which year your immediate younger sibling was born?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (20, N'What are the last four digits of your current phone number?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (21, N'Which city would you like to visit as your dream vacation?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (22, N'Which country would you to visit as your dream vacation?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (23, N'What was your birth month and date?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (24, N'What is your closest friend’s nickname?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (25, N'What is the name of your first room-mate?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (26, N'What is the name of the college you attended first?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (27, N'What is the name of the course you liked the most in your first year of college?')
INSERT [dbo].[Questions] ([questionId], [question_text]) VALUES (28, N'What is the name of the course you liked the most in your first year of high school?')
SET IDENTITY_INSERT [dbo].[Questions] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([roleId], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([roleId], [role_name]) VALUES (2, N'Master')
INSERT [dbo].[Roles] ([roleId], [role_name]) VALUES (3, N'Developer')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[SecurityQuestions] ON 

INSERT [dbo].[SecurityQuestions] ([securityQuestionId], [loginId], [questionId], [securityQuestion_answer]) VALUES (4, 1, 1, N'hug56RbmPb/iQRQ43WMVrA==')
INSERT [dbo].[SecurityQuestions] ([securityQuestionId], [loginId], [questionId], [securityQuestion_answer]) VALUES (5, 1, 2, N'/CQrwcRmTFWcYic/qzUKXQ==')
INSERT [dbo].[SecurityQuestions] ([securityQuestionId], [loginId], [questionId], [securityQuestion_answer]) VALUES (6, 1, 4, N'zG7UOaFwwhIJ+1wEqHIHiA==')
SET IDENTITY_INSERT [dbo].[SecurityQuestions] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userId], [user_firstname], [user_lastname], [user_email], [user_phone], [loginId]) VALUES (1005, N'System', N'Admin', N'Saleh.Alsyefi@gmail.com', N'6085554444', 1)
INSERT [dbo].[Users] ([userId], [user_firstname], [user_lastname], [user_email], [user_phone], [loginId]) VALUES (1006, N'Saleh', N' Alsyefi', N'Saleh.Alsyefi@gmail.com', N'0591232666', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Logins] ADD  CONSTRAINT [DF_Logins_login_attempts]  DEFAULT ((0)) FOR [login_attempts]
GO
ALTER TABLE [dbo].[Logins] ADD  CONSTRAINT [DF_Logins_login_securityQuestionAttempts]  DEFAULT ((0)) FOR [login_securityQuestionsAttempts]
GO
ALTER TABLE [dbo].[Logins] ADD  CONSTRAINT [DF_Logins_login_initial]  DEFAULT ((0)) FOR [login_initial]
GO
ALTER TABLE [dbo].[Logins] ADD  CONSTRAINT [DF_Logins_login_isActive]  DEFAULT ((1)) FOR [login_isActive]
GO
ALTER TABLE [dbo].[Logs] ADD  CONSTRAINT [DF_Logs_loginId]  DEFAULT ((0)) FOR [loginId]
GO
ALTER TABLE [dbo].[Logs] ADD  CONSTRAINT [DF_Logs_log_roleId]  DEFAULT ((0)) FOR [log_roleId]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_project_isTerminated]  DEFAULT ((0)) FOR [project_isTerminated]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_project_isDeleted]  DEFAULT ((0)) FOR [project_isDeleted]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_project_hasImage]  DEFAULT ((0)) FOR [project_hasImage]
GO
ALTER TABLE [dbo].[SprintTasks] ADD  CONSTRAINT [DF_SprintTasks_sprintTask_isDeleted]  DEFAULT ((0)) FOR [sprintTask_isDeleted]
GO
ALTER TABLE [dbo].[SprintTasks] ADD  CONSTRAINT [DF_SprintTasks_sprintTask_hasImage]  DEFAULT ((0)) FOR [sprintTask_hasImage]
GO
ALTER TABLE [dbo].[TestCases] ADD  CONSTRAINT [DF_TestCases_testCase_isDeleted]  DEFAULT ((0)) FOR [testCase_isDeleted]
GO
ALTER TABLE [dbo].[TestCases] ADD  CONSTRAINT [DF_TestCases_testCase_hasImage]  DEFAULT ((0)) FOR [testCase_hasImage]
GO
ALTER TABLE [dbo].[UsersForProjects] ADD  CONSTRAINT [DF_UsersForProjects_usersForProjects_isAlerted]  DEFAULT ((0)) FOR [usersForProjects_isNotified]
GO
ALTER TABLE [dbo].[UsersForSprintTasks] ADD  CONSTRAINT [DF_UsersForSprintTasks_usersForSprintTasks_isNotified]  DEFAULT ((0)) FOR [usersForSprintTasks_isNotified]
GO
ALTER TABLE [dbo].[UsersForTestCases] ADD  CONSTRAINT [DF_UsersForTestCases_usersForProject_isNotified]  DEFAULT ((0)) FOR [usersForTestCases_isNotified]
GO
ALTER TABLE [dbo].[UsersForUserStories] ADD  CONSTRAINT [DF_UsersForUserStories_usersForUserStories_isNotified]  DEFAULT ((0)) FOR [usersForUserStories_isNotified]
GO
ALTER TABLE [dbo].[UserStories] ADD  CONSTRAINT [DF_UserStories_userStory_isDeleted]  DEFAULT ((0)) FOR [userStory_isDeleted]
GO
ALTER TABLE [dbo].[UserStories] ADD  CONSTRAINT [DF_UserStories_userStory_hasImage]  DEFAULT ((0)) FOR [userStory_hasImage]
GO
ALTER TABLE [dbo].[ImagesForProjects]  WITH CHECK ADD  CONSTRAINT [FK_ImagesForProjects_Images] FOREIGN KEY([imageId])
REFERENCES [dbo].[Images] ([imageId])
GO
ALTER TABLE [dbo].[ImagesForProjects] CHECK CONSTRAINT [FK_ImagesForProjects_Images]
GO
ALTER TABLE [dbo].[ImagesForProjects]  WITH CHECK ADD  CONSTRAINT [FK_ImagesForProjects_Projects] FOREIGN KEY([projectId])
REFERENCES [dbo].[Projects] ([projectId])
GO
ALTER TABLE [dbo].[ImagesForProjects] CHECK CONSTRAINT [FK_ImagesForProjects_Projects]
GO
ALTER TABLE [dbo].[ImagesForSprintTasks]  WITH CHECK ADD  CONSTRAINT [FK_ImagesForSprintTasks_Images] FOREIGN KEY([imageId])
REFERENCES [dbo].[Images] ([imageId])
GO
ALTER TABLE [dbo].[ImagesForSprintTasks] CHECK CONSTRAINT [FK_ImagesForSprintTasks_Images]
GO
ALTER TABLE [dbo].[ImagesForSprintTasks]  WITH CHECK ADD  CONSTRAINT [FK_ImagesForSprintTasks_SprintTasks] FOREIGN KEY([sprintTaskId])
REFERENCES [dbo].[SprintTasks] ([sprintTaskId])
GO
ALTER TABLE [dbo].[ImagesForSprintTasks] CHECK CONSTRAINT [FK_ImagesForSprintTasks_SprintTasks]
GO
ALTER TABLE [dbo].[ImagesForTestCases]  WITH CHECK ADD  CONSTRAINT [FK_ImagesForTestCases_Images] FOREIGN KEY([imageId])
REFERENCES [dbo].[Images] ([imageId])
GO
ALTER TABLE [dbo].[ImagesForTestCases] CHECK CONSTRAINT [FK_ImagesForTestCases_Images]
GO
ALTER TABLE [dbo].[ImagesForTestCases]  WITH CHECK ADD  CONSTRAINT [FK_ImagesForTestCases_TestCases] FOREIGN KEY([testCaseId])
REFERENCES [dbo].[TestCases] ([testCaseId])
GO
ALTER TABLE [dbo].[ImagesForTestCases] CHECK CONSTRAINT [FK_ImagesForTestCases_TestCases]
GO
ALTER TABLE [dbo].[ImagesForUserStories]  WITH CHECK ADD  CONSTRAINT [FK_ImagesForUserStories_Images] FOREIGN KEY([imageId])
REFERENCES [dbo].[Images] ([imageId])
GO
ALTER TABLE [dbo].[ImagesForUserStories] CHECK CONSTRAINT [FK_ImagesForUserStories_Images]
GO
ALTER TABLE [dbo].[ImagesForUserStories]  WITH CHECK ADD  CONSTRAINT [FK_ImagesForUserStories_UserStories] FOREIGN KEY([userStoryId])
REFERENCES [dbo].[UserStories] ([userStoryId])
GO
ALTER TABLE [dbo].[ImagesForUserStories] CHECK CONSTRAINT [FK_ImagesForUserStories_UserStories]
GO
ALTER TABLE [dbo].[Logins]  WITH CHECK ADD  CONSTRAINT [FK_Logins_Roles] FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([roleId])
GO
ALTER TABLE [dbo].[Logins] CHECK CONSTRAINT [FK_Logins_Roles]
GO
ALTER TABLE [dbo].[Parameters]  WITH CHECK ADD  CONSTRAINT [FK_Parameters_TestCases] FOREIGN KEY([testCaseId])
REFERENCES [dbo].[TestCases] ([testCaseId])
GO
ALTER TABLE [dbo].[Parameters] CHECK CONSTRAINT [FK_Parameters_TestCases]
GO
ALTER TABLE [dbo].[SecurityQuestions]  WITH CHECK ADD  CONSTRAINT [FK_SecurityQuestions_Logins] FOREIGN KEY([loginId])
REFERENCES [dbo].[Logins] ([loginId])
GO
ALTER TABLE [dbo].[SecurityQuestions] CHECK CONSTRAINT [FK_SecurityQuestions_Logins]
GO
ALTER TABLE [dbo].[SecurityQuestions]  WITH CHECK ADD  CONSTRAINT [FK_SecurityQuestions_Questions] FOREIGN KEY([questionId])
REFERENCES [dbo].[Questions] ([questionId])
GO
ALTER TABLE [dbo].[SecurityQuestions] CHECK CONSTRAINT [FK_SecurityQuestions_Questions]
GO
ALTER TABLE [dbo].[SprintTasks]  WITH CHECK ADD  CONSTRAINT [FK_SprintTasks_UserStories] FOREIGN KEY([userStoryId])
REFERENCES [dbo].[UserStories] ([userStoryId])
GO
ALTER TABLE [dbo].[SprintTasks] CHECK CONSTRAINT [FK_SprintTasks_UserStories]
GO
ALTER TABLE [dbo].[TestCases]  WITH CHECK ADD  CONSTRAINT [FK_TestCases_SprintTasks] FOREIGN KEY([sprintTaskId])
REFERENCES [dbo].[SprintTasks] ([sprintTaskId])
GO
ALTER TABLE [dbo].[TestCases] CHECK CONSTRAINT [FK_TestCases_SprintTasks]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Logins] FOREIGN KEY([loginId])
REFERENCES [dbo].[Logins] ([loginId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Logins]
GO
ALTER TABLE [dbo].[UsersForProjects]  WITH CHECK ADD  CONSTRAINT [FK_UsersForProjects_Projects] FOREIGN KEY([projectId])
REFERENCES [dbo].[Projects] ([projectId])
GO
ALTER TABLE [dbo].[UsersForProjects] CHECK CONSTRAINT [FK_UsersForProjects_Projects]
GO
ALTER TABLE [dbo].[UsersForProjects]  WITH CHECK ADD  CONSTRAINT [FK_UsersForProjects_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[UsersForProjects] CHECK CONSTRAINT [FK_UsersForProjects_Users]
GO
ALTER TABLE [dbo].[UsersForSprintTasks]  WITH CHECK ADD  CONSTRAINT [FK_UsersForSprintTasks_SprintTasks] FOREIGN KEY([sprintTaskId])
REFERENCES [dbo].[SprintTasks] ([sprintTaskId])
GO
ALTER TABLE [dbo].[UsersForSprintTasks] CHECK CONSTRAINT [FK_UsersForSprintTasks_SprintTasks]
GO
ALTER TABLE [dbo].[UsersForTestCases]  WITH CHECK ADD  CONSTRAINT [FK_UsersForTestCases_TestCases] FOREIGN KEY([testCaseId])
REFERENCES [dbo].[TestCases] ([testCaseId])
GO
ALTER TABLE [dbo].[UsersForTestCases] CHECK CONSTRAINT [FK_UsersForTestCases_TestCases]
GO
ALTER TABLE [dbo].[UsersForUserStories]  WITH CHECK ADD  CONSTRAINT [FK_UsersForUserStories_UserStories] FOREIGN KEY([userStoryId])
REFERENCES [dbo].[UserStories] ([userStoryId])
GO
ALTER TABLE [dbo].[UsersForUserStories] CHECK CONSTRAINT [FK_UsersForUserStories_UserStories]
GO
ALTER TABLE [dbo].[UserStories]  WITH CHECK ADD  CONSTRAINT [FK_UserStories_Projects] FOREIGN KEY([projectId])
REFERENCES [dbo].[Projects] ([projectId])
GO
ALTER TABLE [dbo].[UserStories] CHECK CONSTRAINT [FK_UserStories_Projects]
GO
USE [master]
GO
ALTER DATABASE [ScrumDB_RSLF] SET  READ_WRITE 
GO
