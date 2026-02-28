/*no nos deja colocar el estado de una propiedad en vendido si no hay un contrato de por medio*/

DELIMITER //

CREATE TRIGGER validar_estado_vendido
BEFORE UPDATE ON propiedad
FOR EACH ROW
BEGIN
    DECLARE v_total INT;

    IF NEW.estado_id <> OLD.estado_id THEN

        SELECT COUNT(*)
        INTO v_total
        FROM contrato
        WHERE propiedad_id = OLD.id_propiedad
        AND tipo_contrato = 'venta';

        IF NEW.estado_id = (
            SELECT id_estado 
            FROM estado_propiedad 
            WHERE nombre_estado = 'vendido'
        )
        AND v_total = 0 THEN

            INSERT INTO log_error(usuario, operacion, descripcion)
            VALUES (USER(), 'UPDATE PROPIEDAD', 'Cambio a vendido sin contrato de venta');

            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No existe contrato de venta para esta propiedad';

        END IF;

    END IF;
END //

DELIMITER ;