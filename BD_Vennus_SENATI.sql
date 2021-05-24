create database bd_senati_vennus
go

use bd_senati_vennus
go

create table tb_departamento(
	codigo_departamento char(5) not null primary key,
	departamento varchar (20) not null)
go

create table tb_provincia(
	codigo_provincia char(5) not null primary key,
	provincia varchar(20) not null)
go

create table tb_distrito(
	codigo_distrito char(5) not null primary key,
	distrito varchar(20) not null)
go

create table tb_clientes(
	id_clientes char(5) not null primary key,
	nombre varchar(25) not null,
	apellido varchar(25) not null,
	correo varchar(50) not null,
	numero varchar(13),
	departamento char(5) not null foreign key references tb_departamento (codigo_departamento),
	provincia char(5) not null foreign key references tb_provincia (codigo_provincia),
	distrito char(5) not null foreign key references tb_distrito (codigo_distrito),
	direccion varchar(50))
go

create table tb_producto(
	id char(5) not null primary key,
	nombre_p varchar(35) not null,
	precio char(7) not null,
	marca varchar(20) not null,
	estado varchar(1) not null)
go

create table tb_d_producto(
	id_producto char(5) not null foreign key references tb_producto (id),
	talla char(2) not null,
	color varchar(10) not null)
go

create table tb_pais(
	id_pais char(5) not null primary key,
	pais varchar(20) not null)
go

create table tb_provedor(
	id_provedor char(5) not null primary key,
	nombre_provedor varchar(25) not null,
	correo varchar(30) not null,
	telefono varchar(13) not null,
	id_pais char(5) not null foreign key references tb_pais (id_pais))
go

create table productos_provedor(
	id_provedor char(5) not null foreign key references tb_provedor(id_provedor),
	id_producto char(5) not null foreign key references tb_producto(id))
go

create table  tb_pedido(
	id_pedido char(5) not null primary key,
	id_cliente char(5) not null foreign key references tb_clientes(id_clientes),
	fecha date,
	hora time,
	importe char(7) not null,
	proceso char(1))
go

create table tb_detalle_pedido(
	id_pedido char(5) not null foreign key references tb_pedido (id_pedido),
	id_producto char(5) not null foreign key references tb_producto(id),
	cantidad char(4) not null,
	precio char(7) not null)
go
