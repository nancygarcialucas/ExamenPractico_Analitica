USE [master]
GO
/****** Object:  Database [dportenis]    Script Date: 28/06/2022 08:51:46 p. m. ******/
CREATE DATABASE [dportenis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dportenis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dportenis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dportenis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dportenis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dportenis] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dportenis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dportenis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dportenis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dportenis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dportenis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dportenis] SET ARITHABORT OFF 
GO
ALTER DATABASE [dportenis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dportenis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dportenis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dportenis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dportenis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dportenis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dportenis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dportenis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dportenis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dportenis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dportenis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dportenis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dportenis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dportenis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dportenis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dportenis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dportenis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dportenis] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dportenis] SET  MULTI_USER 
GO
ALTER DATABASE [dportenis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dportenis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dportenis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dportenis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dportenis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dportenis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dportenis] SET QUERY_STORE = OFF
GO
USE [dportenis]
GO
/****** Object:  Table [dbo].[addresses]    Script Date: 28/06/2022 08:51:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addresses](
	[id_address] [int] IDENTITY(1,1) NOT NULL,
	[street] [varchar](100) NULL,
	[number] [varchar](50) NULL,
	[neighborhood] [varchar](100) NULL,
	[city] [varchar](100) NULL,
	[state] [varchar](100) NULL,
	[zipcode] [varchar](50) NULL,
	[status] [tinyint] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[updated_by] [varchar](50) NULL,
	[creation_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[distributors]    Script Date: 28/06/2022 08:51:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distributors](
	[id_distributor] [int] IDENTITY(1,1) NOT NULL,
	[id_person] [int] NOT NULL,
	[number] [varchar](50) NOT NULL,
	[status] [tinyint] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[updated_by] [varchar](50) NULL,
	[creation_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persons]    Script Date: 28/06/2022 08:51:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persons](
	[id_person] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[middle_name] [varchar](50) NULL,
	[last_name] [varchar](50) NOT NULL,
	[second_last_name] [varchar](50) NULL,
	[birthdate] [date] NOT NULL,
	[gender] [char](1) NULL,
	[nationality] [varchar](50) NULL,
	[curp] [varchar](18) NULL,
	[rfc] [varchar](13) NULL,
	[created_by] [varchar](50) NOT NULL,
	[updated_by] [varchar](50) NULL,
	[creation_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persons_addresses]    Script Date: 28/06/2022 08:51:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persons_addresses](
	[id_person_address] [int] IDENTITY(1,1) NOT NULL,
	[id_person] [int] NOT NULL,
	[id_address] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persons_phone_numbers]    Script Date: 28/06/2022 08:51:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persons_phone_numbers](
	[id_person_phone_number] [int] IDENTITY(1,1) NOT NULL,
	[id_person] [int] NOT NULL,
	[id_phone_number] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phone_numbers]    Script Date: 28/06/2022 08:51:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phone_numbers](
	[id_phone_number] [int] IDENTITY(1,1) NOT NULL,
	[number] [varchar](50) NOT NULL,
	[status] [tinyint] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[updated_by] [varchar](50) NULL,
	[creation_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[addresses] ON 

INSERT [dbo].[addresses] ([id_address], [street], [number], [neighborhood], [city], [state], [zipcode], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (1, N'Girasoles', N'5216', N'Flores Magon', N'Mazatlan', N'Sinaloa', N'82190', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[addresses] ([id_address], [street], [number], [neighborhood], [city], [state], [zipcode], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (2, N'Rosas', N'5217', N'Flores Magon', N'Mazatlan', N'Sinaloa', N'82190', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[addresses] ([id_address], [street], [number], [neighborhood], [city], [state], [zipcode], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (3, N'Olivos', N'18020', N'Foresta', N'Mazatlan', N'Sinaloa', N'82114', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[addresses] ([id_address], [street], [number], [neighborhood], [city], [state], [zipcode], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (4, N'Melchor Ocampo', N'1005', N'Centro', N'Mazatlan', N'Sinaloa', N'82115', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[addresses] ([id_address], [street], [number], [neighborhood], [city], [state], [zipcode], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (5, N'Jose Azueta', N'1914', N'Centro', N'Mazatlan', N'Sinaloa', N'82000', 1, N'nagrcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[distributors] ON 

INSERT [dbo].[distributors] ([id_distributor], [id_person], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (1, 1, N'70000000', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[distributors] ([id_distributor], [id_person], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (3, 5, N'70000001', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[distributors] ([id_distributor], [id_person], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (4, 6, N'70000002', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[distributors] ([id_distributor], [id_person], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (5, 7, N'70000003', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[distributors] ([id_distributor], [id_person], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (6, 8, N'70000004', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[distributors] OFF
GO
SET IDENTITY_INSERT [dbo].[persons] ON 

INSERT [dbo].[persons] ([id_person], [name], [middle_name], [last_name], [second_last_name], [birthdate], [gender], [nationality], [curp], [rfc], [created_by], [updated_by], [creation_date], [update_date]) VALUES (1, N'Nancy', NULL, N'Garcia', NULL, CAST(N'1996-09-10' AS Date), N'F', N'Mexicana', N'GALN960910MSLRCN06', N'GALN9609105', N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[persons] ([id_person], [name], [middle_name], [last_name], [second_last_name], [birthdate], [gender], [nationality], [curp], [rfc], [created_by], [updated_by], [creation_date], [update_date]) VALUES (5, N'Jose', N'Roberto', N'Tirado', N'Salas', CAST(N'1996-09-22' AS Date), N'M', N'Mexicana', N'TISR22099610MSLRCN', N'TISR22099660', N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[persons] ([id_person], [name], [middle_name], [last_name], [second_last_name], [birthdate], [gender], [nationality], [curp], [rfc], [created_by], [updated_by], [creation_date], [update_date]) VALUES (6, N'Christian', N'Manuel', N'Jimenez', N'Martinez', CAST(N'1995-02-05' AS Date), N'M', N'Mexicana', N'JIMC950205MSLRCN06', N'JIMC9502055', N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[persons] ([id_person], [name], [middle_name], [last_name], [second_last_name], [birthdate], [gender], [nationality], [curp], [rfc], [created_by], [updated_by], [creation_date], [update_date]) VALUES (7, N'Ramiro', NULL, N'Garcia', NULL, CAST(N'1970-06-14' AS Date), N'M', N'Mexicana', N'GAOR700614MSLRCN06', N'GAOR7006145', N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[persons] ([id_person], [name], [middle_name], [last_name], [second_last_name], [birthdate], [gender], [nationality], [curp], [rfc], [created_by], [updated_by], [creation_date], [update_date]) VALUES (8, N'Irma', N'Elizabeth', N'Lucas', N'Garcia', CAST(N'1980-03-31' AS Date), N'F', N'Mexicana', N'LUGI800331MSLRCN06', N'LUGI8003315', N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[persons] OFF
GO
SET IDENTITY_INSERT [dbo].[persons_addresses] ON 

INSERT [dbo].[persons_addresses] ([id_person_address], [id_person], [id_address]) VALUES (1, 1, 1)
INSERT [dbo].[persons_addresses] ([id_person_address], [id_person], [id_address]) VALUES (2, 5, 2)
INSERT [dbo].[persons_addresses] ([id_person_address], [id_person], [id_address]) VALUES (3, 6, 3)
INSERT [dbo].[persons_addresses] ([id_person_address], [id_person], [id_address]) VALUES (4, 7, 4)
INSERT [dbo].[persons_addresses] ([id_person_address], [id_person], [id_address]) VALUES (5, 8, 5)
SET IDENTITY_INSERT [dbo].[persons_addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[persons_phone_numbers] ON 

INSERT [dbo].[persons_phone_numbers] ([id_person_phone_number], [id_person], [id_phone_number]) VALUES (1, 1, 2)
INSERT [dbo].[persons_phone_numbers] ([id_person_phone_number], [id_person], [id_phone_number]) VALUES (3, 5, 3)
INSERT [dbo].[persons_phone_numbers] ([id_person_phone_number], [id_person], [id_phone_number]) VALUES (4, 6, 4)
INSERT [dbo].[persons_phone_numbers] ([id_person_phone_number], [id_person], [id_phone_number]) VALUES (5, 7, 5)
INSERT [dbo].[persons_phone_numbers] ([id_person_phone_number], [id_person], [id_phone_number]) VALUES (6, 8, 6)
INSERT [dbo].[persons_phone_numbers] ([id_person_phone_number], [id_person], [id_phone_number]) VALUES (7, 1, 7)
INSERT [dbo].[persons_phone_numbers] ([id_person_phone_number], [id_person], [id_phone_number]) VALUES (8, 5, 8)
INSERT [dbo].[persons_phone_numbers] ([id_person_phone_number], [id_person], [id_phone_number]) VALUES (9, 6, 9)
INSERT [dbo].[persons_phone_numbers] ([id_person_phone_number], [id_person], [id_phone_number]) VALUES (10, 7, 10)
INSERT [dbo].[persons_phone_numbers] ([id_person_phone_number], [id_person], [id_phone_number]) VALUES (11, 8, 11)
SET IDENTITY_INSERT [dbo].[persons_phone_numbers] OFF
GO
SET IDENTITY_INSERT [dbo].[phone_numbers] ON 

INSERT [dbo].[phone_numbers] ([id_phone_number], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (2, N'6699935251', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[phone_numbers] ([id_phone_number], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (3, N'6692806599', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[phone_numbers] ([id_phone_number], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (4, N'6699934470', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[phone_numbers] ([id_phone_number], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (5, N'6692232060', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[phone_numbers] ([id_phone_number], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (6, N'6691654192', 1, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[phone_numbers] ([id_phone_number], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (7, N'6692224599', 0, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[phone_numbers] ([id_phone_number], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (8, N'6692683667', 0, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[phone_numbers] ([id_phone_number], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (9, N'6691220249', 0, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[phone_numbers] ([id_phone_number], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (10, N'6692464705', 0, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[phone_numbers] ([id_phone_number], [number], [status], [created_by], [updated_by], [creation_date], [update_date]) VALUES (11, N'6949518582', 0, N'ngarcia', NULL, CAST(N'2022-06-28T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[phone_numbers] OFF
GO
USE [master]
GO
ALTER DATABASE [dportenis] SET  READ_WRITE 
GO

----------------------------------------------------------------------
----------------------- EJERCICIOS -----------------------------------
----------------------------------------------------------------------

----------------------------------------------------------------------
-- a. Consulta la tabla distributors para obtener todos los campos. --
----------------------------------------------------------------------

SELECT * FROM distributors

----------------------------------------------------------------------
-- Con los resultados del punto anterior, realiza una unión de la   --
-- tabla distribuitors ala de persons, para obtener todos los datos --
-- de esa tabla y concatenarlos de la siguiente manera; nombre +    --
-- apellido paterno + apellido materno con el alias nombre_completo.--
----------------------------------------------------------------------

SELECT d.*, CONCAT(p.name,' ', ISNULL(p.middle_name,''),' ', p.last_name,' ', ISNULL(p.second_last_name,'')) AS nombre_completo
FROM distributors d
INNER JOIN persons p ON d.id_person = p.id_person
WHERE d.status = 1

----------------------------------------------------------------------
-- c. Posteriormente realiza una unión con los resultados obtenidos --
-- en el punto anterior, de la tabla persons a addresses para obtener- 
-- todos los datos y concatenarlos de la siguiente manera:			--
-- i. Ej. Calle: emiliano Zapata, #12000, Colonia: “Francisco Villa”--
----------------------------------------------------------------------
SELECT 
	d.number AS numero_distribuidor, 
	CONCAT(p.name,' ', ISNULL(p.middle_name,''),' ', p.last_name,' ', ISNULL(p.second_last_name,'')) AS nombre_completo,
	CONCAT(ISNULL(CONCAT('Calle: ', a.street),''),' ', ISNULL(CONCAT('#', a.number),''),' ',ISNULL(CONCAT('Colonia: ', a.neighborhood),''))  AS direccion
FROM distributors d
INNER JOIN persons p ON d.id_person = p.id_person
INNER JOIN persons_addresses pa ON p.id_person = pa.id_person
INNER JOIN addresses a ON pa.id_address = a.id_address
WHERE d.status = 1 AND a.status = 1

----------------------------------------------------------------------
-- d. Por último obtén los datos del número de teléfono del		    --
-- distribuidor haciendo una unión con los resultados obtenidos en  --
-- el punto anterior, de la tabla persons a phone_numers, donde		--
-- mostrará únicamente el número que tenga activo actualmente.		--
----------------------------------------------------------------------

SELECT 
	d.number AS numero_distribuidor, 
	CONCAT(p.name,' ', ISNULL(p.middle_name,''),' ', p.last_name,' ', ISNULL(p.second_last_name,'')) AS nombre_completo,
	CONCAT(ISNULL(CONCAT('Calle: ', a.street),''),' ', ISNULL(CONCAT('#', a.number),''),' ',ISNULL(CONCAT('Colonia: ', a.neighborhood),''))  AS direccion,
	pn.number AS telefono_activo
FROM distributors d
INNER JOIN persons p ON d.id_person = p.id_person
INNER JOIN persons_addresses pa ON p.id_person = pa.id_person
INNER JOIN addresses a ON pa.id_address = a.id_address
INNER JOIN persons_phone_numbers ppn ON p.id_person = ppn.id_person
INNER JOIN phone_numbers pn ON ppn.id_phone_number = pn.id_phone_number
WHERE d.status = 1 AND a.status = 1 AND pn.status = 1