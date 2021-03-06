USE [master]
GO
/****** Object:  Database [BIBLIOTECA ]    Script Date: 05/03/2020 5:58:58 p. m. ******/
CREATE DATABASE [BIBLIOTECA ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BIBLIOTECA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BIBLIOTECA .mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BIBLIOTECA _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BIBLIOTECA _log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BIBLIOTECA ] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BIBLIOTECA ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BIBLIOTECA ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET ARITHABORT OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BIBLIOTECA ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BIBLIOTECA ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BIBLIOTECA ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BIBLIOTECA ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BIBLIOTECA ] SET  MULTI_USER 
GO
ALTER DATABASE [BIBLIOTECA ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BIBLIOTECA ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BIBLIOTECA ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BIBLIOTECA ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BIBLIOTECA ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BIBLIOTECA ] SET QUERY_STORE = OFF
GO
USE [BIBLIOTECA ]
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
USE [BIBLIOTECA ]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 05/03/2020 5:58:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[IdArea] [int] IDENTITY(1,1) NOT NULL,
	[NombreArea] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[IdArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[IdEditorial] [int] IDENTITY(1,1) NOT NULL,
	[NombreEditorial] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Editorial] PRIMARY KEY CLUSTERED 
(
	[IdEditorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[IdLibro] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[IdEditorial] [int] NOT NULL,
	[IdArea] [int] NOT NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[LibroView]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LibroView]
AS
SELECT        L.IdLibro, L.Titulo, E.IdEditorial, E.NombreEditorial AS Editorial, A.IdArea, A.NombreArea AS Area
FROM            dbo.Libro AS L INNER JOIN
                         dbo.Area AS A ON L.IdArea = A.IdArea INNER JOIN
                         dbo.Editorial AS E ON L.IdEditorial = E.IdEditorial
GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo](
	[IdPrestamo] [int] IDENTITY(1,1) NOT NULL,
	[IdLector] [int] NOT NULL,
	[IdLibro] [int] NOT NULL,
	[FechaPrestamo] [date] NOT NULL,
	[FechaDevolucion] [date] NOT NULL,
	[Devuelto] [bit] NOT NULL,
 CONSTRAINT [PK_Prestamo] PRIMARY KEY CLUSTERED 
(
	[IdPrestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiante](
	[IdLector] [int] IDENTITY(1,1) NOT NULL,
	[CI] [varchar](50) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[IdCarrera] [int] NOT NULL,
	[Edad] [int] NOT NULL,
 CONSTRAINT [PK_Estudiante] PRIMARY KEY CLUSTERED 
(
	[IdLector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PrestamoView]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PrestamoView]
AS
SELECT        P.IdPrestamo, E.IdLector, E.Nombre + ' ' + E.Apellido AS Estudiante, P.FechaPrestamo, P.FechaDevolucion, P.Devuelto, L.IdLibro, L.Titulo, Ed.IdEditorial, Ed.NombreEditorial AS 'Editorial'
FROM            dbo.Estudiante AS E INNER JOIN
                         dbo.Prestamo AS P ON E.IdLector = P.IdLector INNER JOIN
                         dbo.Libro AS L ON L.IdLibro = P.IdLibro INNER JOIN
                         dbo.Editorial AS Ed ON Ed.IdEditorial = L.IdEditorial
GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrera](
	[IdCarrera] [int] IDENTITY(1,1) NOT NULL,
	[NombreCarrera] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Carrera] PRIMARY KEY CLUSTERED 
(
	[IdCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EstudianteView]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EstudianteView]
AS
SELECT        E.IdLector, E.CI, E.Nombre, E.Apellido, E.Direccion, E.Edad, C.IdCarrera, C.NombreCarrera AS Carrera
FROM            dbo.Estudiante AS E INNER JOIN
                         dbo.Carrera AS C ON E.IdCarrera = C.IdCarrera
GO
/****** Object:  UserDefinedFunction [dbo].[ListarPrestamosPorAlumno]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Absalon Blanco
-- Create date: 2020-03-04
-- Description:	Funcion lista los prestamos de un determinado estudiante
-- =============================================
CREATE   FUNCTION [dbo].[ListarPrestamosPorAlumno] 
(	
	-- Add the parameters for the function here
	@IdLector INT
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT L.IdLibro,L.Titulo,P.FechaPrestamo,P.FechaDevolucion,P.Devuelto, E.IdLector, E.Nombre+' '+E.Apellido AS 'Estudiante'
	 FROM dbo.Prestamo AS P
	INNER JOIN dbo.Libro AS L ON P.IdLibro=L.IdLibro
	INNER JOIN dbo.Estudiante AS E ON E.IdLector=P.IdLector
	WHERE P.IdLector=@IdLector
)
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[IdAutor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdNacionalidad] [int] NOT NULL,
 CONSTRAINT [PK_Autor] PRIMARY KEY CLUSTERED 
(
	[IdAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibAut]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibAut](
	[IdLibAut] [int] IDENTITY(1,1) NOT NULL,
	[IdAutor] [int] NOT NULL,
	[IdLibro] [int] NOT NULL,
 CONSTRAINT [PK_LibAut] PRIMARY KEY CLUSTERED 
(
	[IdLibAut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nacionalidad]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nacionalidad](
	[IdNacionalidad] [int] IDENTITY(1,1) NOT NULL,
	[NombreNacionalidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Nacionalidad] PRIMARY KEY CLUSTERED 
(
	[IdNacionalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([IdArea], [NombreArea]) VALUES (1, N'Literatura')
INSERT [dbo].[Area] ([IdArea], [NombreArea]) VALUES (2, N'Internet')
INSERT [dbo].[Area] ([IdArea], [NombreArea]) VALUES (3, N'Base de Datos')
INSERT [dbo].[Area] ([IdArea], [NombreArea]) VALUES (4, N'Novelas')
SET IDENTITY_INSERT [dbo].[Area] OFF
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([IdAutor], [Nombre], [IdNacionalidad]) VALUES (1, N'Gabriel Garcia Márquez', 1)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [IdNacionalidad]) VALUES (2, N'Miguel de Cervantes', 2)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [IdNacionalidad]) VALUES (3, N'William Shakespeare', 3)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [IdNacionalidad]) VALUES (4, N'Antoine de Saint Exupéry', 4)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [IdNacionalidad]) VALUES (5, N'Jane Austen', 3)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [IdNacionalidad]) VALUES (6, N'George Orwel', 5)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [IdNacionalidad]) VALUES (7, N'Robin Williams', 6)
INSERT [dbo].[Autor] ([IdAutor], [Nombre], [IdNacionalidad]) VALUES (8, N'Mario Benedetti', 6)
SET IDENTITY_INSERT [dbo].[Autor] OFF
SET IDENTITY_INSERT [dbo].[Carrera] ON 

INSERT [dbo].[Carrera] ([IdCarrera], [NombreCarrera]) VALUES (1, N'Informatica')
INSERT [dbo].[Carrera] ([IdCarrera], [NombreCarrera]) VALUES (2, N'Contabilidad')
INSERT [dbo].[Carrera] ([IdCarrera], [NombreCarrera]) VALUES (3, N'Economia')
INSERT [dbo].[Carrera] ([IdCarrera], [NombreCarrera]) VALUES (4, N'Ingles')
INSERT [dbo].[Carrera] ([IdCarrera], [NombreCarrera]) VALUES (5, N'Filosia')
INSERT [dbo].[Carrera] ([IdCarrera], [NombreCarrera]) VALUES (6, N'Piscologia')
SET IDENTITY_INSERT [dbo].[Carrera] OFF
SET IDENTITY_INSERT [dbo].[Editorial] ON 

INSERT [dbo].[Editorial] ([IdEditorial], [NombreEditorial]) VALUES (1, N'Santilla')
INSERT [dbo].[Editorial] ([IdEditorial], [NombreEditorial]) VALUES (2, N'Asociación Española')
INSERT [dbo].[Editorial] ([IdEditorial], [NombreEditorial]) VALUES (3, N'OMEGA')
INSERT [dbo].[Editorial] ([IdEditorial], [NombreEditorial]) VALUES (4, N'Salamandra')
INSERT [dbo].[Editorial] ([IdEditorial], [NombreEditorial]) VALUES (5, N'ALFA')
INSERT [dbo].[Editorial] ([IdEditorial], [NombreEditorial]) VALUES (6, N'APRESS')
SET IDENTITY_INSERT [dbo].[Editorial] OFF
SET IDENTITY_INSERT [dbo].[Estudiante] ON 

INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Apellido], [Direccion], [IdCarrera], [Edad]) VALUES (1, N'2020010101B', N'Absalon', N'Blanco', N'Paseo Union Europea', 1, 30)
INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Apellido], [Direccion], [IdCarrera], [Edad]) VALUES (2, N'2032948502C', N'Katherine', N'Gonzalez', N'Avenida Rubenia', 4, 29)
INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Apellido], [Direccion], [IdCarrera], [Edad]) VALUES (3, N'438403940T', N'Kevin', N'Vlandone', N'Reparto Colonia Flor', 4, 21)
INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Apellido], [Direccion], [IdCarrera], [Edad]) VALUES (4, N'324834930V', N'Felipe Loayza', N'Berame', N'Villa Fontana', 1, 27)
INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Apellido], [Direccion], [IdCarrera], [Edad]) VALUES (5, N'3029393408S', N'Saira Fornos', N'Gomez', N'Rafaela Herrera', 1, 24)
INSERT [dbo].[Estudiante] ([IdLector], [CI], [Nombre], [Apellido], [Direccion], [IdCarrera], [Edad]) VALUES (6, N'38430439W', N'KAREN', N'SAVEEDRA', N'RUTA MAYA', 1, 33)
SET IDENTITY_INSERT [dbo].[Estudiante] OFF
SET IDENTITY_INSERT [dbo].[LibAut] ON 

INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (1, 1, 1)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (2, 2, 2)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (3, 3, 3)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (4, 4, 4)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (5, 5, 5)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (6, 1, 7)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (7, 1, 8)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (8, 5, 9)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (9, 7, 11)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (10, 7, 10)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (11, 7, 12)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (12, 7, 13)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (13, 8, 14)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (14, 8, 15)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (15, 8, 16)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (16, 8, 17)
INSERT [dbo].[LibAut] ([IdLibAut], [IdAutor], [IdLibro]) VALUES (17, 8, 18)
SET IDENTITY_INSERT [dbo].[LibAut] OFF
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (1, N'Cien años de soledad', 1, 1)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (2, N'Don Quijote de la Mancha', 2, 1)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (3, N'Hamlet', 2, 1)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (4, N'El Principito', 4, 1)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (5, N'Orgullo y Prejuicio', 5, 1)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (6, N'1984', 5, 1)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (7, N'El amor en los tiempos del Cólera', 1, 1)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (8, N'Crónica de una muerte anunciada', 1, 1)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (9, N'Emma', 1, 1)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (10, N'Visual Studio .NET', 6, 2)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (11, N'WEB API 2nd Edition', 6, 2)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (12, N'SQL Server 2016 1st Edition', 6, 3)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (13, N'TSQL 2016 Fundamentals', 6, 3)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (14, N'La Tregua', 5, 4)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (15, N'Pedro el Capitan', 5, 4)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (16, N'Quien de Nosotros', 5, 4)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (17, N'Gracias por el Fuego', 3, 4)
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [IdArea]) VALUES (18, N'Andamios', 5, 4)
SET IDENTITY_INSERT [dbo].[Libro] OFF
SET IDENTITY_INSERT [dbo].[Nacionalidad] ON 

INSERT [dbo].[Nacionalidad] ([IdNacionalidad], [NombreNacionalidad]) VALUES (1, N'Colombia')
INSERT [dbo].[Nacionalidad] ([IdNacionalidad], [NombreNacionalidad]) VALUES (2, N'España')
INSERT [dbo].[Nacionalidad] ([IdNacionalidad], [NombreNacionalidad]) VALUES (3, N'Inglaterra')
INSERT [dbo].[Nacionalidad] ([IdNacionalidad], [NombreNacionalidad]) VALUES (4, N'Francia')
INSERT [dbo].[Nacionalidad] ([IdNacionalidad], [NombreNacionalidad]) VALUES (5, N'India')
INSERT [dbo].[Nacionalidad] ([IdNacionalidad], [NombreNacionalidad]) VALUES (6, N'USA')
INSERT [dbo].[Nacionalidad] ([IdNacionalidad], [NombreNacionalidad]) VALUES (7, N'Uruguay')
SET IDENTITY_INSERT [dbo].[Nacionalidad] OFF
SET IDENTITY_INSERT [dbo].[Prestamo] ON 

INSERT [dbo].[Prestamo] ([IdPrestamo], [IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (1, 1, 8, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-31' AS Date), 1)
INSERT [dbo].[Prestamo] ([IdPrestamo], [IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (2, 4, 11, CAST(N'2007-04-01' AS Date), CAST(N'2007-04-10' AS Date), 0)
INSERT [dbo].[Prestamo] ([IdPrestamo], [IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (3, 3, 12, CAST(N'2020-03-01' AS Date), CAST(N'2020-03-10' AS Date), 0)
INSERT [dbo].[Prestamo] ([IdPrestamo], [IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (4, 5, 13, CAST(N'2020-02-29' AS Date), CAST(N'2020-03-01' AS Date), 0)
INSERT [dbo].[Prestamo] ([IdPrestamo], [IdLector], [IdLibro], [FechaPrestamo], [FechaDevolucion], [Devuelto]) VALUES (5, 1, 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-31' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Prestamo] OFF
ALTER TABLE [dbo].[Autor]  WITH CHECK ADD  CONSTRAINT [FK_Autor_Nacionalidad] FOREIGN KEY([IdNacionalidad])
REFERENCES [dbo].[Nacionalidad] ([IdNacionalidad])
GO
ALTER TABLE [dbo].[Autor] CHECK CONSTRAINT [FK_Autor_Nacionalidad]
GO
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD  CONSTRAINT [FK_Estudiante_Carrera] FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[Carrera] ([IdCarrera])
GO
ALTER TABLE [dbo].[Estudiante] CHECK CONSTRAINT [FK_Estudiante_Carrera]
GO
ALTER TABLE [dbo].[LibAut]  WITH CHECK ADD  CONSTRAINT [FK_LibAut_Autor] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autor] ([IdAutor])
GO
ALTER TABLE [dbo].[LibAut] CHECK CONSTRAINT [FK_LibAut_Autor]
GO
ALTER TABLE [dbo].[LibAut]  WITH CHECK ADD  CONSTRAINT [FK_LibAut_Libro] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
ALTER TABLE [dbo].[LibAut] CHECK CONSTRAINT [FK_LibAut_Libro]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Area] FOREIGN KEY([IdArea])
REFERENCES [dbo].[Area] ([IdArea])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Area]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Editorial] FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editorial] ([IdEditorial])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Editorial]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [FK_Prestamo_Estudiante] FOREIGN KEY([IdLector])
REFERENCES [dbo].[Estudiante] ([IdLector])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [FK_Prestamo_Estudiante]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [FK_Prestamo_Libro] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [FK_Prestamo_Libro]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarLibro]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Absalon Blanco
-- Create date: 2020-03-04
-- Description:	Actualiza un registro de un libro
-- =============================================
CREATE   PROCEDURE [dbo].[sp_ActualizarLibro]
	-- Add the parameters for the stored procedure here
	@IdLibro INT,
	@Titutlo VARCHAR(50),
	@IdEditorial INT,
	@IdArea INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.Libro SET
	Titulo=@Titutlo,
	IdEditorial=@IdEditorial,
	IdArea=@IdArea
	WHERE IdLibro=@IdLibro
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarEstudiantes]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Absalon Blanco
-- Create date: 2020-03-04
-- Description:	Registra un estudiante nuevo
-- =============================================
CREATE   PROCEDURE [dbo].[sp_AgregarEstudiantes] 
	-- Add the parameters for the stored procedure here
	@CI VARCHAR(50),
	@Nombre VARCHAR(20),
	@Apellido VARCHAR(20),
	@Direccion VARCHAR(50),
	@IdCarrera INT,
	@Edad INT
AS
BEGIN
	INSERT INTO dbo.Estudiante(CI,Nombre,Apellido,Direccion,IdCarrera,Edad)
	VALUES(@CI,@Nombre,@Apellido,@Direccion,@IdCarrera,@Edad)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerLibrosPorAutor]    Script Date: 05/03/2020 5:59:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Absalon Blanco
-- Create date: 20200304
-- Description:	Obtiene todos los libros de un Autor
-- =============================================
CREATE   PROCEDURE [dbo].[sp_ObtenerLibrosPorAutor]
	-- Add the parameters for the stored procedure here
	@IdAutor INT
AS
BEGIN
	SELECT L.IdLibro,L.Titulo,A.IdAutor,A.Nombre as Autor FROM dbo.Libro as L 
	INNER JOIN dbo.LibAut AS LA ON L.IdLibro=LA.IdLibro
	INNER JOIN dbo.Autor AS A ON LA.IdAutor=A.IdAutor
	WHERE LA.IdAutor=@IdAutor
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "E"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EstudianteView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EstudianteView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "L"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 630
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LibroView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LibroView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "E"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 6
               Left = 464
               Bottom = 136
               Right = 634
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Ed"
            Begin Extent = 
               Top = 6
               Left = 672
               Bottom = 102
               Right = 848
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PrestamoView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PrestamoView'
GO
USE [master]
GO
ALTER DATABASE [BIBLIOTECA ] SET  READ_WRITE 
GO
