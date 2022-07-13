CREATE DATABASE Alumnos
GO 
USE Alumnos
GO

CREATE TABLE Estudiantes
(
IdEstudiante INT PRIMARY KEY,
nombre VARCHAR(20),
apellido VARCHAR(20),
edad TINYINT,
fechaNacimiento DATE,
celular VARCHAR(10),
estatura DECIMAL (3,2)
)

DROP TABLE AlumnoAsignatura

INSERT INTO Estudiantes(IdEstudiante,nombre,apellido,edad,fechaNacimiento,celular,estatura)
               VALUES (1234991923,'William','Araque',23,'1999/08/10','3014503039',1.72)

INSERT INTO Estudiantes(IdEstudiante,nombre,apellido,edad,fechaNacimiento,celular,estatura)
			   VALUES (1000414033,'Sebastian','lastra',18,'2003/10/18','3148317199',1.75)

SELECT * FROM TELEFONOS


CREATE TABLE Correos
(
    IdCorreo INT PRIMARY KEY IDENTITY(1,1),
	IdEstudiante INT,
	nombreCorreo VARCHAR(100),
	FOREIGN KEY (IdEstudiante) REFERENCES ESTUDIANTES(IdEstudiante)
	)

CREATE TABLE TELEFONOS
(	
	IdTelefono INT PRIMARY KEY IDENTITY(1,1),
	NumTel VARCHAR(10),
	IdEstudiante INT,
	FOREIGN KEY (IdEstudiante) REFERENCES ESTUDIANTES(IdEstudiante)
	)

CREATE TABLE AlumnoAsignatura
(
	IdAlumnoAsig INT PRIMARY KEY IDENTITY(1,1),
	IdEstudiante INT,
	IdAsignatura INT,
	FOREIGN KEY (IdEstudiante) REFERENCES ESTUDIANTES(IdEstudiante),
	FOREIGN KEY (IdAsignatura) REFERENCES Asignatura(IdAsignatura)
	)

CREATE TABLE Asignatura
(
	IdAsignatura INT PRIMARY KEY,
	NombreAsig VARCHAR(10)
)

CREATE TABLE DOCENTES
(
	IdDoc INT Primary KEY,
	NumDoc varchar(10)
	)

CREATE TABLE AlumnoDocente
(
	IdAlumnoDoc INT PRIMARY KEY,
	Idestudiante INT,
	IdDoc INT,
	FOREIGN KEY (IdDoc) REFERENCES DOCENTES(IdDoc),
	FOREIGN KEY (IdEstudiante) REFERENCES ESTUDIANTES(IdEstudiante)
	)