INSERT INTO Clientes (nombre, apellido, email, telefono, direccion) VALUES
('Ana', 'García', 'ana.garcia@email.com', '600112233', 'Calle Sal 153'),
('Juan', 'Martínez', 'juan.martinez@email.com', '611223344', 'Avenida vivanzo 742'),
('María', 'López', 'maria.lopez@email.com', '622334455', 'Plaza Menor 1');

INSERT INTO Productos (nombre, descripcion, precio, stock) VALUES
('Teclado Mecánico', 'Teclado RGB', 85.50, 50),
('Ratón Gaming', 'Ratón ergonómico', 45.00, 120),
('Monitor Curvo 27"', 'Monitor 144Hz HD', 299.99, 30),
('Webcam Full HD', 'Cámara web', 59.99, 80);

INSERT INTO Pedidos (id_cliente, fecha_pedido, estado) VALUES
(1, '2025-06-15', 'Enviado'),
(2, '2025-06-18', 'Pendiente'),
(1, '2025-06-20', 'Entregado'),
(3, '2025-07-14', 'Enviado');

INSERT INTO DetallesPedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 85.50),
(1, 2, 2, 45.00),
(2, 3, 1, 299.99),
(3, 4, 1, 59.99),
(3, 2, 1, 45.00);