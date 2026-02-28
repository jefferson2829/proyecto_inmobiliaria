CREATE TABLE auditoria_propiedad (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    propiedad_id INT NOT NULL,
    estado_anterior INT NOT NULL,
    estado_nuevo INT NOT NULL,
    fecha_cambio DATETIME NOT NULL,
    FOREIGN KEY (propiedad_id) REFERENCES propiedad(id_propiedad)
);

DELIMITER //


CREATE TRIGGER trg_cambio_estado_propiedad
AFTER UPDATE ON propiedad
FOR EACH ROW
BEGIN
    IF OLD.estado_id <> NEW.estado_id THEN
        
        INSERT INTO auditoria_propiedad(
            propiedad_id,
            estado_anterior,
            estado_nuevo
        )
        VALUES(
            OLD.id_propiedad,
            OLD.estado_id,
            NEW.estado_id
        );

    END IF;
END //


DELIMITER ;