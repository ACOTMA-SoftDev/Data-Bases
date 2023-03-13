/** 
url para entrar al host gratuito
https://somee.com/DOKA/Identity/Account/Login?ReturnUrl=%2FDOKA%2FDOU

Credenciales para conectarse a la interfaz del host gratuito
user: ACOTMADB
password: 4coT348d35T4D145

Credenciales para conectarse remotamente a la base de datos
domain: ACOTMADB.mssql.somee.com
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
permiso varchar(100) not null primary key,
);
go

create table usuarios(
usuario varchar(100) not null primary key,
nombre varchar(100),
apellidoP varchar(100),
apellidoM varchar(100),
pass varchar(100) not null)
go

create table permisoUsuario(idPermisoUsuario int not null primary key identity(1,1),
usuario varchar(100),
permiso varchar(100),
constraint usuario foreign key(usuario)references usuarios(usuario),
constraint permiso foreign key(permiso)references permisos(permiso)
)
go

create table verificacionDia(
idVerificacionDia int not null primary key identity(1,1),
tipoUnidad varchar(100),
economico int,
noTarjeton int,
ruta varchar(100),
observaciones varchar(1000),
fecha datetime,
hora time,
fkUsuario varchar(100) not null,
constraint fkUsuarioVerificacionDia foreign key(fkUsuario)references 
usuarios(usuario))
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
horaSalida time(0),
fkusuario varchar(100),
fkasignacion int,
constraint fkAsignacionSalida foreign key (fkasignacion) references asignacion(idAsignacion),
constraint  fkUsuarioVerificacionSalida foreign key(fkusuario)references usuarios(usuario));
go

create table Informe_Limpieza (
	IdInformeLimpieza INT PRIMARY KEY NOT NULL identity(1,1),
	Fecha_Limpieza DATE NOT NULL,
	Estación VARCHAR(50),
	LimpiezaPiso VARCHAR(5),
	LimpiezaVidrio VARCHAR(5),
	LimpiezaAreaServicios VARCHAR(5),
	LimpiezaAreaEstructura VARCHAR(5),
	LimpiezaTorniquetes VARCHAR(5),
	LimpiezaSanitarios VARCHAR(5),
	Observaciones VARCHAR(1000),
    Usuario VARCHAR (100) FOREIGN KEY REFERENCES Usuarios(Usuario)
);
go
create table Informe_Percances (
	id_Percance INT PRIMARY KEY NOT NULL identity(1,1),
	Fecha_Percance DATE NOT NULL,
	NoEconomico INT,
	ServicioRuta VARCHAR(100),
	TipoUnidad VARCHAR(50),
	Marca VARCHAR(50),
	Modelo VARCHAR(50),
	Color VARCHAR(50),
	Placas VARCHAR(50),
	Conductor VARCHAR(50),
	Tarjeton INT,
	Descripcion VARCHAR(2000),
	Ubicacion VARCHAR(200),
	Hora TIME,
	Fotos image,
	usuario Varchar (100) FOREIGN KEY REFERENCES Usuarios(Usuario)
);
go

create table Informe_incidencias_tecnologicas (
	ID_InformeIncidencias INT PRIMARY KEY NOT NULL identity(1,1),
	Fecha_incidencia DATE NOT NULL,
	Hora_de_registro TIME,
	Servicio VARCHAR(200),
	VehiculoECO VARCHAR(40),
	Equipo_afectado VARCHAR(100),
	Falla VARCHAR(50),
	usuario Varchar (100) FOREIGN KEY REFERENCES Usuarios(Usuario)
);
go



--INSERTAR EN TABLAS--
use ACOTMADB

-- T - 01
insert into horarioServicio
values(103,'2023-02-13','T-01','5:50')
insert into horarioServicio
values(104,'2023-02-13','T-01','06:01')
insert into horarioServicio
values(105,'2023-02-13','T-01','06:12')
insert into horarioServicio
values(106,'2023-02-13','T-01','06:23')
insert into horarioServicio
values(107,'2023-02-13','T-01','06:24')
insert into horarioServicio
values(108,'2023-02-13','T-01','06:45')
--14-02-23
insert into horarioServicio
values(103,'2023-02-14','T-01','5:50')
insert into horarioServicio
values(104,'2023-02-14','T-01','06:01')
insert into horarioServicio
values(105,'2023-02-14','T-01','06:12')
insert into horarioServicio
values(106,'2023-02-14','T-01','06:23')
insert into horarioServicio
values(107,'2023-02-14','T-01','06:24')
insert into horarioServicio
values(108,'2023-02-14','T-01','06:45')
-- 15-02-23
insert into horarioServicio
values(103,'2023-02-15','T-01','5:50')
insert into horarioServicio
values(104,'2023-02-15','T-01','06:01')
insert into horarioServicio
values(105,'2023-02-15','T-01','06:12')
insert into horarioServicio
values(106,'2023-02-15','T-01','06:23')
insert into horarioServicio
values(107,'2023-02-15','T-01','06:24')
insert into horarioServicio
values(108,'2023-02-15','T-01','06:45')
-- 16-02-23
insert into horarioServicio
values(103,'2023-02-16','T-01','5:50')
insert into horarioServicio
values(104,'2023-02-16','T-01','06:01')
insert into horarioServicio
values(105,'2023-02-16','T-01','06:12')
insert into horarioServicio
values(106,'2023-02-16','T-01','06:23')
insert into horarioServicio
values(107,'2023-02-16','T-01','06:24')
insert into horarioServicio
values(108,'2023-02-16','T-01','06:45')
-- 17-02-23
insert into horarioServicio
values(103,'2023-02-17','T-01','5:50')
insert into horarioServicio
values(104,'2023-02-17','T-01','06:01')
insert into horarioServicio
values(105,'2023-02-17','T-01','06:12')
insert into horarioServicio
values(106,'2023-02-17','T-01','06:23')
insert into horarioServicio
values(107,'2023-02-17','T-01','06:24')
insert into horarioServicio
values(108,'2023-02-17','T-01','06:45')

-- T - 02
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(202,'2023-02-13','T-02','06:00')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(203,'2023-02-13','T-02','06:10')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(204,'2023-02-13','T-02','06:21')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(205,'2023-02-13','T-02','06:32')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(206,'2023-02-13','T-02','06:43')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(207,'2023-02-13','T-02','06:54')
-- 14-02-14
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(202,'2023-02-14','T-02','06:00')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(203,'2023-02-14','T-02','06:10')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(204,'2023-02-14','T-02','06:21')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(205,'2023-02-14','T-02','06:32')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(206,'2023-02-14','T-02','06:43')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(207,'2023-02-14','T-02','06:54')
--15-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(202,'2023-02-15','T-02','06:00')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(203,'2023-02-15','T-02','06:10')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(204,'2023-02-15','T-02','06:21')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(205,'2023-02-15','T-02','06:32')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(206,'2023-02-15','T-02','06:43')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(207,'2023-02-15','T-02','06:54')
--16-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(202,'2023-02-16','T-02','06:00')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(203,'2023-02-16','T-02','06:10')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(204,'2023-02-16','T-02','06:21')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(205,'2023-02-16','T-02','06:32')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(206,'2023-02-16','T-02','06:43')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(207,'2023-02-16','T-02','06:54')
--17-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(202,'2023-02-17','T-02','06:00')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(203,'2023-02-17','T-02','06:10')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(204,'2023-02-17','T-02','06:21')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(205,'2023-02-17','T-02','06:32')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(206,'2023-02-17','T-02','06:43')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(207,'2023-02-17','T-02','06:54')
--T - 04
--13-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(403,'2023-02-13','T-04','05:56')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(404,'2023-02-13','T-04','06:09')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(405,'2023-02-13','T-04','06:22')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(406,'2023-02-13','T-04','06:35')
--14-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(403,'2023-02-14','T-04','05:56')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(404,'2023-02-14','T-04','06:09')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(405,'2023-02-14','T-04','06:22')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(406,'2023-02-14','T-04','06:35')
--15-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(403,'2023-02-15','T-04','05:56')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(404,'2023-02-15','T-04','06:09')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(405,'2023-02-15','T-04','06:22')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(406,'2023-02-15','T-04','06:35')
--16-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(403,'2023-02-16','T-04','05:56')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(404,'2023-02-16','T-04','06:09')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(405,'2023-02-16','T-04','06:22')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(406,'2023-02-16','T-04','06:35')
--17-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(403,'2023-02-17','T-04','05:56')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(404,'2023-02-17','T-04','06:09')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(405,'2023-02-17','T-04','06:22')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(406,'2023-02-17','T-04','06:35')

--T - 05
--13-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(506,'2023-02-13','T-05','05:25')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(507,'2023-02-13','T-05','05:34')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(508,'2023-02-13','T-05','05:42')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(509,'2023-02-13','T-05','05:50')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(510,'2023-02-13','T-05','05:58')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(511,'2023-02-13','T-05','06:06')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(512,'2023-02-13','T-05','06:15')
--14-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(506,'2023-02-14','T-05','05:25')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(507,'2023-02-14','T-05','05:34')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(508,'2023-02-14','T-05','05:42')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(509,'2023-02-14','T-05','05:50')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(510,'2023-02-14','T-05','05:58')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(511,'2023-02-14','T-05','06:06')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(512,'2023-02-14','T-05','06:15')
--15-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(506,'2023-02-15','T-05','05:25')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(507,'2023-02-15','T-05','05:34')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(508,'2023-02-15','T-05','05:42')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(509,'2023-02-15','T-05','05:50')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(510,'2023-02-15','T-05','05:58')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(511,'2023-02-15','T-05','06:06')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(512,'2023-02-15','T-05','06:15')
--16-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(506,'2023-02-16','T-05','05:25')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(507,'2023-02-16','T-05','05:34')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(508,'2023-02-16','T-05','05:42')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(509,'2023-02-16','T-05','05:50')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(510,'2023-02-16','T-05','05:58')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(511,'2023-02-16','T-05','06:06')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(512,'2023-02-16','T-05','06:15')
--17-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(506,'2023-02-17','T-05','05:25')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(507,'2023-02-17','T-05','05:34')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(508,'2023-02-17','T-05','05:42')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(509,'2023-02-17','T-05','05:50')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(510,'2023-02-17','T-05','05:58')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(511,'2023-02-17','T-05','06:06')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(512,'2023-02-17','T-05','06:15')
--T - 05 S
--13-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(5101,'2023-02-13','T-05S','06:00')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(5102,'2023-02-13','T-05S','06:52')
--14-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(5101,'2023-02-14','T-05S','06:00')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(5102,'2023-02-14','T-05S','06:52')
--15-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(5101,'2023-02-15','T-05S','06:00')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(5102,'2023-02-15','T-05S','06:52')
--16-03-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(5101,'2023-02-16','T-05S','06:00')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(5102,'2023-02-16','T-05S','06:52')
--17-02-23
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(5101,'2023-02-17','T-05S','06:00')
insert horarioServicio(corrida,fecha,ruta,horarioSalida)
values(5102,'2023-02-1','T-05S','06:52')
--13-02-23
--T-01
select * from asignacion
insert into asignacion(tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 45 , 109,'RAMOS DURAN CARLOS MANUEL',103,CONVERT(date,'13-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 46 , 267,'MARTINEZ MONTA�O FLORENTINO ESMEREGILDO',104,CONVERT(date,'13-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 33 , 184,'FUENTES LOPEZ JUAN JOSE',105,CONVERT(date,'13-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 02 , 110,'S�NCHEZ BAUTISTA ERNESTO',106,CONVERT(date,'13-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 47 , 036,'GARC�A CANO ERNESTO',107,CONVERT(date,'13-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 43 , 067,'MART�NEZ JIM�NEZ ALEJANDRO',108,CONVERT(date,'13-02-2023',105))
--14-02-23
--T-01
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 33 , 184,'FUENTES LOPEZ JUAN JOSE',103,CONVERT(date,'14-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 46 , 024,'CABA�AS GARC�A AGUST�N',104,CONVERT(date,'14-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 45 , 039,'BARAJAS OLMOS GUSTAVO',105,CONVERT(date,'14-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 02 , 110,'S�NCHEZ BAUTISTA ERNESTO',106,CONVERT(date,'14-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 47 , 036,'FUENTES LOPEZ JUAN JOSE',107,CONVERT(date,'14-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', NULL , NULL,NULL,108,CONVERT(date,'14-02-2023',105))
--15-02-23
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 47 , 036,'GARC�A CANO ERNESTO',103,CONVERT(date,'15-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 46 , 267,'MARTINEZ MONTA�O FLORENTINO ESMEREGILDO',104,CONVERT(date,'15-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 18 , 188,'LANGO AVILEZ ISRAEL',105,CONVERT(date,'15-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 05 , 008,'SANTILLAN V�ZQUEZ GLADIS',106,CONVERT(date,'15-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 45 , 020,'BONILLA CABA�AS ALEJANDRO',107,CONVERT(date,'15-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 35 , 048,'BONILLA CABA�AS ALEJANDRO',108,CONVERT(date,'15-02-2023',105))
--16-02-23
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 07 , 034,'PEREZ CASTA�EDA TOMAS',103,CONVERT(date,'16-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 47 , 036,'GARC�A CANO ERNESTO',104,CONVERT(date,'16-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 30 , 110,'S�NCHEZ BAUTISTA ERNESTO',105,CONVERT(date,'16-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 46 , 267,'MARTINEZ MONTA�O FLORENTINO ESMEREGILDO',106,CONVERT(date,'16-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 45 , 039,'GARC�A CANO ERNESTO',107,CONVERT(date,'16-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 05 , 008,'SANTILLAN V�ZQUEZ GLADIS',108,CONVERT(date,'16-02-2023',105))
--17-02-23
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 46 , 143,'ISLAS FLORES JOS�',103,CONVERT(date,'17-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 13 , 546,'L�PEZ BAUTISTA ASUNCI�N ALFONSO',104,CONVERT(date,'17-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 02 , 110,'S�NCHEZ BAUTISTA ERNESTO',105,CONVERT(date,'17-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 47 , 036,'GARC�A CANO ERNESTO',106,CONVERT(date,'17-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 45 , 020,'BONILLA CABA�AS ALEJANDRO',107,CONVERT(date,'17-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 05 , 358,'MENESES MENDOZA EDUARDO ',108,CONVERT(date,'17-02-2023',105))
-- Permisos
insert into permisos(permiso)values('Titan');
insert into permisos(permiso)values('Cronos')
-- Usuarios
insert into Usuarios (Usuario, Nombre, ApellidoP, ApellidoM, Pass) values ('Titan 1', 'Carlita Collinwood', 'Harberer', 'Tonner', 'Collinwood');
insert into Usuarios (Usuario, Nombre, ApellidoP, ApellidoM, Pass) values ('Titan 2', 'Donall MacKim', 'Scandrett', 'Dinnage', 'MacKim');
insert into Usuarios (Usuario, Nombre, ApellidoP, ApellidoM, Pass) values ('Cronos 1', 'Mayne Blaydes', 'Softley', 'Caspell', 'Blaydes');
insert into Usuarios (Usuario, Nombre, ApellidoP, ApellidoM, Pass) values ('Cronos 2', 'Patsy Maestro', 'Mellers', 'McJury', 'Maestro');
-- Informe de Limpieza
insert into Informe_Limpieza ( Fecha_Limpieza, Estación, LimpiezaPiso, LimpiezaVidrio, LimpiezaAreaServicios, LimpiezaAreaEstructura, LimpiezaTorniquetes, LimpiezaSanitarios, Observaciones, Usuario) values ('1/7/2023', 'Centro HISTORICO', 'false', 'true', 'true', 'false', 'false', 'false','fALTO LAVAR LO BAÑOS', 'Titan 1');
insert into Informe_Limpieza ( Fecha_Limpieza, Estación, LimpiezaPiso, LimpiezaVidrio, LimpiezaAreaServicios, LimpiezaAreaEstructura, LimpiezaTorniquetes, LimpiezaSanitarios, Observaciones, Usuario) values ( '12/27/2022', 'Seph', 'true', 'false', 'true', 'true','true', 'true', 'FALTA MAS JABON', 'Titan 2');
insert into Informe_Limpieza ( Fecha_Limpieza, Estación, LimpiezaPiso, LimpiezaVidrio, LimpiezaAreaServicios, LimpiezaAreaEstructura, LimpiezaTorniquetes, LimpiezaSanitarios, Observaciones, Usuario) values ( '6/20/2022', 'Finance: Consumer Services', 'false', 'false', 'false', 'false', 'false', 'true', 'PONER MAS CLORO', 'Cronos 1');
insert into Informe_Limpieza ( Fecha_Limpieza, Estación, LimpiezaPiso, LimpiezaVidrio, LimpiezaAreaServicios, LimpiezaAreaEstructura, LimpiezaTorniquetes, LimpiezaSanitarios, Observaciones, Usuario) values ( '12/15/2022', 'Department/Specialty Retail Stores', 'true', 'false', 'false', 'false', 'true', 'true', 'EJEMPLO', 'Cronos 2');
-- informe de incidencias tecnologicas
insert into Informe_incidencias_tecnologicas (Fecha_incidencia, Hora_de_registro, Servicio, VehiculoECO, Equipo_afectado, Falla, Usuario) values ('4/3/2022', '6:20', 'Oilfield Services/Equipment', 'KL4CJDSB5EB819821', 'Wood', 'Rubber', 'Titan 1');
insert into Informe_incidencias_tecnologicas ( Fecha_incidencia, Hora_de_registro, Servicio, VehiculoECO, Equipo_afectado, Falla, Usuario) values ('10/20/2022', '8:58', 'Telecommunications Equipment', 'WAUMF98KX9A247475', 'Wood', 'Steel', 'Titan 2');
insert into Informe_incidencias_tecnologicas ( Fecha_incidencia, Hora_de_registro, Servicio, VehiculoECO, Equipo_afectado, Falla, Usuario) values ( '11/10/2022', '2:49', 'Major Pharmaceuticals', '1GKMCAE36AR742244', 'Granite', 'Wood', 'Cronos 1');
insert into Informe_incidencias_tecnologicas ( Fecha_incidencia, Hora_de_registro, Servicio, VehiculoECO, Equipo_afectado, Falla, Usuario) values ( '8/26/2022', '2:23', 'Precious Metals', 'JN1CV6EK9FM872449', 'Rubber', 'Plexiglass', 'Cronos 2');
-- insertar permiso de usuarios
insert into permisoUsuario(permiso,usuario)values('Cronos','Cronos 1')
insert into permisoUsuario(permiso,usuario)values('Cronos','Cronos 2')
insert into permisoUsuario(permiso,usuario)values('Titan','Titan 1')
insert into permisoUsuario(permiso,usuario)values('Titan','Titan 2')





