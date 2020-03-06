USE [BIBLIOTECA ]
--1. Listar los datos de los autores que tengan más de un libro publicado 


SELECT A.IdAutor, A.Nombre, N.NombreNacionalidad AS Nacionalidad, count(L.Titulo) as Libros FROM dbo.Autor AS A 
INNER JOIN dbo.LibAut AS LA ON A.IdAutor=LA.IdAutor
INNER JOIN dbo.Libro AS L ON L.IdLibro=LA.IdLibro 
INNER JOIN dbo.Nacionalidad AS N ON A.IdNacionalidad=N.IdNacionalidad
GROUP BY A.IdAutor, A.Nombre, N.NombreNacionalidad
HAVING COUNT(L.Titulo)>1

--2. Listar nombre y edad de los estudiantes

SELECT E.IdLector, E.CI,E.Nombre,E.Apellido,E.Direccion,E.Edad,C.NombreCarrera AS Carrera
 FROM dbo.Estudiante AS E INNER JOIN dbo.Carrera AS C ON E.IdCarrera=C.IdCarrera

--3 ¿Qué estudiantes pertenecen a la carrera de Informática?

SELECT E.IdLector, E.CI,E.Nombre,E.Apellido,E.Direccion,E.Edad,C.NombreCarrera AS Carrera
 FROM dbo.Estudiante AS E INNER JOIN dbo.Carrera AS C ON E.IdCarrera=C.IdCarrera
 WHERE C.IdCarrera=1 --Donde 1 es el identificador de la carrera de informática

--4. Listar los nombres de los estudiantes cuyo apellido comience con la letra G?
 SELECT E.IdLector, E.CI,E.Nombre, E.Apellido,E.Direccion,E.Edad,C.NombreCarrera AS Carrera
 FROM dbo.Estudiante AS E INNER JOIN dbo.Carrera AS C ON E.IdCarrera=C.IdCarrera
 WHERE E.Apellido LIKE 'G%' --Donde 1 es el identificador de la carrera de informática

--5. ¿Quiénes son los autores del libro “Visual Studio Net”, listar solamente los nombres?
 
SELECT A.Nombre FROM dbo.Autor AS A 
INNER JOIN dbo.LibAut AS LA ON A.IdAutor=LA.IdAutor
INNER JOIN dbo.Libro AS L ON L.IdLibro=LA.IdLibro  
WHERE L.IdLibro=10 --Donde 10 es el identificador del libro Visual Studio .NET

--6. ¿Qué autores son de nacionalidad USA o Francia?7.
SELECT A.IdAutor, A.Nombre, N.NombreNacionalidad AS Nacionalidad FROM dbo.Autor AS A  
INNER JOIN dbo.Nacionalidad AS N ON A.IdNacionalidad=N.IdNacionalidad
WHERE N.IdNacionalidad IN (4,6)

--7. ¿Qué libros No Son del Area de Internet?
SELECT L.IdLibro,L.Titulo, E.NombreEditorial AS Editorial, A.NombreArea AS Area
FROM dbo.Libro AS L INNER JOIN dbo.Area AS A ON L.IdArea=A.IdArea
INNER JOIN dbo.Editorial AS E ON L.IdEditorial=E.IdEditorial
WHERE  A.IdArea NOT IN (2)

--8.¿Qué libros se prestó el Lector “Felipe Loayza Beramendi”?
SELECT E.Nombre+ ' ' +E.Apellido AS Estudiante, L.Titulo, Ed.NombreEditorial AS 'Editorial'  FROM dbo.Estudiante AS E 
INNER JOIN dbo.Prestamo AS P ON E.IdLector=P.IdLector
INNER JOIN dbo.Libro AS L ON L.IdLibro=P.IdLibro
INNER JOIN dbo.Editorial AS Ed ON Ed.IdEditorial=L.IdEditorial
WHERE E.IdLector=4 --dONDE 4 es el identificador de el estudiante Felipe Loayza Berame

