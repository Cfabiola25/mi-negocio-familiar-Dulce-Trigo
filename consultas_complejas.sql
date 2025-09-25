-- consultas_complejas.sql
-- 10 consultas con JOINs

-- 1. Productos con su categoría
SELECT p.nombre, c.nombre AS categoria
FROM productos p JOIN categorias c ON p.id_categoria = c.id_categoria;

-- 2. Ventas con cliente y empleado
SELECT v.numero_factura, cli.nombres AS cliente, emp.nombres AS empleado, v.total
FROM ventas v
JOIN clientes cli ON v.id_cliente = cli.id_cliente
JOIN empleados emp ON v.id_empleado = emp.id_empleado;

-- 3. Detalle de venta con producto
SELECT v.numero_factura, p.nombre, d.cantidad, d.subtotal
FROM detalle_venta d
JOIN productos p ON d.id_producto = p.id_producto
JOIN ventas v ON d.id_venta = v.id_venta;

-- 4. Compras con proveedor
SELECT c.numero_factura, pr.nombre, c.total
FROM compras c JOIN proveedores pr ON c.id_proveedor = pr.id_proveedor;

-- 5. Inventario con nombre producto
SELECT p.nombre, i.lote, i.stock
FROM inventario i JOIN productos p ON i.id_producto = p.id_producto;

-- 6. Pedidos con cliente y estado
SELECT ped.id_pedido, cli.nombres, ped.estado
FROM pedidos ped JOIN clientes cli ON ped.id_cliente = cli.id_cliente;

-- 7. Productos más caros que 3000
SELECT nombre, precio FROM productos WHERE precio > 3000;

-- 8. Total vendido por empleado
SELECT emp.nombres, SUM(v.total) AS total_vendido
FROM ventas v JOIN empleados emp ON v.id_empleado = emp.id_empleado
GROUP BY emp.nombres;

-- 9. Clientes y total de pedidos
SELECT cli.nombres, COUNT(ped.id_pedido) AS pedidos
FROM clientes cli LEFT JOIN pedidos ped ON cli.id_cliente = ped.id_cliente
GROUP BY cli.nombres;

-- 10. Productos sin ventas
SELECT p.nombre
FROM productos p
LEFT JOIN detalle_venta dv ON p.id_producto = dv.id_producto
WHERE dv.id_producto IS NULL;
