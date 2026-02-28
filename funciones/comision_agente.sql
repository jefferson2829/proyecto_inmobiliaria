/*operacion para Calcular comisión de un agente en una venta*/
drop procedure calcular_comision;
DELIMITER //

CREATE FUNCTION calcular_comision(p_id_contrato INT, p_porcentaje DECIMAL(5,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE v_comision DECIMAL(12,2);
    SELECT (c.valor_total * (p_porcentaje / 100))
    INTO v_comision
    FROM contrato c
    WHERE c.id_contrato = p_id_contrato
    AND c.tipo_contrato = 'venta';

    RETURN v_comision;
END //

DELIMITER ;

SELECT calcular_comision(1, 3);