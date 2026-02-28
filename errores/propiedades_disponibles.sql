DELIMITER //

CREATE TRIGGER validar_propiedad_disponible
BEFORE INSERT ON contrato
FOR EACH ROW
BEGIN
    DECLARE v_estado VARCHAR(50);

    SELECT ep.nombre_estado
    INTO v_estado
    FROM propiedad p
    INNER JOIN estado_propiedad ep 
        ON p.estado_id = ep.id_estado
    WHERE p.id_propiedad = NEW.propiedad_id;

    IF v_estado <> 'disponible' THEN

        INSERT INTO log_error(usuario, operacion, descripcion)
        VALUES (USER(), 'INSERT CONTRATO', 
        'Intento de contrato sobre propiedad no disponible');

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La propiedad no está disponible';

    END IF;
END //

DELIMITER ;