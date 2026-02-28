DELIMITER //

CREATE TRIGGER trg_nuevo_contrato
AFTER INSERT ON contrato
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_contrato(
        contrato_id,
        fecha_registro,
        usuario
    )
    VALUES(
        NEW.id_contrato,
        NOW(),
        CURRENT_USER()
    );
END //

DELIMITER ;