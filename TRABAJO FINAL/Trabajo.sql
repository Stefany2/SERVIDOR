CREATE DATABASE tienda23;
USE tienda23;
-- crear tabla de cliente
CREATE TABLE cliente
(
idcliente int(9) not null auto_increment,
ruc integer(10),
nombre varchar (20) not null,
apellido varchar (20)not null,
telefono int (9) not null,
primary key (idcliente)
);
-- crear table de producto
CREATE TABLE producto
(
idproducto int(9) not null  primary key,
nombre varchar(15)not null,
precio_unitario decimal (12,2) not null,
precio_venta decimal(6,2) not null,
stock integer null ,
Nombre_del_proveedor varchar (20) 
);

-- crear tabla de categoria
CREATE TABLE categoria
(
idcategoria int(9) primary key,
idproducto int,
nombre varchar (22) not null,
descripcion varchar (50) not null
);

-- crear tabla de proveedor
CREATE TABLE proveedor
(
idproveedor int(9)not null primary key,
ruc integer(10) not null,
nombre char(20) not null,
telefono int(9) not null,
pagina_web varchar(200)not null
);

-- crear tabla de direccion
CREATE TABLE direccion
(
iddireccion int(9) not null primary key,
idcliente int,
calle char(25) not null,
numero int (6) not null,
comuna char(10),
cuidad varchar(10) not null
);
-- crear tabla pedido

CREATE TABLE pedido
(
idpedido int(9) not null primary key,
idcliente int,
monto decimal(12,2) not null,
cantidad int (12) not null,
fecha_pedido date null
);

-- crear tabla venta
CREATE TABLE factura
(
idventa int(9) not null primary key,
idforma_de_pago int,
fecha date not null,
cliente varchar(20) not null,
descuento float(3,2) not null,
nombre_empleado varchar(25),
cantidad_vendida int
);
-- crear tabla de pago
CREATE TABLE forma_de_pago
(
idforma_de_pago int not null primary key,
descripcion_formapago varchar (20)
);

-- crear tabla de devolucion

CREATE TABLE devolucion
(
iddevolucion int(9) not null primary key,
motivo varchar(15) not null,
fecha_devolucion timestamp
);

-- crear tabla de empleados
CREATE TABLE empleados
(
idempleados int(9) not null primary key,
nombre char(15) not null,
apellido varchar(15)not null,
cargo char(20) not null
);

-- crear tabla de horario de trabajo
CREATE TABLE horario
(
idhorario int(8) not null primary key,
hora_de_atencion time,
hora_trabajo time
);

-- crear tabla de almacen
CREATE TABLE iventario
(
iinventario int(8) not null primary key,
idproducto int,
piezas_entrada int(5),
piezas_vendida int(7),
total_restante int(6)
);

