# Sistema de Gestión para Tienda Online (SQL Database)
Este proyecto es una implementación de una base de datos relacional diseñada para gestionar las operaciones básicas de una tienda online. Su objetivo principal es demostrar mis habilidades en el diseño, creación y manipulación de bases de datos utilizando SQL y SQLite.

## 🚀 Objetivo del Proyecto
El propósito de este proyecto es mostrar mi competencia en:

Creación de tablas (CREATE TABLE) y definición de sus atributos.

Selección adecuada de VARCHAR, INT, DECIMAL, DATE, TEXT, etc.

Implementación de claves primarias (PRIMARY KEY) y claves foráneas (FOREIGN KEY) para establecer relaciones y asegurar la integridad de los datos.

Inserción (INSERT INTO), selección (SELECT), actualización (UPDATE) y eliminación (DELETE) de registros.

Uso de JOIN para combinar datos de múltiples tablas, GROUP BY y funciones de agregación (SUM, COUNT) para análisis, y HAVING para filtrar resultados agrupados.

## ⚙️ Tecnologías Utilizadas
SQL: Lenguaje de consulta estructurado.

SQLite: Sistema de gestión de bases de datos relacionales ligero y basado en archivos, ideal para este tipo de proyectos de demostración.

Visual Studio Code (VS Code): Editor de código.

Extensión SQLite para VS Code: Para interactuar y visualizar la base de datos.

## 📊 Estructura de la Base de Datos (Diagrama ERD)
La base de datos está compuesta por cuatro tablas principales que se interrelacionan para gestionar clientes, productos y sus pedidos:

Fragmento de código:

    Clientes {
        INTEGER id_cliente PK
        VARCHAR nombre
        VARCHAR apellido
        VARCHAR email UNIQUE
        VARCHAR telefono
        VARCHAR direccion
    }

    Productos {
        INTEGER id_producto PK
        VARCHAR nombre
        TEXT descripcion
        DECIMAL precio
        INTEGER stock
    }

    Pedidos {
        INTEGER id_pedido PK
        INTEGER id_cliente FK
        DATE fecha_pedido
        VARCHAR estado
    }

    DetallesPedido {
        INTEGER id_detalle PK
        INTEGER id_pedido FK
        INTEGER id_producto FK
        INTEGER cantidad
        DECIMAL precio_unitario
    }
Clientes: Almacena la información de los usuarios registrados en la tienda.

Productos: Contiene los detalles de los artículos disponibles para la venta.

Pedidos: Registra cada compra realizada por un cliente.

DetallesPedido: Actúa como una tabla intermedia, especificando qué productos y en qué cantidad se incluyeron en cada pedido, registrando el precio exacto del producto en el momento de la compra.

## 🚀Cómo Ponerlo en Marcha
Para explorar este proyecto SQL en tu entorno local, sigue estos sencillos pasos:

Clona el Repositorio:

Bash

git clone https://github.com/Ernesto800/TiendaSQLTest.git
cd TiendaSQLTest
Abre en VS Code:
Abre la carpeta TiendaSQLTest con Visual Studio Code.

Instala la Extensión SQLite:
Asegúrate de tener instalada la extensión "SQLite" (del autor AlexCVan) en VS Code.

Crea la Base de Datos:

En VS Code, abre la paleta de comandos (Ctrl+Shift+P o Cmd+Shift+P).

Busca y selecciona "SQLite: New Database".

Navega a la carpeta de tu proyecto (TiendaSQLTest), nombra el archivo de la base de datos tienda.db y guárdalo.

Crea las Tablas:

Abre el archivo schema.sql.

Asegúrate de que estás conectado a tienda.db (ver la barra de estado inferior de VS Code).

Haz clic derecho en cualquier parte del código de schema.sql y selecciona "SQLite: Run Query" o "SQLite: Run SQL".

Verifica en el explorador SQLite (el icono de la base de datos en la barra lateral) que las tablas Clientes, Productos, Pedidos y DetallesPedido se han creado.

Inserta Datos de Ejemplo:

Abre el archivo data.sql.

Con tienda.db aún conectado, haz clic derecho en el código de data.sql y selecciona "SQLite: Run Query" o "SQLite: Run SQL".

Puedes verificar la inserción de datos haciendo clic derecho en una tabla en el explorador SQLite y seleccionando "Show Table".

## 🔍 Consultas SQL Destacadas
En el archivo queries.sql encontrarás una colección de consultas que demuestran la interacción con la base de datos. Aquí te presento algunas de las más interesantes:

1. Clientes y sus Pedidos
Esta consulta combina datos de las tablas Clientes y Pedidos para mostrar qué cliente realizó cada pedido.

id_pedido | nombre_cliente | apellido_cliente | fecha_pedido | estado
----------|----------------|------------------|--------------|----------
1         | Ana            | García           | 2025-06-15   | Enviado
2         | Juan           | Martínez         | 2025-06-18   | Pendiente
3         | Ana            | García           | 2025-06-20   | Entregado
2. Detalle de Productos por Pedido (con Precios y Cantidades)
Esta consulta muestra los productos específicos incluidos en cada pedido, junto con su cantidad y el precio unitario en el momento de la compra.


id_pedido | producto_nombre   | cantidad | precio_unitario | subtotal_linea
----------|-------------------|----------|-----------------|---------------
1         | Ratón Gaming      | 2        | 45.00           | 90.00
1         | Teclado Mecánico  | 1        | 85.50           | 85.50
2         | Monitor Curvo 27" | 1        | 299.99          | 299.99
3         | Ratón Gaming      | 1        | 45.00           | 45.00
3         | Webcam Full HD    | 1        | 59.99           | 59.99
3. Valor Total de Cada Pedido
Utiliza funciones de agregación para calcular el coste total de cada pedido.


id_pedido | valor_total_pedido
----------|-------------------
2         | 299.99
1         | 175.50
3         | 104.99
4. Clientes que Han Comprado Más de un Tipo de Producto
Esta consulta identifica a los clientes que han diversificado sus compras, comprando más de un producto diferente.


nombre | apellido | productos_diferentes_comprados
-------|----------|-------------------------------
Ana    | García   | 3
