CREATE TABLE log_error (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR(100),
    operacion VARCHAR(100),
    descripcion TEXT
);

