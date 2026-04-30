# 🏢 Sistema de Gestión Inmobiliaria

![alt text](<Captura de pantalla 2026-02-28 170659.png>)

---

## 📌 Descripción General

Este proyecto consiste en el diseño de una base de datos en **MySQL** para una inmobiliaria, orientada a la gestión eficiente de propiedades, clientes, contratos y pagos.

El sistema busca ofrecer una solución robusta, segura y optimizada, incorporando control de acceso por roles, auditoría de cambios y generación automática de reportes.

---

## 🧠 Modelo Entidad-Relación (MER)

El modelo está normalizado hasta **Tercera Forma Normal (3FN)**.

### 🔑 Entidades principales

* Cliente
* Propiedad
* Tipo_Propiedad
* Estado_Propiedad
* Contrato
* Pago
* Empleado
* Rol
* Auditoría_Propiedad
* Auditoría_Contrato
* Reporte_Mensual_Pagos
* Log_Error

---

## 📊 Normalización

### ✔ 1FN

* Atributos atómicos
* Sin campos multivaluados
* Claves primarias definidas

### ✔ 2FN

* Sin dependencias parciales
* Dependencia total de la clave primaria

### ✔ 3FN

* Sin dependencias transitivas
* Eliminación de redundancia
* Integridad referencial optimizada

---

## 🗂️ Descripción de Entidades

### 👤 Cliente

Información de compradores o arrendatarios:

* Identificación
* Datos de contacto
* Tipo de cliente

### 🏠 Propiedad

Registro del portafolio inmobiliario:

* Tipo y estado
* Ubicación
* Valor de venta o arriendo
* Fecha de registro

### 📄 Contrato

Acuerdos de venta o arriendo:

* Cliente y propiedad
* Agente inmobiliario
* Fechas y valor total
* Estado del contrato

### 💰 Pago

Registro de pagos en contratos:

* Contrato asociado
* Fecha
* Valor
* Método de pago

### 👨‍💼 Empleado y Rol

Gestión de accesos:

* Administrador
* Agente
* Contador

### 📜 Auditoría

* Cambios en propiedades
* Registro de contratos

### 📈 Reportes

* Estado mensual de pagos

---

## ⚙️ Funciones Personalizadas

* 💸 Cálculo de comisión de agentes
* 📉 Cálculo de deuda pendiente
* 🏘️ Total de propiedades disponibles

---

## 🔁 Triggers y Auditoría

Se implementan triggers para:

* Registrar cambios en propiedades
* Auditar nuevos contratos

Garantizan trazabilidad y control histórico.

---

## 🔐 Seguridad y Roles

### 🛡️ Administrador

* Acceso total
* Gestión completa del sistema

### 🧑‍💼 Agente

* Gestión de contratos
* Consulta de propiedades

### 📊 Contador

* Consulta de pagos y reportes
* Sin permisos de modificación

---

## 🚀 Optimización

* Índices en campos clave
* Consultas optimizadas
* Separación de datos históricos

---

## ⏱️ Eventos Programados

Evento automático mensual que:

* Calcula deudas pendientes
* Genera reportes automáticos

---

## ✅ Conclusión

El sistema cumple con:

* ✔ Modelo normalizado hasta 3FN
* ✔ Funciones personalizadas
* ✔ Triggers de auditoría
* ✔ Seguridad por roles
* ✔ Optimización con índices
* ✔ Automatización con eventos

Se trata de una base de datos sólida, segura y escalable, lista para evolucionar hacia un sistema real.

---

## 👨‍💻 Autor

**Jefferson Andrés Amarillo Ríos**
