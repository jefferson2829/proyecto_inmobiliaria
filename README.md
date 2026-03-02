# 🏢 Sistema de Gestión Inmobiliaria -- Documentación del Proyecto


![alt text](<Captura de pantalla 2026-02-28 170659.png>)

## 1. Descripción General

La inmobiliaria requiere un sistema en MySQL que permita administrar:

-   Propiedades (casas, apartamentos, locales comerciales)
-   Clientes interesados en compra o arriendo
-   Contratos firmados
-   Pagos realizados
-   Historial de cambios
-   Reportes automáticos
-   Control de acceso por roles

El objetivo es construir una base de datos robusta, segura y optimizada
que funcione como prototipo real de gestión inmobiliaria.

------------------------------------------------------------------------

## 2. Modelo Entidad-Relación (MER)

El modelo está normalizado hasta Tercera Forma Normal (3FN).

### Entidades Principales

-   Cliente\
-   Propiedad\
-   Tipo_Propiedad\
-   Estado_Propiedad\
-   Contrato\
-   Pago\
-   Empleado\
-   Rol\
-   Auditoría_Propiedad\
-   Auditoría_Contrato\
-   Reporte_Mensual_Pagos\
-   Log_Error

------------------------------------------------------------------------

## 3. Normalización hasta 3FN

### Primera Forma Normal (1FN)

-   Todos los atributos son atómicos.
-   No existen campos multivaluados.
-   Cada tabla posee clave primaria.

### Segunda Forma Normal (2FN)

-   No existen dependencias parciales.
-   Cada atributo depende completamente de su clave primaria.

### Tercera Forma Normal (3FN)

-   No existen dependencias transitivas.
-   Se separaron datos repetitivos en tablas independientes (tipo y
    estado).
-   Se evita redundancia y se mejora la integridad referencial.

------------------------------------------------------------------------

## 4. Descripción de Entidades

### Cliente

Almacena información de compradores o arrendatarios: - Identificación -
Datos de contacto - Tipo de cliente

### Propiedad

Registra las propiedades del portafolio: - Tipo - Estado - Dirección y
ciudad - Valor de venta - Valor de arriendo - Fecha de registro

### Contrato

Representa acuerdos de venta o arriendo: - Propiedad asociada -
Cliente - Agente inmobiliario - Tipo de contrato - Fechas - Valor
total - Estado del contrato

### Pago

Registra pagos realizados en contratos de arriendo: - Contrato
asociado - Fecha de pago - Valor pagado - Método de pago

### Empleado y Rol

Permiten gestionar accesos: - Administrador - Agente inmobiliario -
Contador

### Auditorías

Registran automáticamente: - Cambios de estado en propiedades - Nuevos
contratos

### Reporte Mensual

Almacena el estado de pagos pendientes de forma automática.

------------------------------------------------------------------------

## 5. Funciones Personalizadas

### Cálculo de Comisión

Determina el porcentaje de comisión que recibe un agente por una venta.

### Cálculo de Deuda Pendiente

Calcula el saldo restante en contratos de arriendo restando los pagos
realizados.

### Total de Propiedades Disponibles

Permite conocer la cantidad de propiedades disponibles por tipo.

------------------------------------------------------------------------

## 6. Triggers y Auditoría

El sistema utiliza triggers para:

-   Registrar cambios de estado en propiedades.
-   Guardar automáticamente nuevos contratos en auditoría.

Esto garantiza trazabilidad y control histórico.

------------------------------------------------------------------------

## 7. Seguridad y Control de Acceso

### Administrador

-   Acceso total al sistema.
-   Puede modificar estructura y datos.

### Agente

-   Gestiona contratos.
-   Consulta propiedades.

### Contador

-   Consulta pagos y reportes financieros.
-   No puede modificar contratos ni propiedades.

------------------------------------------------------------------------

## 8. Optimización

-   Uso de índices en campos de búsqueda frecuente.
-   Optimización de consultas relacionadas con contratos y pagos.
-   Separación de datos históricos para mejorar rendimiento.

------------------------------------------------------------------------

## 9. Eventos Programados

Se implementa un evento automático mensual que:

-   Calcula la deuda pendiente de contratos de arriendo.
-   Inserta la información en la tabla de reportes.

Esto permite generar informes sin intervención manual.

------------------------------------------------------------------------

## 10. Conclusión

El sistema cumple con los requisitos establecidos:

-   Modelo normalizado hasta 3FN\
-   Funciones personalizadas\
-   Triggers de auditoría\
-   Seguridad por roles\
-   Optimización mediante índices\
-   Eventos programados automáticos

Se trata de una base de datos robusta, segura y escalable, lista para
evolucionar hacia un sistema real de gestión inmobiliaria.
