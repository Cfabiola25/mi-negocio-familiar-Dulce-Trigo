-- insertar_datos.sql
-- Datos de prueba (30+ registros)

INSERT INTO categorias (nombre) VALUES
 ('Bebidas'), ('Panadería'), ('Lácteos'), ('Snacks');

INSERT INTO productos (sku, nombre, talla, presentacion, id_categoria, precio) VALUES
 ('P001','Pan blanco','Mediano','Bolsa',2,2500),
 ('P002','Pan integral','Grande','Bolsa',2,3200),
 ('P003','Leche entera','1L','Caja',3,4000),
 ('P004','Leche deslactosada','1L','Caja',3,4500),
 ('P005','Gaseosa Cola','1.5L','Botella',1,5000),
 ('P006','Agua mineral','600ml','Botella',1,2000),
 ('P007','Papas fritas','50g','Bolsa',4,1500),
 ('P008','Torta chocolate','1 porción','Unidad',2,6000);

INSERT INTO proveedores (nit,nombre,email,telefono) VALUES
 ('900111222','Alimex SAS','contacto@alimex.com','3110001111'),
 ('900333444','Distribuidora Norte','ventas@distnorte.com','3120002222');

INSERT INTO clientes (documento,nombres,apellidos,email,telefono) VALUES
 ('1098765432','Carlos','Martínez','carlos@mail.com','3001112222'),
 ('1091234567','Luisa','Gómez','luisa@mail.com','3003334444'),
 ('1087654321','Andrés','Pérez','andres@mail.com','3015556666');

INSERT INTO empleados (documento,nombres,apellidos,email,telefono,cargo) VALUES
 ('100200300','Nelly','Cano','nelly@empresa.com','3021112222','Cajera'),
 ('100200301','Nestor','Granados','nestor@empresa.com','3023334444','Vendedor');

-- Compras
INSERT INTO compras (numero_factura,fecha,id_proveedor,total) VALUES
 ('C001','2025-09-01',1,15000),
 ('C002','2025-09-02',2,22000);

INSERT INTO detalle_compra (id_compra,id_producto,cantidad,costo_unitario) VALUES
 (1,1,50,2000),
 (1,3,30,3500),
 (2,2,40,2800),
 (2,5,20,4500);

-- Inventario inicial
INSERT INTO inventario (id_producto,lote,vencimiento,stock) VALUES
 (1,'L001','2025-12-01',50),
 (2,'L002','2025-12-05',40),
 (3,'L003','2025-11-15',30),
 (5,'L004','2026-01-01',20);

-- Ventas
INSERT INTO ventas (numero_factura,fecha,id_cliente,id_empleado,total,canal) VALUES
 ('V001','2025-09-10',1,1,10000,'SALON'),
 ('V002','2025-09-11',2,2,9500,'DOMICILIO');

INSERT INTO detalle_venta (id_venta,id_producto,cantidad,precio_unitario,subtotal) VALUES
 (1,1,2,2500,5000),
 (1,5,1,5000,5000),
 (2,2,1,3200,3200),
 (2,7,2,1500,3000),
 (2,6,1,2000,2000);

-- Pedidos
INSERT INTO pedidos (fecha_hora,id_cliente,id_empleado,estado,direccion) VALUES
 (NOW(),1,2,'NUEVO','Calle 10 #5-20'),
 (NOW(),3,1,'PREPARANDO','Av 3 #15-40');

INSERT INTO detalle_pedido (id_pedido,id_producto,cantidad,precio_unitario) VALUES
 (1,8,1,6000),
 (2,3,2,4000);
