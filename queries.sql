SELECT * FROM Productos;

SELECT nombre, apellido, email FROM Clientes WHERE nombre LIKE 'J%';

SELECT nombre, stock FROM Productos WHERE stock < 50 ORDER BY stock ASC;

SELECT id_producto, cantidad, precio_unitario FROM DetallesPedido WHERE id_pedido = 1;