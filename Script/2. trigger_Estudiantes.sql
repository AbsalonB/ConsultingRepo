-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Absalon Blanco
-- Create date: 2020-03-04
-- Description:	Listar los estudiantes después de la inserción de un registro
-- =============================================
CREATE OR ALTER TRIGGER ListarRegistros
   ON  dbo.Estudiante
   AFTER INSERT
AS 
BEGIN
	SELECT IdLector,CI,Nombre,Apellido,Direccion,IdCarrera,Edad FROM dbo.Estudiante
END
GO
