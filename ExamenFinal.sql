CREATE DATABASE HospitalGeneral
go 
use HospitalGeneral
GO
CREATE TABLE Cama(
IdCama int primary key identity(1,1),
FechaAsignacionPaciente date
)
CREATE TABLE Planta(
IdPlanta int primary key identity(1,1),
Nombre varchar(20),
CantidadDeCamas int,
IdCama int,
foreign key (IdCama) references Cama(IdCama) 
)
CREATE TABLE Especialidades(
IdEspecialidades int primary key identity(1,1),
Nombre varchar(20),
Tipo varchar (20)
)
CREATE TABLE Medico(
IdMedico int primary key identity(1,1),
Identificacion varchar(15),
Nombres varchar(25),
Apellidos varchar(25),
IdEspecialidades int,
foreign key (IdEspecialidades) references Especialidades(IdEspecialidades)
)
CREATE TABLE VisitaMedica(
IdVisitaMedica int primary key identity(1,1),
FechaVista date,
HoraVisita time,
IdMedico int,
foreign key (IdMedico) references Medico(IdMedico)
)
CREATE TABLE Diagnostico(
IdDiagnostico int primary key identity(1,1),
DescripcionDiagnostico varchar(100),
FechaDiagnostico date,
IdVisitaMedica int,
foreign key (IdVisitaMedica) references VisitaMedica(IdVisitaMedica)
)
CREATE TABLE TarjetaVisita(
IdTarjetaVisita int primary key identity(1,1) ,
HoraDeEntrada time,
HoraDeSalida time
)
CREATE TABLE Paciente(
IdPaciente int primary key identity(1,1),
Identificacion varchar(15),
Nombre varchar(25),
Apellidos varchar(25),
IdPlanta int,
IdDiagnostico int,
IdTarjetaVisita int,
foreign key (IdPlanta) references Planta(IdPlanta),
foreign key (IdDiagnostico) references Diagnostico(IdDiagnostico),
foreign key (IdTarjetaVisita) references TarjetaVisita(IdTarjetaVisita)
)
CREATE TABLE HistoriaClinicaPaciente(
IdHistoriaClinica int primary key identity(1,1),
IdPaciente int,
foreign key (IdPaciente) references Paciente(IdPaciente)
)

create procedure usp_AgregarDatosCama
@FechaAsignacionPaciente date
as
begin

insert into Cama(FechaAsignacionPaciente)
values(@FechaAsignacionPaciente)

end

exec usp_AgregarDatosCama '2005-03-14'

create procedure usp_AgregarDatosPlanta
@Nombre varchar(20),
@CantidadDeCamas int,
@IdCama int
as
begin

insert into Planta(Nombre,CantidadDeCamas,IdCama)
values(@Nombre,@CantidadDeCamas,@IdCama)

end

exec usp_AgregarDatosPlanta 'Emergencias',12,1

select * from Planta

create procedure usp_AgregarDatosEspecialidades
@Nombre varchar(20),
@Tipo varchar(20)
as
begin

insert into Especialidades(Nombre,Tipo)
values(@Nombre,@Tipo)

end

exec usp_AgregarDatosEspecialidades'Medico General','Revisiones'

create procedure usp_AgregarDatosMedico
@Identificacion varchar(15),
@Nombres varchar(25),
@Apellidos varchar(25),
@IdEspecialidades int
as
begin

insert into Medico(Identificacion,Nombres,Apellidos,IdEspecialidades)
values(@Identificacion,@Nombres,@Apellidos,@IdEspecialidades)

end

exec usp_AgregarDatosMedico '1234567','Jose David','Atehortua Cañas',1

create procedure usp_AgregarDatosVisitaMedica
@FechaVisita date,
@HoraVisita time,
@IdMedico int
as
begin

insert into VisitaMedica(FechaVista,HoraVisita,IdMedico)
values(@FechaVisita,@HoraVisita,@IdMedico)

end

exec usp_AgregarDatosVisitaMedica'2005-03-14','12:03:00',1


create procedure usp_AgregarDatosDiagnostico
@DescripcionDiagnostico varchar(100),
@FechaDiagnostico date,
@IdVisitaMedica int
as
begin

insert into Diagnostico(DescripcionDiagnostico,FechaDiagnostico,IdVisitaMedica)
values(@DescripcionDiagnostico,@FechaDiagnostico,@IdVisitaMedica)

