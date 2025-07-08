
CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);


CREATE TABLE Productos (
    id_producto INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INTEGER NOT NULL CHECK (stock >= 0)
);


CREATE TABLE Pedidos (
    id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    fecha_pedido DATE NOT NULL,
    estado VARCHAR(50) DEFAULT 'Pendiente',
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);


CREATE TABLE DetallesPedido (
    id_detalle INTEGER PRIMARY KEY AUTOINCREMENT,
    id_pedido INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);