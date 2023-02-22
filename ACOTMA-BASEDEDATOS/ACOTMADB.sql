/** 
url para entrar al host gratuito
https://somee.com/DOKA/Identity/Account/Login?ReturnUrl=%2FDOKA%2FDOU

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
permiso varchar(100)
);
go
create table usuarios(
usuario varchar(100) not null primary key,
nombre varchar(100),
apellidoP varchar(100),
apellidoM varchar(100),
pass varchar(100) not null,
fkPermiso int,
constraint fkPermisoUsuario foreign key (fkPermiso)references permisos(idPermiso));
go
create table estado(
idEstado int not null primary key identity(1,1),
numEstado varchar(100),
);
go
create table verificacionDia(
idVerificacionDia int not null primary key identity(1,1),
noUnidad int,
observaciones varchar(1000),
fecha date,
fkUsuario varchar(100),
fkEstado int,
constraint fkUsuarioVerificacionDia foreign key(fkUsuario)references 
usuarios(usuario),
constraint fkEstadoVerificacionDia foreign key(fkEstado)references
estado(idEstado));
go
create table horarioServicio(
corrida int not null,
fecha date not null,
ruta varchar(100),
horarioSalida time(0),
constraint pkHorarioServicio primary key(corrida,fecha)
);
go
Create table asignacion(
idAsignacion int not null primary key identity(1,1),
tipoUnidad varchar(50),
economico int,
tarjeton int,
nomChofer varchar(100),
fkCorrida int,
fkFecha date,
constraint fkHorarioAsignacion foreign key(fkCorrida,fkFecha)
references horarioServicio(corrida,fecha)
);
go
create table verificacionSalida(
idVerificacionSalida int not null primary key identity(1,1),
estado varchar(100),
observaciones varchar(100),
fechaSalida date,
fkusuario varchar(100),
fkasignacion int,
constraint fkAsignacionSalida foreign key (fkasignacion) references asignacion(idAsignacion),
constraint  fkUsuarioVerificacionSalida foreign key(fkusuario)references usuarios(usuario));
go



drop table asignacion,verificacionSalida,horarioServicio,verificacionDia,estado,usuarios





Relation
=======
drop table asignacion,verificacionSalida,horarioServicio,verificacionDia,estado,usuarios

 main