--9. Listar el nombre del estudiante de menor edad
SELECT TOP 1 E.IdLector, E.CI, E.Nombre, E.Apellido,E.Direccion, E.Edad
FROM dbo.Estudiante AS E ORDER BY E.Edad asc

--10. Listar los nombres de los estudiantes que se prestaron Libros de Base de Datos
SELECT E.Nombre+ ' ' +E.Apellido AS Estudiante, L.Titulo, Ed.NombreEditorial AS 'Editorial'  FROM dbo.Estudiante AS E 
INNER JOIN dbo.Prestamo AS P ON E.IdLector=P.IdLector
INNER JOIN dbo.Libro AS L ON L.IdLibro=P.IdLibro
INNER JOIN dbo.Area AS A ON L.IdArea=A.IdArea
INNER JOIN dbo.Editorial AS Ed ON Ed.IdEditorial=L.IdEditorial
WHERE A.IdArea in (3)
 
--11. Listar los libros de editorial Alfa y Omega
SELECT L.Titulo, Ed.NombreEditorial AS 'Editorial'  
FROM  dbo.Libro AS L 
INNER JOIN dbo.Area AS A ON L.IdArea=A.IdArea
INNER JOIN dbo.Editorial AS Ed ON Ed.IdEditorial=L.IdEditorial
WHERE Ed.IdEditorial in (3,5)

--12. Listar los libros que pertenecen al autor Mario Benedetti
SELECT L.Titulo,A.Nombre AS Autor FROM dbo.Autor AS A 
INNER JOIN dbo.LibAut AS LA ON A.IdAutor=LA.IdAutor
INNER JOIN dbo.Libro AS L ON L.IdLibro=LA.IdLibro  
WHERE A.IdAutor =8 --Donde 1 es el identificador del autor

--13. Listar los títulos de los libros que debían devolverse el 10/04/07
SELECT E.Nombre+ ' ' +E.Apellido AS Estudiante, L.Titulo, Ed.NombreEditorial AS 'Editorial',P.FechaPrestamo, P.FechaDevolucion
FROM dbo.Estudiante AS E 
INNER JOIN dbo.Prestamo AS P ON E.IdLector=P.IdLector
INNER JOIN dbo.Libro AS L ON L.IdLibro=P.IdLibro
INNER JOIN dbo.Area AS A ON L.IdArea=A.IdArea
INNER JOIN dbo.Editorial AS Ed ON Ed.IdEditorial=L.IdEditorial
WHERE P.FechaDevolucion='20070410'

--14. Hallar la suma de las edades de los estudiantes
SELECT SUM(E.Edad) as SumatoriaEdades FROM dbo.Estudiante AS E

--15. Listar los datos de los estudiantes cuya edad es mayor al promedio 
SELECT E.IdLector,E.CI, E.Nombre,E.Apellido,E.Direccion,E.Edad FROM dbo.Estudiante as E 
WHERE E.Edad>(SELECT AVG(Edad) FROM dbo.Estudiante)
 
 
--16. Crear un Procedimiento Almacenado que muestre los libros de un determinado Autor que se especifique.
EXEC dbo.sp_ObtenerLibrosPorAutor 7

--17. Crear un Procedimiento Almacenado que inserte nuevos Estudiantes
EXEC dbo.sp_AgregarEstudiantes '38430439W','KAREN','SAVEEDRA','RUTA MAYA',1,33


--18. Crear un Procedimiento Almacenado que actualice cualquier Libro especificando su código.
EXEC dbo.sp_ActualizarLibro 18,'Andamios',5,4
 
--19. Crear un disparador DML que permita listar los registros de la Tabla Estudiantes luego de insertar un nuevo registro.
--Script en la carpeta Scripts del Proyecto

--20. Crear una Función (que devuelva una Tabla) que liste los préstamos solicitados por un determinado alumno.
SELECT * from dbo.ListarPrestamosPorAlumno(1) --donde 1 es el identficador del estudiante
