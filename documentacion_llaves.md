# Documentación de Llaves

## Tabla: productos
- PK: id_producto (SERIAL)
- CK: sku (UNIQUE), (nombre,talla,presentacion) (UNIQUE)
- FK: id_categoria → categorias.id_categoria

## Tabla: ventas
- PK: id_venta (SERIAL)
- CK: numero_factura (UNIQUE)
- FKs: id_cliente → clientes.id_cliente, id_empleado → empleados.id_empleado

## Tabla: detalle_venta
- PK: id_detalle (SERIAL)
- CK: (id_venta,id_producto) (UNIQUE)
- FKs: id_venta → ventas.id_venta, id_producto → productos.id_producto

## Tabla: pedidos
- PK: id_pedido (SERIAL)
- CK: (fecha_hora,id_cliente) (UNIQUE parcial sugerido)
- FKs: id_cliente → clientes.id_cliente, id_empleado → empleados.id_empleado

## Tabla: detalle_pedido
- PK: id_detalle_pedido (SERIAL)
- CK: (id_pedido,id_producto) (UNIQUE)
- FKs: id_pedido → pedidos.id_pedido, id_producto → productos.id_producto
