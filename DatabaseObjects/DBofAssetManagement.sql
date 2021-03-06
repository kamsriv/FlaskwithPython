/****** Object:  Database [AssetManager]    Script Date: 09/11/2021 14:20:36 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'AssetManager')
BEGIN
CREATE DATABASE [AssetManager] ON  PRIMARY 
( NAME = N'AssetManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\AssetManager.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AssetManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\AssetManager_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [AssetManager] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssetManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssetManager] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [AssetManager] SET ANSI_NULLS OFF
GO
ALTER DATABASE [AssetManager] SET ANSI_PADDING OFF
GO
ALTER DATABASE [AssetManager] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [AssetManager] SET ARITHABORT OFF
GO
ALTER DATABASE [AssetManager] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [AssetManager] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [AssetManager] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [AssetManager] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [AssetManager] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [AssetManager] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [AssetManager] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [AssetManager] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [AssetManager] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [AssetManager] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [AssetManager] SET  DISABLE_BROKER
GO
ALTER DATABASE [AssetManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [AssetManager] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [AssetManager] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [AssetManager] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [AssetManager] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [AssetManager] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [AssetManager] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [AssetManager] SET  READ_WRITE
GO
ALTER DATABASE [AssetManager] SET RECOVERY FULL
GO
ALTER DATABASE [AssetManager] SET  MULTI_USER
GO
ALTER DATABASE [AssetManager] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [AssetManager] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'AssetManager', N'ON'
GO
/****** Object:  ForeignKey [FK_Asset_AttachmentID]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asset_AttachmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asset]'))
ALTER TABLE [dbo].[Asset] DROP CONSTRAINT [FK_Asset_AttachmentID]
GO
/****** Object:  ForeignKey [FK_Asset_InvoiceNumber]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asset_InvoiceNumber]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asset]'))
ALTER TABLE [dbo].[Asset] DROP CONSTRAINT [FK_Asset_InvoiceNumber]
GO
/****** Object:  ForeignKey [FK_AssetLog_AssetID]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssetLog_AssetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssetLog]'))
ALTER TABLE [dbo].[AssetLog] DROP CONSTRAINT [FK_AssetLog_AssetID]
GO
/****** Object:  ForeignKey [FK_AssetLog_AttachmentID]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssetLog_AttachmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssetLog]'))
ALTER TABLE [dbo].[AssetLog] DROP CONSTRAINT [FK_AssetLog_AttachmentID]
GO
/****** Object:  StoredProcedure [dbo].[USP_UPDATEASSET]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UPDATEASSET]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_UPDATEASSET]
GO
/****** Object:  StoredProcedure [dbo].[USP_UPDATEINVOICE]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UPDATEINVOICE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_UPDATEINVOICE]
GO
/****** Object:  Table [dbo].[AssetLog]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssetLog_AssetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssetLog]'))
ALTER TABLE [dbo].[AssetLog] DROP CONSTRAINT [FK_AssetLog_AssetID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssetLog_AttachmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssetLog]'))
ALTER TABLE [dbo].[AssetLog] DROP CONSTRAINT [FK_AssetLog_AttachmentID]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AssetLog]') AND type in (N'U'))
DROP TABLE [dbo].[AssetLog]
GO
/****** Object:  StoredProcedure [dbo].[USP_CREATEASSET]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_CREATEASSET]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_CREATEASSET]
GO
/****** Object:  StoredProcedure [dbo].[USP_CREATEINVOICE]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_CREATEINVOICE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_CREATEINVOICE]
GO
/****** Object:  StoredProcedure [dbo].[USP_GETASSETS]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GETASSETS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GETASSETS]
GO
/****** Object:  StoredProcedure [dbo].[USP_GETASSETTYPES]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GETASSETTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GETASSETTYPES]
GO
/****** Object:  StoredProcedure [dbo].[USP_GETINVOICE]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GETINVOICE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GETINVOICE]
GO
/****** Object:  StoredProcedure [dbo].[USP_REGISTERUSER]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_REGISTERUSER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_REGISTERUSER]
GO
/****** Object:  StoredProcedure [dbo].[USP_TRACKREGISTERED]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_TRACKREGISTERED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_TRACKREGISTERED]
GO
/****** Object:  StoredProcedure [dbo].[USP_DELETEASSETTYPE]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DELETEASSETTYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DELETEASSETTYPE]
GO
/****** Object:  StoredProcedure [dbo].[USP_DELETEATTACHMENT]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DELETEATTACHMENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_DELETEATTACHMENT]
GO
/****** Object:  StoredProcedure [dbo].[USP_GETALLUSERS]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GETALLUSERS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GETALLUSERS]
GO
/****** Object:  StoredProcedure [dbo].[USP_CREATEASSETTYPE]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_CREATEASSETTYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_CREATEASSETTYPE]
GO
/****** Object:  StoredProcedure [dbo].[USP_CREATEATTACHMENT]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_CREATEATTACHMENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_CREATEATTACHMENT]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asset_AttachmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asset]'))
ALTER TABLE [dbo].[Asset] DROP CONSTRAINT [FK_Asset_AttachmentID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asset_InvoiceNumber]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asset]'))
ALTER TABLE [dbo].[Asset] DROP CONSTRAINT [FK_Asset_InvoiceNumber]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Asset]') AND type in (N'U'))
DROP TABLE [dbo].[Asset]
GO
/****** Object:  StoredProcedure [dbo].[USP_UPDATEASSETTYPE]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UPDATEASSETTYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_UPDATEASSETTYPE]
GO
/****** Object:  StoredProcedure [dbo].[USP_GETEMAILS]    Script Date: 09/11/2021 14:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GETEMAILS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[USP_GETEMAILS]
GO
/****** Object:  Table [dbo].[AssetType]    Script Date: 09/11/2021 14:20:38 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[AssetType_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AssetType] DROP CONSTRAINT [AssetType_IsActive]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AssetType]') AND type in (N'U'))
DROP TABLE [dbo].[AssetType]
GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 09/11/2021 14:20:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attachments]') AND type in (N'U'))
DROP TABLE [dbo].[Attachments]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 09/11/2021 14:20:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice]') AND type in (N'U'))
DROP TABLE [dbo].[Invoice]
GO
/****** Object:  UserDefinedFunction [dbo].[MinDate]    Script Date: 09/11/2021 14:20:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MinDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[MinDate]
GO
/****** Object:  Table [dbo].[tblUserRegistration]    Script Date: 09/11/2021 14:20:37 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[df_userregclick]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tblUserRegistration] DROP CONSTRAINT [df_userregclick]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUserRegistration]') AND type in (N'U'))
DROP TABLE [dbo].[tblUserRegistration]
GO
/****** Object:  Table [dbo].[tblUserRegistration]    Script Date: 09/11/2021 14:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUserRegistration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblUserRegistration](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[age] [int] NULL,
	[clicked] [int] NULL CONSTRAINT [df_userregclick]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[MinDate]    Script Date: 09/11/2021 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MinDate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[MinDate]()
RETURNS DATETIME WITH SCHEMABINDING
AS
BEGIN
    RETURN CONVERT(DATETIME, -53690)

END' 
END
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 09/11/2021 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Invoice](
	[InvoiceNumber] [varchar](50) NOT NULL,
	[Vendor] [varchar](100) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[InvoiceDate] [date] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Rate] [numeric](18, 4) NOT NULL,
	[TaxAmount] [numeric](18, 4) NOT NULL,
	[InvoiceAmount] [numeric](18, 4) NOT NULL,
	[AttachmentID] [int] NULL,
 CONSTRAINT [PK_Invoice_InvoiceNum] PRIMARY KEY CLUSTERED 
(
	[InvoiceNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 09/11/2021 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attachments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Attachments](
	[AttachmentID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Attachment] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Attachments_AttachmentID] PRIMARY KEY CLUSTERED 
(
	[AttachmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AssetType]    Script Date: 09/11/2021 14:20:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AssetType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AssetType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Classification] [varchar](50) NOT NULL,
	[IsActive] [bit] NULL CONSTRAINT [AssetType_IsActive]  DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[USP_GETEMAILS]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GETEMAILS]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[USP_GETEMAILS]
@USERID INT = NULL
AS
BEGIN
	SELECT EMAIL FROM TBLUSEREMAILS WHERE @USERID IS NULL OR USERID  = @USERID 
	AND CLICKED < 3 --GET THE DETAILS OF USERS WHOSE EMAIL SENT TIME WAS LESSER THAN 3
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UPDATEASSETTYPE]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UPDATEASSETTYPE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[USP_UPDATEASSETTYPE]
	@TYPEID INT,
	@NAME VARCHAR(50),
	@CLASSIFICATION VARCHAR(50),
	@ISACTIVE BIT
AS
BEGIN
	BEGIN TRY
	  --IF WE TRY TO UPDATE AN INACTIVE RECORD THEN THROW THE ERROR
	  IF NOT EXISTS (SELECT * FROM ASSETTYPE WHERE TYPEID = @TYPEID AND ISACTIVE = 1)
		RAISERROR(''You are trying to update an inactive Asset Type'',16,1) 
	  	  
	  UPDATE [ASSETTYPE]
		SET [NAME] = @NAME,
			[CLASSIFICATION] = @CLASSIFICATION,
			[ISACTIVE] = @ISACTIVE
		WHERE [TYPEID] = @TYPEID
		
		
	END TRY
	BEGIN CATCH
		DECLARE @ERRMESSAGE AS VARCHAR(1000)
		SELECT @ERRMESSAGE = ERROR_MESSAGE();	  
		RAISERROR(@ERRMESSAGE, 16,1);
	END CATCH
END

' 
END
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Asset]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Asset](
	[AssetID] [int] IDENTITY(1,1) NOT NULL,
	[AssetType] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[AssignedTo] [varchar](50) NOT NULL,
	[SerialNo] [varchar](100) NOT NULL,
	[AssginedOn] [date] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedOn] [date] NOT NULL,
	[Warrenty] [int] NOT NULL,
	[Location] [varchar](100) NOT NULL,
	[Remarks] [varchar](500) NOT NULL,
	[InvoiceNumber] [varchar](50) NOT NULL,
	[AssetCondition] [varchar](100) NOT NULL,
	[AttachmentID] [int] NULL,
	[Movable] [bit] NOT NULL,
 CONSTRAINT [PK_Asset_AssetID] PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[USP_CREATEATTACHMENT]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_CREATEATTACHMENT]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[USP_CREATEATTACHMENT]
	@DESCRIPTION VARCHAR(100),
	@ATTACHMENT VARBINARY(MAX)
AS
BEGIN

	DECLARE @RETVAL INT

	BEGIN TRY
		INSERT INTO [DBO].[ATTACHMENTS]
			   ([DESCRIPTION]
			   ,[ATTACHMENT])
		 VALUES
			   (@DESCRIPTION
			   ,@ATTACHMENT)           
		 SELECT @RETVAL = SCOPE_IDENTITY()
	     
		 RETURN @RETVAL
	 END TRY
	 BEGIN CATCH
	    SELECT
         ERROR_NUMBER() AS ERRORNUMBER
        ,ERROR_SEVERITY() AS ERRORSEVERITY
        ,ERROR_STATE() AS ERRORSTATE
        ,ERROR_PROCEDURE() AS ERRORPROCEDURE
        ,ERROR_LINE() AS ERRORLINE
        ,ERROR_MESSAGE() AS ERRORMESSAGE;
	 END CATCH
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CREATEASSETTYPE]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_CREATEASSETTYPE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_CREATEASSETTYPE]
	@NAME VARCHAR(50),
	@CLASSIFICATION VARCHAR(50)
AS
BEGIN
--FOR NEW ASSET TYPE SET THE ACTIVE FLAG TO 1
DECLARE @ISACTIVE BIT = 1
	BEGIN TRY
		INSERT INTO [ASSETTYPE]
           ([NAME]
           ,[CLASSIFICATION]
           ,[ISACTIVE])
     VALUES
           (@NAME
           ,@CLASSIFICATION
           ,@ISACTIVE)
	END TRY
	BEGIN CATCH
	  SELECT
        ERROR_NUMBER() AS ERRORNUMBER
        ,ERROR_SEVERITY() AS ERRORSEVERITY
        ,ERROR_STATE() AS ERRORSTATE
        ,ERROR_PROCEDURE() AS ERRORPROCEDURE
        ,ERROR_LINE() AS ERRORLINE
        ,ERROR_MESSAGE() AS ERRORMESSAGE;	  
	END CATCH
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GETALLUSERS]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GETALLUSERS]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_GETALLUSERS]
AS
BEGIN
	BEGIN TRY

	SELECT NAME, EMAIL, AGE FROM 
	TBLUSERREGISTRATION 
	END TRY
	BEGIN CATCH
		DECLARE @ERRMSG VARCHAR(1000)
		SELECT @ERRMSG = ERROR_MESSAGE()
	END CATCH
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DELETEATTACHMENT]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DELETEATTACHMENT]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_DELETEATTACHMENT]
@ATTACHMENTID INT
AS
BEGIN
  
  BEGIN TRY
    IF EXISTS (SELECT * FROM ATTACHMENTS WHERE ATTACHMENTID = @ATTACHMENTID)
    BEGIN
       RAISERROR(''NO ATTACHMENT FOUND WITH THE ATTACHMENT ID'',16,1)
    END
  
	DELETE ATTACHMENTS 
	WHERE ATTACHMENTID = @ATTACHMENTID
  END TRY
  BEGIN CATCH
	SELECT
        ERROR_NUMBER() AS ERRORNUMBER
        ,ERROR_SEVERITY() AS ERRORSEVERITY
        ,ERROR_STATE() AS ERRORSTATE
        ,ERROR_PROCEDURE() AS ERRORPROCEDURE
        ,ERROR_LINE() AS ERRORLINE
        ,ERROR_MESSAGE() AS ERRORMESSAGE;
  END CATCH
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DELETEASSETTYPE]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_DELETEASSETTYPE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_DELETEASSETTYPE]
	@TYPEID INT,
	@ISACTIVE BIT = 0
AS
BEGIN
	BEGIN TRY
	  --IF WE TRY TO UPDATE AN INACTIVE RECORD THEN THROW THE ERROR
	  IF NOT EXISTS (SELECT * FROM ASSETTYPE WHERE TYPEID = @TYPEID AND ISACTIVE = 1)
		RAISERROR(''You are trying to delete Asset Type which is already deleted'',16,1) 
	  	  
	  UPDATE [ASSETTYPE]
		SET [ISACTIVE] = @ISACTIVE
		WHERE [TYPEID] = @TYPEID
		
	END TRY
	BEGIN CATCH
		DECLARE @ERRMESSAGE AS VARCHAR(1000)
		SELECT @ERRMESSAGE = ERROR_MESSAGE();	  
		RAISERROR(@ERRMESSAGE, 16,1);
	END CATCH
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_TRACKREGISTERED]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_TRACKREGISTERED]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_TRACKREGISTERED]
@USERID VARCHAR(100)
AS
BEGIN
	DECLARE @CLICKCOUNT INT
	
	SELECT @CLICKCOUNT = CLICKED FROM TBLUSERREGISTRATION WHERE USERID=@USERID
	SET @CLICKCOUNT = ISNULL(@CLICKCOUNT,0) + 1 --COUNT INCRIMENT EVERY TIME EMAIL WAS SENT.

	UPDATE DBO.TBLUSERREGISTRATION
	SET CLICKED = @CLICKCOUNT WHERE USERID=@USERID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_REGISTERUSER]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_REGISTERUSER]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_REGISTERUSER]
@NAME VARCHAR(100),
@EMAIL VARCHAR(100),
@AGE INT
AS
BEGIN
	BEGIN TRY

	IF EXISTS (SELECT * FROM TBLUSERREGISTRATION WHERE NAME = @NAME)
		RAISERROR(''USER ALREADY REGISTERED'',16,1)

		INSERT INTO TBLUSERREGISTRATION(NAME,EMAIL,AGE)
		VALUES(@NAME, @EMAIL, @AGE)
		SELECT SCOPE_IDENTITY()
	END TRY
	BEGIN CATCH
		DECLARE @ERRMSG VARCHAR(1000)
		SELECT @ERRMSG = ERROR_MESSAGE()
	END CATCH
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GETINVOICE]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GETINVOICE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_GETINVOICE]
	@INVOICENUMBER VARCHAR(50) = NULL
AS
BEGIN

	BEGIN TRY
		SELECT [INVOICENUMBER]
		  ,[VENDOR]
		  ,[ORDERDATE]
		  ,[INVOICEDATE]
		  ,[QUANTITY]
		  ,[RATE]
		  ,[TAXAMOUNT]
		  ,[INVOICEAMOUNT]
		  ,[ATTACHMENTID]
	  FROM [INVOICE]
	  WHERE @INVOICENUMBER IS NULL OR INVOICENUMBER = @INVOICENUMBER
	END TRY
	 BEGIN CATCH
	    SELECT
         ERROR_NUMBER() AS ERRORNUMBER
        ,ERROR_SEVERITY() AS ERRORSEVERITY
        ,ERROR_STATE() AS ERRORSTATE
        ,ERROR_PROCEDURE() AS ERRORPROCEDURE
        ,ERROR_LINE() AS ERRORLINE
        ,ERROR_MESSAGE() AS ERRORMESSAGE;
	 END CATCH
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GETASSETTYPES]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GETASSETTYPES]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[USP_GETASSETTYPES]
@ASSETTYPEID INT = NULL,
@SEARCHTEXT VARCHAR(100) = NULL,
@PAGENUM INT = 1,
@PAGESIZE INT = 100
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @ROWS_BEGIN INT, @ROWS_END INT
	
	SELECT @ROWS_BEGIN = (@PAGENUM - 1) * @PAGESIZE + 1
	SELECT @ROWS_END =  @PAGENUM * @PAGESIZE  
	
	
		SELECT ROW_NUMBER() OVER(ORDER BY TYPEID) AS SEQ
			 , TYPEID
			 , NAME
		     , CLASSIFICATION 
		     , ISACTIVE
		     --, COUNT(*) OVER() TOTALRECS --WE CAN GET THE COUNT OF ROWS RETURNED BY QUERY IN THE SAME RESULT SET
		INTO #TEMP_TBL_PAGING
		FROM ASSETTYPE 
		WHERE ((@ASSETTYPEID IS NOT NULL OR ISACTIVE = 1) AND --IF ASSET TYPE ID IS GIVNE DON''T CHECK FOR IS ACTIVE FLAG
			  @ASSETTYPEID IS NULL OR TYPEID = @ASSETTYPEID) AND
			  @SEARCHTEXT IS NULL OR NAME LIKE @SEARCHTEXT +''%''
	--MAIN RESULT SET 		  
	SELECT TYPEID
		 , NAME
		 , CLASSIFICATION
		 , ISACTIVE 
	FROM #TEMP_TBL_PAGING
	WHERE SEQ BETWEEN @ROWS_BEGIN AND @ROWS_END
	--PAGER DETAILS	
	SELECT CEILING(COUNT(*) /CAST(@PAGESIZE AS DECIMAL)) TOTAL_PAGES FROM #TEMP_TBL_PAGING
	
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GETASSETS]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_GETASSETS]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_GETASSETS]
@ASSETID INT = NULL
AS
BEGIN
		SELECT A.[ASSETID]
			  ,B.[NAME]
			  ,A.[DESCRIPTION]
			  ,A.[ASSIGNEDTO]
			  ,A.[SERIALNO]
			  ,A.[ASSGINEDON]
			  ,A.[CREATEDBY]
			  ,A.[CREATEDON]
			  ,A.[WARRENTY]
			  ,A.[LOCATION]
			  ,A.[REMARKS]
			  ,A.[INVOICENUMBER]
			  ,A.[ASSETCONDITION]
			  ,A.[ATTACHMENTID]
		  FROM [ASSET] A
		  JOIN [ASSETTYPE] B
		  ON A.ASSETTYPE = B.TYPEID
		  WHERE @ASSETID IS NULL OR A.[AssetID] = @ASSETID
  
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CREATEINVOICE]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_CREATEINVOICE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[USP_CREATEINVOICE]
	@INVOICENUMBER VARCHAR(100)
   ,@VENDOR VARCHAR(100)
   ,@ORDERDATE DATETIME
   ,@INVOICEDATE DATETIME
   ,@QUANTITY INT
   ,@RATE NUMERIC(18,4)
   ,@TAXAMOUNT NUMERIC(18,4)
   ,@INVOICEAMOUNT NUMERIC(18,4)   
   ,@DESCRIPTION VARCHAR(100)
   ,@FILE VARBINARY(MAX)
AS
BEGIN


BEGIN TRY
DECLARE @ATTACHMENTID INT
	BEGIN  TRANSACTION
	EXEC @ATTACHMENTID = USP_CREATEATTACHMENT @DESCRIPTION, @FILE

	INSERT INTO [INVOICE]
           ([INVOICENUMBER]
           ,[VENDOR]
           ,[ORDERDATE]
           ,[INVOICEDATE]
           ,[QUANTITY]
           ,[RATE]
           ,[TAXAMOUNT]
           ,[INVOICEAMOUNT]
           ,[ATTACHMENTID])
     VALUES
           (@INVOICENUMBER
           ,@VENDOR
           ,@ORDERDATE
           ,@INVOICEDATE
           ,@QUANTITY
           ,@RATE
           ,@TAXAMOUNT
           ,@INVOICEAMOUNT
           ,@ATTACHMENTID
           )
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
	SELECT
        ERROR_NUMBER() AS ERRORNUMBER
        ,ERROR_SEVERITY() AS ERRORSEVERITY
        ,ERROR_STATE() AS ERRORSTATE
        ,ERROR_PROCEDURE() AS ERRORPROCEDURE
        ,ERROR_LINE() AS ERRORLINE
        ,ERROR_MESSAGE() AS ERRORMESSAGE;
        
    IF @@TRANCOUNT > 0
    BEGIN
		ROLLBACK TRANSACTION
    END
END CATCH        
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CREATEASSET]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_CREATEASSET]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[USP_CREATEASSET]
	@ASSETTYPE INT,
	@DESCRIPTION VARCHAR(100),
	@ASSIGNEDTO VARCHAR(50),
	@SERIALNO VARCHAR(100),
	@ASSIGNEDON DATETIME,
	@CREATEDBY VARCHAR(50),
	@CREATEDON DATETIME,
	@WARRENTY INT,
	@LOCATION VARCHAR(100),
	@REMARKS VARCHAR(500),
	@INVOICENUMBER VARCHAR(50),
	@ASSETCONDITION VARCHAR(100),
	@MOVABLE BIT
AS
BEGIN

DECLARE @ATTACHMENTID INT, 
		@ASSETID INT

BEGIN TRY
	SELECT @ATTACHMENTID = ATTACHMENTID 
	FROM INVOICE 
	WHERE INVOICENUMBER = @INVOICENUMBER

	IF @ATTACHMENTID IS NULL
	BEGIN
		RAISERROR(''INVOICE IS MISSING THE ATTACHMENT'',16,1)
	END

--NEED TO DO - CREATING THE ASSET RECORDS BASED ON THE QUANTITY FOR ALL THE SERIAL NUMBERS, THAT WERE PASSED ON 
INSERT INTO [ASSET]
           ([ASSETTYPE]
           ,[DESCRIPTION]
           ,[ASSIGNEDTO]
           ,[SERIALNO]
           ,[ASSGINEDON]
           ,[CREATEDBY]
           ,[CREATEDON]
           ,[WARRENTY]
           ,[LOCATION]
           ,[REMARKS]
           ,[INVOICENUMBER]
           ,[ASSETCONDITION]
           ,[ATTACHMENTID]
           ,[MOVABLE]
           )
     VALUES
           (@ASSETTYPE,
			@DESCRIPTION,
			@ASSIGNEDTO,
			@SERIALNO ,
			@ASSIGNEDON ,
			@CREATEDBY ,
			@CREATEDON ,
			@WARRENTY ,
			@LOCATION ,
			@REMARKS ,
			@INVOICENUMBER,
			@ASSETCONDITION,
			@ATTACHMENTID,
			@MOVABLE)
    
    SELECT @ASSETID = SCOPE_IDENTITY()
    SELECT @ASSETID
END TRY
BEGIN CATCH
	SELECT
        ERROR_NUMBER() AS ERRORNUMBER
        ,ERROR_SEVERITY() AS ERRORSEVERITY
        ,ERROR_STATE() AS ERRORSTATE
        ,ERROR_PROCEDURE() AS ERRORPROCEDURE
        ,ERROR_LINE() AS ERRORLINE
        ,ERROR_MESSAGE() AS ERRORMESSAGE;
END CATCH        
END


' 
END
GO
/****** Object:  Table [dbo].[AssetLog]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AssetLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AssetLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[AssetID] [int] NOT NULL,
	[AssetType] [int] NOT NULL,
	[ServicedOn] [date] NOT NULL,
	[ServiceReason] [varchar](1000) NOT NULL,
	[VendorTicketID] [varchar](20) NULL,
	[Description] [varchar](500) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[SerialNo] [varchar](50) NOT NULL,
	[AssignedTo] [varchar](50) NOT NULL,
	[AssignedOn] [date] NOT NULL,
	[AssetCondition] [varchar](100) NOT NULL,
	[UpdatedDate] [date] NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AttachmentID] [int] NULL,
	[Remarks] [varchar](1000) NOT NULL,
	[Movable] [bit] NOT NULL,
 CONSTRAINT [PK_AssetLog_LogID] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[USP_UPDATEINVOICE]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UPDATEINVOICE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[USP_UPDATEINVOICE]
	@INVOICENUMBER VARCHAR(100)
   ,@VENDOR VARCHAR(100)
   ,@ORDERDATE DATETIME
   ,@INVOICEDATE DATETIME
   ,@QUANTITY INT
   ,@RATE NUMERIC(18,4)
   ,@TAXAMOUNT NUMERIC(18,4)
   ,@INVOICEAMOUNT NUMERIC(18,4)
   ,@ATTACHMENTID INT
   ,@DESCRIPTION VARCHAR(100)
   ,@ATTACHMENT VARBINARY(MAX) = NULL
AS
BEGIN


BEGIN TRY
		
	BEGIN  TRANSACTION
	--IF THERE IS NO FILE THEN DON''T CREATE THE ATTACHMENT
	IF @ATTACHMENT IS NOT NULL 
	BEGIN
		--IF FILE IS THERE THEN DELETE THE EXISTING ATTACHMENT AND CREATE NEW ONE WITH THE ATTACHED FILE
		EXEC USP_DELETEATTACHMENT @ATTACHMENTID 
		EXEC @ATTACHMENTID = USP_CREATEATTACHMENT @DESCRIPTION, @ATTACHMENT
	END
		
	UPDATE [INVOICE]
		SET [INVOICENUMBER] = @INVOICENUMBER
           ,[VENDOR] = @VENDOR
           ,[ORDERDATE] = @ORDERDATE
           ,[INVOICEDATE] = @INVOICEDATE
           ,[QUANTITY] = @QUANTITY
           ,[RATE] = @RATE
           ,[TAXAMOUNT] = @TAXAMOUNT
           ,[INVOICEAMOUNT] = @INVOICEAMOUNT
           ,[ATTACHMENTID] = @ATTACHMENTID
		WHERE [INVOICENUMBER] = @INVOICENUMBER
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
	SELECT
        ERROR_NUMBER() AS ERRORNUMBER
        ,ERROR_SEVERITY() AS ERRORSEVERITY
        ,ERROR_STATE() AS ERRORSTATE
        ,ERROR_PROCEDURE() AS ERRORPROCEDURE
        ,ERROR_LINE() AS ERRORLINE
        ,ERROR_MESSAGE() AS ERRORMESSAGE;
        
    IF @@TRANCOUNT > 0
    BEGIN
		ROLLBACK TRANSACTION
    END
END CATCH        
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UPDATEASSET]    Script Date: 09/11/2021 14:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USP_UPDATEASSET]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[USP_UPDATEASSET]
    @ASSETID INT,
	@ASSETTYPE INT,
	@DESCRIPTION VARCHAR(100),
	@ASSIGNEDTO VARCHAR(50),
	@SERIALNO VARCHAR(100),
	@ASSIGNEDON DATETIME,
	@UPDATEDBY VARCHAR(50), --CREATED BY AND CREATED ON will be always there no changes.
	@UPDATEDON DATETIME,
	@WARRENTY INT,
	@LOCATION VARCHAR(100),
	@REMARKS VARCHAR(500),
	@INVOICENUMBER VARCHAR(50),
	@ASSETCONDITION VARCHAR(100),
	@MOVABLE BIT,
	@ATTACHMENTDESC VARCHAR(100) = NULL, --If there is any damage then we can take picture
	@FILE VARBINARY(MAX) = NULL,
	@SERVICEDON DATETIME = NULL , --Service information
	@SERVICEREASON VARCHAR(1000) = '''',
	@VENDORTICKETID VARCHAR(20)	
AS
BEGIN

BEGIN TRY
	DECLARE @TODAY DATETIME = GETDATE()
	DECLARE @ATTACHMENTID INT

    IF @SERVICEDON IS NULL
    BEGIN
		SELECT @SERVICEDON = dbo.MinDate()
    END
    
    --IF THE FILE IS THERE THEN CREATE THE ATTACHEMENT AND ASSIGN IT OTHERWISE DON''T UPDATE EXISTED ONE
	IF @FILE IS NOT NULL
	BEGIN
		EXEC @ATTACHMENTID = [USP_CREATEATTACHMENT] @ATTACHMENTDESC, @FILE
	END
	ELSE
	BEGIN
		SELECT @ATTACHMENTID = ATTACHMENTID FROM ASSET WHERE ASSETID = @ASSETID
	END
	
	
	--FOR WHICH CHANGES WE CAN LOG THE RECORDS.
	   INSERT INTO [DBO].[ASSETLOG]
           ([ASSETID]
           ,[ASSETTYPE]
           ,[SERVICEDON]
           ,[SERVICEREASON]
           ,[VENDORTICKETID]
           ,[DESCRIPTION]
           ,[INVOICEID]
           ,[SERIALNO]
           ,[ASSIGNEDTO]
           ,[ASSIGNEDON]
           ,[ASSETCONDITION]
           ,[UPDATEDDATE]
           ,[UPDATEDBY]
           ,[ATTACHMENTID]
           ,[REMARKS]
           ,[MOVABLE])
		SELECT [ASSETID]
			  ,[ASSETTYPE]
			  ,@SERVICEDON
			  ,@SERVICEREASON
			  ,@VENDORTICKETID
			  ,[DESCRIPTION]
			  ,[INVOICENUMBER]
			  ,[SERIALNO]
			  ,[ASSIGNEDTO]
			  ,[ASSGINEDON]
			  ,[ASSETCONDITION]
			  ,@TODAY
			  ,@UPDATEDBY
			  ,[ATTACHMENTID]
			  ,[REMARKS]
			  ,[MOVABLE]
		  FROM [DBO].[ASSET]
		  WHERE ASSETID = @ASSETID

--NEED TO DO - CREATING THE ASSET RECORDS BASED ON THE QUANTITY FOR ALL THE SERIAL NUMBERS, THAT WERE PASSED ON 
	UPDATE [ASSET]
			SET [ASSETTYPE] = @ASSETTYPE
			   ,[DESCRIPTION] = @DESCRIPTION
			   ,[ASSIGNEDTO] = @ASSIGNEDTO
			   ,[SERIALNO] = @SERIALNO
			   ,[ASSGINEDON] = @ASSIGNEDON
			   ,[WARRENTY] = @WARRENTY
			   ,[LOCATION] = @LOCATION
			   ,[REMARKS] = @REMARKS
			   ,[INVOICENUMBER] = @INVOICENUMBER
			   ,[ASSETCONDITION] = @ASSETCONDITION
			   ,[ATTACHMENTID] = @ATTACHMENTID
			   ,[MOVABLE] = @MOVABLE
			WHERE ASSETID = @ASSETID
END TRY
BEGIN CATCH
	SELECT
        ERROR_NUMBER() AS ERRORNUMBER
        ,ERROR_SEVERITY() AS ERRORSEVERITY
        ,ERROR_STATE() AS ERRORSTATE
        ,ERROR_PROCEDURE() AS ERRORPROCEDURE
        ,ERROR_LINE() AS ERRORLINE
        ,ERROR_MESSAGE() AS ERRORMESSAGE;
END CATCH        
END


' 
END
GO
/****** Object:  ForeignKey [FK_Asset_AttachmentID]    Script Date: 09/11/2021 14:20:39 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asset_AttachmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asset]'))
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_AttachmentID] FOREIGN KEY([AttachmentID])
REFERENCES [dbo].[Attachments] ([AttachmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asset_AttachmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asset]'))
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_AttachmentID]
GO
/****** Object:  ForeignKey [FK_Asset_InvoiceNumber]    Script Date: 09/11/2021 14:20:39 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asset_InvoiceNumber]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asset]'))
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_InvoiceNumber] FOREIGN KEY([InvoiceNumber])
REFERENCES [dbo].[Invoice] ([InvoiceNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asset_InvoiceNumber]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asset]'))
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_InvoiceNumber]
GO
/****** Object:  ForeignKey [FK_AssetLog_AssetID]    Script Date: 09/11/2021 14:20:39 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssetLog_AssetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssetLog]'))
ALTER TABLE [dbo].[AssetLog]  WITH CHECK ADD  CONSTRAINT [FK_AssetLog_AssetID] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Asset] ([AssetID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssetLog_AssetID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssetLog]'))
ALTER TABLE [dbo].[AssetLog] CHECK CONSTRAINT [FK_AssetLog_AssetID]
GO
/****** Object:  ForeignKey [FK_AssetLog_AttachmentID]    Script Date: 09/11/2021 14:20:39 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssetLog_AttachmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssetLog]'))
ALTER TABLE [dbo].[AssetLog]  WITH CHECK ADD  CONSTRAINT [FK_AssetLog_AttachmentID] FOREIGN KEY([AttachmentID])
REFERENCES [dbo].[Attachments] ([AttachmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AssetLog_AttachmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[AssetLog]'))
ALTER TABLE [dbo].[AssetLog] CHECK CONSTRAINT [FK_AssetLog_AttachmentID]
GO
