# 📊 Base de Datos — Dulce Trigo
## 🏪 Descripción del Negocio
**Nero Bakery & Market** es un negocio familiar ubicado en Cúcuta que combina la tradición de la panadería con la practicidad de una tienda de abarrotes.  
Su portafolio incluye productos de panadería (pan, tortas, pastelería), bebidas, lácteos y snacks. Además, ofrece servicio de ventas en salón y pedidos a domicilio, buscando atender tanto a clientes locales como a familias que buscan calidad, cercanía y confianza.

El negocio se caracteriza por:
- Producción diaria de pan fresco y tortas.
- Venta de bebidas, lácteos y productos básicos de consumo.
- Atención personalizada por parte de empleados de confianza.
- Servicio de pedidos y entregas a domicilio.

Este proyecto académico modela la **base de datos completa** que permite gestionar clientes, empleados, productos, proveedores, compras, ventas, inventario y pedidos.

---

## 🎯 Objetivos del Proyecto
- Diseñar e implementar un modelo relacional completo para un negocio familiar.
- Garantizar integridad de datos mediante **PK, FK y restricciones**.
- Implementar consultas SQL avanzadas con **JOINs, agregaciones y subconsultas**.
- Demostrar un sistema robusto que pueda ser usado en entornos reales.

---

## 👥 Autores
- **Nelly Fabiola Cano Oviedo** — Ingeniería de Software, FESC  
- **Néstor Iván Granados Valenzuela** — Ingeniería de Software, FESC  

---

## ⚙️ Cómo Ejecutar en PostgreSQL
1. Crear la base de datos:
   ```bash
   createdb negocio_familiar
Ejecutar scripts en orden:

psql -U postgres -d negocio_familiar -f crear_tablas.sql
psql -U postgres -d negocio_familiar -f insertar_datos.sql
psql -U postgres -d negocio_familiar -f consultas_complejas.sql

📸 Evidencias
diagrama_relacional.mmd → convertir a PNG para presentación en clase.
consultas_complejas.sql → evidencias de ejecución de consultas JOIN y agregaciones.
