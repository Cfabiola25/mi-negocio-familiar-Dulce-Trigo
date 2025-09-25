-- crear_tablas.sql
-- Esquema PostgreSQL negocio familiar (simplificado, sin domains)

CREATE TABLE categorias (
  id_categoria SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL UNIQUE
);

CREATE TABLE productos (
  id_producto SERIAL PRIMARY KEY,
  sku TEXT NOT NULL UNIQUE,
  nombre TEXT NOT NULL,
  talla TEXT,
  presentacion TEXT,
  id_categoria INT NOT NULL REFERENCES categorias(id_categoria),
  precio NUMERIC(12,2) NOT NULL CHECK (precio >= 0),
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT uq_prod_nombre UNIQUE (nombre, talla, presentacion)
);

CREATE TABLE proveedores (
  id_proveedor SERIAL PRIMARY KEY,
  nit TEXT NOT NULL UNIQUE,
  nombre TEXT NOT NULL,
  email TEXT UNIQUE,
  telefono TEXT
);

CREATE TABLE clientes (
  id_cliente SERIAL PRIMARY KEY,
  documento TEXT NOT NULL UNIQUE,
  nombres TEXT NOT NULL,
  apellidos TEXT NOT NULL,
  email TEXT UNIQUE,
  telefono TEXT
);

CREATE TABLE empleados (
  id_empleado SERIAL PRIMARY KEY,
  documento TEXT NOT NULL UNIQUE,
  nombres TEXT NOT NULL,
  apellidos TEXT NOT NULL,
  email TEXT UNIQUE,
  telefono TEXT,
  cargo TEXT NOT NULL
);

CREATE TABLE compras (
  id_compra SERIAL PRIMARY KEY,
  numero_factura TEXT NOT NULL UNIQUE,
  fecha DATE NOT NULL DEFAULT CURRENT_DATE,
  id_proveedor INT NOT NULL REFERENCES proveedores(id_proveedor),
  total NUMERIC(12,2) NOT NULL
);

CREATE TABLE detalle_compra (
  id_detalle_compra SERIAL PRIMARY KEY,
  id_compra INT NOT NULL REFERENCES compras(id_compra) ON DELETE CASCADE,
  id_producto INT NOT NULL REFERENCES productos(id_producto),
  cantidad NUMERIC(12,2) NOT NULL CHECK (cantidad > 0),
  costo_unitario NUMERIC(12,2) NOT NULL CHECK (costo_unitario > 0),
  CONSTRAINT uq_det_compra UNIQUE (id_compra, id_producto)
);

CREATE TABLE inventario (
  id_inventario SERIAL PRIMARY KEY,
  id_producto INT NOT NULL REFERENCES productos(id_producto),
  lote TEXT NOT NULL,
  vencimiento DATE,
  stock NUMERIC(12,2) NOT NULL DEFAULT 0,
  CONSTRAINT uq_inv UNIQUE (id_producto, lote)
);

CREATE TABLE ventas (
  id_venta SERIAL PRIMARY KEY,
  numero_factura TEXT NOT NULL UNIQUE,
  fecha DATE NOT NULL DEFAULT CURRENT_DATE,
  id_cliente INT NOT NULL REFERENCES clientes(id_cliente),
  id_empleado INT NOT NULL REFERENCES empleados(id_empleado),
  total NUMERIC(12,2) NOT NULL DEFAULT 0,
  canal TEXT NOT NULL CHECK (canal IN ('SALON','DOMICILIO'))
);

CREATE TABLE detalle_venta (
  id_detalle SERIAL PRIMARY KEY,
  id_venta INT NOT NULL REFERENCES ventas(id_venta) ON DELETE CASCADE,
  id_producto INT NOT NULL REFERENCES productos(id_producto),
  cantidad NUMERIC(12,2) NOT NULL CHECK (cantidad > 0),
  precio_unitario NUMERIC(12,2) NOT NULL CHECK (precio_unitario > 0),
  subtotal NUMERIC(12,2) NOT NULL DEFAULT 0,
  CONSTRAINT uq_det_venta UNIQUE (id_venta, id_producto)
);

CREATE TABLE pedidos (
  id_pedido SERIAL PRIMARY KEY,
  fecha_hora TIMESTAMP NOT NULL DEFAULT NOW(),
  id_cliente INT NOT NULL REFERENCES clientes(id_cliente),
  id_empleado INT NOT NULL REFERENCES empleados(id_empleado),
  estado TEXT NOT NULL CHECK (estado IN ('NUEVO','PREPARANDO','EN_CAMINO','ENTREGADO','CANCELADO')),
  direccion TEXT
);

CREATE TABLE detalle_pedido (
  id_detalle_pedido SERIAL PRIMARY KEY,
  id_pedido INT NOT NULL REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
  id_producto INT NOT NULL REFERENCES productos(id_producto),
  cantidad NUMERIC(12,2) NOT NULL CHECK (cantidad > 0),
  precio_unitario NUMERIC(12,2) NOT NULL CHECK (precio_unitario > 0),
  CONSTRAINT uq_det_pedido UNIQUE (id_pedido, id_producto)
);
