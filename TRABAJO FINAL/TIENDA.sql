USE bd_bodega;
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
nombre varchar(18)not null,
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
idproducto int,
monto decimal(12,2) not null,
cantidad int (12) not null,
fecha_pedido date null
);

-- crear tabla venta
CREATE TABLE factura
(
idfactura int(9) not null primary key,
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
idforma_de_pago int(15) not null primary key,
descripcion_formapago varchar (30)
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
CREATE TABLE inventario
(
idinventario int(8) not null primary key,
idproducto int,
piezas_entrada int(5),
piezas_vendida int(7),
total_restante int(6)
);
 
-- INSERTAR DATOS EN LA TABLA cliente
INSERT INTO cliente(idcliente,nombre,apellido,telefono) Values (102,'Daniel','Martines','985146633');
INSERT INTO cliente(idcliente,nombre,apellido,telefono) Values (103,'Enrrique','Caseres','998745137');
INSERT INTO cliente(idcliente,nombre,apellido,telefono) Values (104,'Mario','Gamboa','900123456');
INSERT INTO cliente(idcliente,nombre,apellido,telefono) Values (105,'Marisol','Tarazona','987654102');
INSERT INTO cliente(idcliente,nombre,apellido,telefono) Values (101,'Carlos','Morales','987654123');

select *from cliente;

-- Insertar datos en la tabla categoria
INSERT INTO `bd_bodega`.`categoria` (`idcategoria`, `idproducto`, `nombre`, `descripcion`) VALUES ('107', '1011', 'Producto limpieza', 'Hogar');
INSERT INTO `bd_bodega`.`categoria` (`idcategoria`, `idproducto`, `nombre`, `descripcion`) VALUES ('108', '1012', 'Dulces', 'Fiesta');
INSERT INTO `bd_bodega`.`categoria` (`idcategoria`, `idproducto`, `nombre`, `descripcion`) VALUES ('109', '103', 'Abarrotes', ' Al alcalse del volsillo');

select * from categoria;

INSERT INTO `bd_bodega`.`devolucion` (`iddevolucion`, `motivo`, `fecha_devolucion`) VALUES ('1020', 'Producto vencido', '2023-04-18  12:30:50');
INSERT INTO `bd_bodega`.`devolucion` (`iddevolucion`, `motivo`, `fecha_devolucion`) VALUES ('1021', 'Llego abierto', '2023-03-17    14:45:50');
UPDATE `bd_bodega`.`devolucion` SET `fecha_devolucion` = '2023-05-18 13:00:50' WHERE (`iddevolucion` = '1019');
select * from devolucion;

-- insertar datos en la tabla direccion

INSERT INTO direccion(iddirecion,idcliente,ruc,calle,numero,comuna,cuidad) Values (1023,1030,'las flores',1024,'Huanuco');
INSERT INTO direccion(iddirecion,idcliente,ruc,calle,numero,comuna,cuidad) Values (1024,1031,'La laguna',1012,'Huanuco');
INSERT INTO direccion(iddirecion,idcliente,ruc,calle,numero,comuna,cuidad) Values (1025,1032,'jr.Ayacucho',1039,'Lima');
select * from direccion;

-- Insertar datos en la tabla empleados
INSERT INTO `bd_bodega`.`empleados` (`idempleados`, `nombre`, `apellido`, `cargo`) VALUES ('1045', 'Mariana', 'Flores', 'Cajera');
INSERT INTO `bd_bodega`.`empleados` (`idempleados`, `nombre`, `apellido`, `cargo`) VALUES ('1046', 'Maria', 'Pilar', 'Pasillera');
INSERT INTO `bd_bodega`.`empleados` (`idempleados`, `nombre`, `apellido`, `cargo`) VALUES ('1047', 'Maximo', 'Soto', 'Pasillero');
INSERT INTO `bd_bodega`.`empleados` (`idempleados`, `nombre`, `apellido`, `cargo`) VALUES ('1048', 'Alex', 'Linares', 'Almacenero');
INSERT INTO `bd_bodega`.`empleados` (`idempleados`, `nombre`, `apellido`, `cargo`) VALUES ('1049', 'Jorge', 'Garcia', 'Almacenero');
select * from empleados;

-- Insertar datos de la tabla factura
INSERT INTO factura(idfactura,idforma_de_pago,fecha,cliente,descuento,nombre_empleado,cantidad_vendida) Values (117,160,2023-05-14,'Danilo Salazar',4.5,'Maria Pilar',10);
INSERT INTO factura(idfactura,idforma_de_pago,fecha,cliente,descuento,nombre_empleado,cantidad_vendida) Values (118,161,2023-05-12,'Marcos Peres',8.4,'MMaximo Soto',20);
INSERT INTO factura(idfactura,idforma_de_pago,fecha,cliente,descuento,nombre_empleado,cantidad_vendida) Values (119,162,2023-05-11,'Daniel Lino',6.1,'Mariana Flores',15);
INSERT INTO factura(idfactura,idforma_de_pago,fecha,cliente,descuento,nombre_empleado,cantidad_vendida) Values (120,163,2023-05-10,'Paola Bracho',1.5,'Maximo Soto',3);
INSERT INTO factura(idfactura,idforma_de_pago,fecha,cliente,descuento,nombre_empleado,cantidad_vendida) Values (121,164,2023-05-09,'Giovani Palomino',2.1,'Maria Pilar',6);
select * from factura;

-- Innsertar datos en la tabla forma_de_pago

INSERT INTO `bd_bodega`.`forma_de_pago` (`idforma_de_pago`, `descripcion_formapago`) VALUES ('207', 'Trajeta de credito');
INSERT INTO `bd_bodega`.`forma_de_pago` (`idforma_de_pago`, `descripcion_formapago`) VALUES ('208', 'Efectivo');
INSERT INTO `bd_bodega`.`forma_de_pago` (`idforma_de_pago`, `descripcion_formapago`) VALUES ('209', 'Pago movil');

select * from forma_de_pago;

-- Insertar datos en la tabla orario

INSERT INTO `bd_bodega`.`horario` (`idhorario`, `hora_de_atencion`, `hora_trabajo`) VALUES ('3002', '7:45am a 7:45pm', '7:15am ');
select *from horario;

-- Insertar datos en la tabla inventario

INSERT INTO `bd_bodega`.`iventario` (`idinventario`, `idproducto`, `piezas_entrada`, `piezas_vendida`, `total_restante`) VALUES ('3003', '301', '95', '54', '41');
INSERT INTO `bd_bodega`.`iventario` (`idinventario`, `idproducto`, `piezas_entrada`, `piezas_vendida`, `total_restante`) VALUES ('3004', '302', '80', '60', '20');
INSERT INTO `bd_bodega`.`iventario` (`idinventario`, `idproducto`, `piezas_entrada`, `piezas_vendida`, `total_restante`) VALUES ('3005', '303', '100', '37', '63');
INSERT INTO `bd_bodega`.`iventario` (`idinventario`, `idproducto`, `piezas_entrada`, `piezas_vendida`, `total_restante`) VALUES ('3006', '304', '123', '67', '56');

select * from iventario;

-- Ingresar datos de la tabla pedido

INSERT INTO `bd_bodega`.`pedido` (`idpedido`, `idcliente`, `monto`, `cantidad`, `fecha_pedido`) VALUES ('7001', '102', '158.2', '10', '2023-05-22');
INSERT INTO `bd_bodega`.`pedido` (`idpedido`, `idcliente`, `monto`, `cantidad`, `fecha_pedido`) VALUES ('7002', '103', '65.8', '23', '2023-04-21');
INSERT INTO `bd_bodega`.`pedido` (`idpedido`, `idcliente`, `monto`, `cantidad`, `fecha_pedido`) VALUES ('7003', '104', '32.1', '8', '2023-05-19');
INSERT INTO `bd_bodega`.`pedido` (`idpedido`, `idcliente`, `monto`, `cantidad`, `fecha_pedido`) VALUES ('7004', '105', '15.6', '3', '2023-05-14');

select * from pedido;

-- Insertar datos en la tabla producto

INSERT INTO `bd_bodega`.`producto` (`idproducto`, `nombre`, `precio_unitario`, `precio_venta`, `stock`, `Nombre_del_proveedor`) VALUES ('301', 'Yogour Mango', '4.5', '5.5', '10', 'Mariano Lopez');
INSERT INTO `bd_bodega`.`producto` (`idproducto`, `nombre`, `precio_unitario`, `precio_venta`, `stock`, `Nombre_del_proveedor`) VALUES ('302', 'Leche gloria 165g', '2.2', '2.5', '15', 'Maria Sabedra');
INSERT INTO `bd_bodega`.`producto` (`idproducto`, `nombre`, `precio_unitario`, `precio_venta`, `stock`, `Nombre_del_proveedor`) VALUES ('303', 'Avena 110g', '1.0', '1.5', '6', 'Teodora Marques');
INSERT INTO `bd_bodega`.`producto` (`idproducto`, `nombre`, `precio_unitario`, `precio_venta`, `stock`, `Nombre_del_proveedor`) VALUES ('304', 'Atun Susi mar', '3.2', '3.5', '9', 'Rosa Fuentes');

select * from producto;
 
 -- Insertar datos a la tabla de proveedor
 
 INSERT INTO `bd_bodega`.`proveedor` (`idproveedor`, `ruc`, `nombre`, `telefono`, `pagina_web`) VALUES ('6001', '1003247', 'Mariano Lopez', '932165487', 'MayoristaML');
INSERT INTO `bd_bodega`.`proveedor` (`idproveedor`, `ruc`, `nombre`, `telefono`, `pagina_web`) VALUES ('6002', '1024896', 'Maria Sabedra', '900123456', 'MSMayorista');
INSERT INTO `bd_bodega`.`proveedor` (`idproveedor`, `ruc`, `nombre`, `telefono`, `pagina_web`) VALUES ('6003', '1023795', 'Teodora Marques', '987654321', 'MayoristaTM');
INSERT INTO `bd_bodega`.`proveedor` (`idproveedor`, `ruc`, `nombre`, `telefono`, `pagina_web`) VALUES ('6004', '1074362', 'Rosa Fuentes', '930215786', 'RFExportacion');

 select * from proveedor;