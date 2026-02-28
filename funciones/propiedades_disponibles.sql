DELIMITER //

CREATE FUNCTION total_propiedades_disponibles_tipo(p_tipo_id INT)
RETURNS INT DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(p.id_propiedad)
    INTO v_total
    FROM propiedad p
    INNER JOIN estado_propiedad ep ON p.estado_id = ep.id_estado
    WHERE p.tipo_id = p_tipo_id
    AND ep.nombre_estado = 'disponible';

    RETURN IFNULL(v_total,0);
END //

DELIMITER ;

SELECT total_propiedades_disponibles_tipo(1);