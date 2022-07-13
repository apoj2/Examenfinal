CREATE DATABASE ENSAYO
GO

USE ENSAYO 
GO

CREATE TABLE ESTUDIANTES
( IdEstudiante int primary key,
  nombre varchar (20),
  barrio varchar (20),
  edad tinyint
)

insert into ESTUDIANTES values(123,'albeiro','belen',53)
insert into ESTUDIANTES values(124,'july','robledo',20)
insert into ESTUDIANTES values(125,'mateo','campo valdes',21)
insert into ESTUDIANTES values(126,'sebastian','belen',18)
insert into ESTUDIANTES values(127,'lin','campo valdes',21)
insert into ESTUDIANTES values(128,'olga','robledo',23)

Delete ESTUDIANTES
--borra pero no las tablas--

update ESTUDIANTES
set
	barrio = 'laureles'--@barrio--
	where IdEstudiante = 126 --@idEstudiante--

select *
from ESTUDIANTES

CREATE PROCEDURE USP_UpateBarrio
@IdEstudiante int,
@Barrio varchar(20)
as
begin

	update Estudiantes 
	set
		barrio = @barrio
		where idestudiante = @IdEstudiante
END


exec USP_UpateBarrio 127, 'china'
select * from ESTUDIANTES