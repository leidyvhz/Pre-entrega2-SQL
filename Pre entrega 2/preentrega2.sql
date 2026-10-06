create database retail_project;

create table clientes(
	id_cliente integer primary key,
	nombre varchar(150) not null,
	email varchar(100) not null unique,
	edad integer check (edad >= 18) not null
);

create table productos(
	id_producto serial primary key,
	nombre varchar(100) not null,
	stock integer check (stock >= 0) not null,
	precio decimal check (precio > 0) not null,
	categoria varchar(50) not null
);

create table ventas(
	id_venta serial primary key,
	id_cliente integer not null references clientes,
	id_producto integer not null references productos,
	cantidad integer check (cantidad > 0) not null,
	fecha date not null
);

begin;

insert into clientes(id_cliente, nombre, email, edad)
values
	(123, 'Leidy Herrera', 'leidy.herrera@correo.com', 33),
	(456, 'Violetta Tovar', 'violetta.tovar@correo.com', 19),
	(789, 'Laura Gómez', 'laura.gomez@correo.com', 28),
	(012, 'Carlos Pérez', 'carlos.perez@correo.com', 35),
	(345, 'Julian Jaramillo', 'julian.jaramillo@correo.com', 27);

insert into productos(nombre, stock, precio, categoria)
values
	('Camiseta Algodón', 50, 25.00,'Prenda superior'),
	('Pantalón Jean', 30, 45.50, 'Prenda inferior'),
	('Blusa lino', 12, 35.25, 'Prenda superior'),
	('Short denim', 65, 38.50, 'Prenda inferior'),
	('Vestido poliester', 15, 55.95, 'Prenda superior');

insert into ventas(id_cliente, id_producto, cantidad, fecha)
values
	(123, 2, 3, '2026-07-05'),
	(12, 1, 1, '2026-06-25'),
	(345, 5, 6, '2025-08-20'),
	(123, 1, 5, '2025-12-07'),
	(456, 3, 10, '2026-03-02');

UPDATE productos
SET precio = precio + 0.50
WHERE precio < 30.00;

delete from ventas
WHERE id_venta = 3;

commit;

select * from clientes;
select * from productos;
select * from ventas;