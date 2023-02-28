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
values('Gran Vial', 46 , 267,'MARTINEZ MONTAÑO FLORENTINO ESMEREGILDO',104,CONVERT(date,'13-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 33 , 184,'FUENTES LOPEZ JUAN JOSE',105,CONVERT(date,'13-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 02 , 110,'SÁNCHEZ BAUTISTA ERNESTO',106,CONVERT(date,'13-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 47 , 036,'GARCÍA CANO ERNESTO',107,CONVERT(date,'13-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 43 , 067,'MARTÍNEZ JIMÉNEZ ALEJANDRO',108,CONVERT(date,'13-02-2023',105))
--14-02-23
--T-01
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 33 , 184,'FUENTES LOPEZ JUAN JOSE',103,CONVERT(date,'14-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 46 , 024,'CABAÑAS GARCÍA AGUSTÍN',104,CONVERT(date,'14-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 45 , 039,'BARAJAS OLMOS GUSTAVO',105,CONVERT(date,'14-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 02 , 110,'SÁNCHEZ BAUTISTA ERNESTO',106,CONVERT(date,'14-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 47 , 036,'FUENTES LOPEZ JUAN JOSE',107,CONVERT(date,'14-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', NULL , NULL,NULL,108,CONVERT(date,'14-02-2023',105))
--15-02-23
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 47 , 036,'GARCÍA CANO ERNESTO',103,CONVERT(date,'15-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 46 , 267,'MARTINEZ MONTAÑO FLORENTINO ESMEREGILDO',104,CONVERT(date,'15-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 18 , 188,'LANGO AVILEZ ISRAEL',105,CONVERT(date,'15-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 05 , 008,'SANTILLAN VÁZQUEZ GLADIS',106,CONVERT(date,'15-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 45 , 020,'BONILLA CABAÑAS ALEJANDRO',107,CONVERT(date,'15-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 35 , 048,'BONILLA CABAÑAS ALEJANDRO',108,CONVERT(date,'15-02-2023',105))
--16-02-23
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 07 , 034,'PEREZ CASTAÑEDA TOMAS',103,CONVERT(date,'16-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 47 , 036,'GARCÍA CANO ERNESTO',104,CONVERT(date,'16-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 30 , 110,'SÁNCHEZ BAUTISTA ERNESTO',105,CONVERT(date,'16-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 46 , 267,'MARTINEZ MONTAÑO FLORENTINO ESMEREGILDO',106,CONVERT(date,'16-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 45 , 039,'GARCÍA CANO ERNESTO',107,CONVERT(date,'16-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 05 , 008,'SANTILLAN VÁZQUEZ GLADIS',108,CONVERT(date,'16-02-2023',105))
--17-02-23
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 46 , 143,'ISLAS FLORES JOSÉ',103,CONVERT(date,'17-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 13 , 546,'LÓPEZ BAUTISTA ASUNCIÓN ALFONSO',104,CONVERT(date,'17-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 02 , 110,'SÁNCHEZ BAUTISTA ERNESTO',105,CONVERT(date,'17-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 47 , 036,'GARCÍA CANO ERNESTO',106,CONVERT(date,'17-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 45 , 020,'BONILLA CABAÑAS ALEJANDRO',107,CONVERT(date,'17-02-2023',105))
insert into asignacion (tipoUnidad,economico,tarjeton,nomChofer,fkCorrida,fkFecha)
values('Gran Vial', 05 , 358,'MENESES MENDOZA EDUARDO ',108,CONVERT(date,'17-02-2023',105))