end

exec usp_AgregarDatosDiagnostico 'Tiene una enfermedad relacionanda con la diabetes aun no se sabe cual es se le realizar varios examenes medicos para asi poder llegar a la conclusion fija','2006-01-01',1

create procedure usp_AgregarDatosTarjetaVisitas
@HoraDeEntrada time,
@HoraDeSalida time
as
begin

insert into TarjetaVisita(HoraDeEntrada,HoraDeSalida)
values(@HoraDeEntrada,@HoraDeSalida)

end

exec usp_AgregarDatosTarjetaVisitas'12:00:00','04:00:00'

create procedure usp_AgregarDatosPaciente
@Identificacion varchar(15),
@Nombres varchar(25),
@Apellidos varchar (25),
@IdPlanta int,
@IdDiagnostico int,
@IdTarjetaVisita int 
as
begin

insert into Paciente(Identificacion,Nombre,Apellidos,IdPlanta,IdDiagnostico,IdTarjetaVisita)
values(@Identificacion,@Nombres,@Apellidos,@IdPlanta,@IdDiagnostico,@IdTarjetaVisita)

end

exec usp_AgregarDatosPaciente '345692123','Jose benito','camelas renteria',1,1,1

create procedure usp_AgregarDatosHistoriaClinicaPaciente
@IdPaciente int
as
begin

insert into HistoriaClinicaPaciente(IdPaciente)
values(@IdPaciente)

end

exec usp_AgregarDatosHistoriaClinicaPaciente 1

exec usp_AgregarDatosCama '2005-03-14'
exec usp_AgregarDatosPlanta 'Emergencias',12,1
exec usp_AgregarDatosEspecialidades 'Medico General','Revisiones'
exec usp_AgregarDatosMedico '1234567','Jose David','Atehortua Cañas',1
exec usp_AgregarDatosVisitaMedica '2005-03-14','12:03:00',1
exec usp_AgregarDatosDiagnostico 'Tiene una enfermedad relacionanda con la diabetes aun no se sabe cual es se le realizar varios examenes medicos para asi poder llegar a la conclusion fija','2006-01-01',1
exec usp_AgregarDatosTarjetaVisitas '12:00:00','04:00:00'
exec usp_AgregarDatosPaciente '345692123','Jose benito','camelas renteria',1,1,1
exec usp_AgregarDatosHistoriaClinicaPaciente 1

exec usp_AgregarDatosCama '2010-04-21'
exec usp_AgregarDatosPlanta 'Emergencias',12,1
exec usp_AgregarDatosEspecialidades 'Especialista en asistencia medica','Emergencias'
exec usp_AgregarDatosMedico '85674321','Alejandro Maria','Ramirez Caños',2
exec usp_AgregarDatosVisitaMedica '2010-04-21','12:03:00',2
exec usp_AgregarDatosDiagnostico 'Tiene un accidente en motocicleta,presenta lesiones de clavicula','2010-04-21',1
exec usp_AgregarDatosTarjetaVisitas '03:30:30:00','04:00:00:00'
exec usp_AgregarDatosPaciente '4356432321','Arturo david','Montes ALVes',1,2,2
exec usp_AgregarDatosHistoriaClinicaPaciente 2

exec usp_AgregarDatosCama '2015-05-24'
exec usp_AgregarDatosPlanta 'Pediatria',12,2
exec usp_AgregarDatosEspecialidades 'Medico Pediatra','Revisiones'
exec usp_AgregarDatosMedico '2344567','Omar','Pedroza Miranda',3
exec usp_AgregarDatosVisitaMedica '2015-05-14','05:30:00:00',3
exec usp_AgregarDatosDiagnostico 'El niño esta estable','2015-05-15',3
exec usp_AgregarDatosTarjetaVisitas '08:00:00:00','10:00:00:00'
exec usp_AgregarDatosPaciente '0','Juan Jose','Gomez Perez',2,3,3
exec usp_AgregarDatosHistoriaClinicaPaciente 3


select * from Cama
select * from Diagnostico
select * from Especialidades
select * from HistoriaClinicaPaciente
select * from Medico
select * from Paciente
select * from Planta
select * from TarjetaVisita
select * from VisitaMedica