/*evita borrar contratos si tiene un historial financieron*/

DELIMITER //

CREATE TRIGGER evitar_eliminar_contrato_con_pagos
BEFORE DELETE ON contrato
FOR EACH ROW
BEGIN
    DECLARE v_total INT;

    SELECT COUNT(*)
    INTO v_total
    FROM pago
    WHERE contrato_id = OLD.id_contrato;

    IF v_total > 0 THEN

        INSERT INTO log_error(usuario, operacion, descripcion)
        VALUES (USER(), 'DELETE CONTRATO', 'Intento de eliminar contrato con pagos registrados');

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar contrato con pagos';

    END IF;
END //

DELIMITER ;