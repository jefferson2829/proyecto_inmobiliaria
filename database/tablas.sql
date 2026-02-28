drop database inmobiliaria;

CREATE DATABASE inmobiliaria;
USE inmobiliaria;

/*evita la repeticion de propiedades*/
CREATE TABLE tipo_propiedad (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY ,
    nombre_tipo VARCHAR(50) NOT NULL
);

/*disponibilidad de la propiedada*/
CREATE TABLE estado_propiedad (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL
);

/*datos de las propiedades (todas)*/
CREATE TABLE propiedad (
    id_propiedad INT AUTO_INCREMENT PRIMARY KEY,
    tipo_id INT NOT NULL,
    estado_id INT NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    valor_venta DECIMAL(12,2),
    valor_arriendo DECIMAL(12,2),
    fecha_registro DATE NOT NULL,
	FOREIGN KEY (tipo_id) REFERENCES tipo_propiedad(id_tipo),
    FOREIGN KEY (estado_id) REFERENCES estado_propiedad(id_estado)
);

/* la persona quee va a comprar la propiedad*/
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    tipo_cliente ENUM('comprador','arrendatario') NOT NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
);

/*definir el tipo de empleado que es*/
CREATE TABLE rol (
    id_rol INT AUTO_INCREMENT,
    nombre_rol VARCHAR(50) NOT NULL,
    CONSTRAINT pk_rol PRIMARY KEY (id_rol)
);

/*personal que trabaja en las propiedades*/
CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    rol_id INT NOT NULL,
    FOREIGN KEY (rol_id) REFERENCES rol(id_rol)
);

/*personal de la propiedad */
CREATE TABLE contrato (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    propiedad_id INT NOT NULL,
    cliente_id INT NOT NULL,
    agente_id INT NOT NULL,
    tipo_contrato ENUM('venta','arriendo') NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    valor_total DECIMAL(12,2) NOT NULL,
    estado_contrato VARCHAR(50) NOT NULL,
    FOREIGN KEY (propiedad_id) REFERENCES propiedad(id_propiedad),
	FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente),
	FOREIGN KEY (agente_id) REFERENCES empleado(id_empleado)
);

/*tabla de union entre varias tablas principales*/
CREATE TABLE pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    contrato_id INT NOT NULL,
    fecha_pago DATE NOT NULL,
    valor_pagado DECIMAL(12,2) NOT NULL,
    metodo_pago VARCHAR(50),
	FOREIGN KEY (contrato_id) REFERENCES contrato(id_contrato)
);

/*registro hay modificaciones en contrato*/
CREATE TABLE auditoria_contrato (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    contrato_id INT NOT NULL,
    fecha_registro DATETIME NOT NULL,
    usuario VARCHAR(100),
    FOREIGN KEY (contrato_id) REFERENCES contrato(id_contrato)
);

/*resumen mensual*/
CREATE TABLE reporte_mensual_pagos (
    id_reporte INT AUTO_INCREMENT PRIMARY KEY,
    fecha_generacion DATE NOT NULL,
    contrato_id INT NOT NULL,
    deuda_pendiente DECIMAL(12,2) NOT NULL,
	FOREIGN KEY (contrato_id) REFERENCES contrato(id_contrato)
);