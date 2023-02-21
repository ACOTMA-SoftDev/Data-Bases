/** 
Credenciales para conectarse a la interfaz del host gratuito
user: ACOTMADB
password: 4coT348d35T4D145

Credenciales para conectarse remotamente a la base de datos

user: ACOTMADB_SQLLogin_1
password: gfs1n5hg6n
**/




use master
drop database ACOTMADB
go

create database ACOTMADB
go
use ACOTMADB
go
create table permisos(
idPermiso int not null primary key identity(1,1),
permiso nvarchar
);
go
create table usuarios(
usuario nvarchar not null primary key,
nombre nvarchar,
apellidoP nvarchar,
apellidoM nvarchar,
pass nvarchar not null,
fkPermiso int,
constraint fkPermisoUsuario foreign key (fkPermiso)references permisos(idPermiso));
go
create table estado(
idEstado int not null primary key identity(1,1),
numEstado nvarchar,
);
go
create table verificacionDia(
idVerificacionDia int not null primary key identity(1,1),
noUnidad int,
observaciones nvarchar,
fecha date,
fkUsuario nvarchar,
fkEstado int,
constraint fkUsuarioVerificacionDia foreign key(fkUsuario)references 
usuarios(usuario),
constraint fkEstadoVerificacionDia foreign key(fkEstado)references
estado(idEstado));
go
create table horarioServicio(
corrida int not null,
fecha date not null,
ruta nvarchar,
horarioSalida time(0),
constraint pkHorarioServicio primary key(corrida,fecha)
);
go
create table verificacionSalida(
idVerificacionSalida int not null primary key identity(1,1),
estado varchar(10),
observaciones nvarchar,
fechaSalida date,
fkusuario nvarchar,
constraint fkUsuarioVerificacionSalida foreign key(fkusuario)references usuarios(usuario)
);
go

Create table asignacion(
idAsignacion int not null primary key identity(1,1),
tipoUnidad varchar(50),
economico int,
tarjeton int,
nomChofer varchar(100),
fkVerificacionSalida int,
fkCorrida int,
fkFecha date,
constraint fkVerificacionSalidaAsignacion foreign key(fkVerificacionSalida)
references verificacionSalida(idVerificacionSalida),
constraint fkHorarioAsignacion foreign key(fkCorrida,fkFecha)
references horarioServicio(corrida,fecha)
);
go

drop table asignacion,verificacionSalida,horarioServicio,verificacionDia,estado,usuarios

