Este repositorio contiene el script en SQL para la creación, inserción de datos iniciales, actualización y consulta de la base de datos retail_project en PostgreSQL.

Requisitos Previos:
* PostgreSQL (versión 12 o superior).
* pgAdmin 4 o acceso a la consola/terminal interactiva psql.

Estructura de la Base de Datos:
La base de datos consta de 3 tablas relacionales:
* clientes: Guarda la información de los usuarios (ID, nombre, correo y edad). Incluye validación de mayoría de edad (edad >= 18).
* productos: Catálogo de productos con control de inventario (stock >= 0), precio mayor a cero (precio > 0) y categoría.
* ventas: Registro de transacciones que conecta clientes y productos mediante llaves foráneas (Foreign Keys).

Instrucciones de Ejecución:

Opción 1: Desde pgAdmin 4 (Interfaz Gráfica)
1. Crear la Base de Datos:
	* Abre pgAdmin 4 y conéctate a tu servidor.
	* Haz clic derecho sobre Databases > Create > Database...
	* Nombra la base de datos como retail_project y guarda los cambios.
2. Abrir la Herramienta de Consultas (Query Tool):
	* Haz clic derecho sobre la base de datos retail_project recién creada y 	selecciona Query Tool.
3. Ejecutar el Script:
	* Copia y pega el código completo en la ventana del editor.
	* Presiona el botón de ejecución (Play / F5).

Opción 2: Desde la consola interactiva (psql)
1. Abre tu terminal o símbolo del sistema.
2. Inicia sesión en PostgreSQL y crea la base de datos:
	SQL
	psql -U postgres
	CREATE DATABASE retail_project;
3. Conéctate a la nueva base de datos:
	SQL
	\c retail_project
4. Ejecuta el script copiándolo directamente en la consola o cargando el archivo .sql:
	Bash
	\i ruta/de_tu_archivo/script.sql

Resumen del Flujo de Ejecución del Script
1. Definición del Esquema:
	* Crea las tablas clientes, productos y ventas definiendo sus claves 	primarias, foráneas y restricciones CHECK.
2. Transacción Controlada (BEGIN ... COMMIT):
	* Inserción: Registra 5 clientes, 5 productos y 5 ventas.
	* Actualización: Incrementa en $0.50 el precio de todos los productos cuyo 	costo actual sea menor a $30.00.
	* Eliminación: Remueve el registro de la venta con id_venta = 3.
	* Persistencia: Aplica de manera atómica todos los cambios mediante el 	comando COMMIT.
3. Verificación:
	* Ejecuta consultas SELECT * para mostrar el estado final de las tablas.