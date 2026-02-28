DELIMITER //

CREATE FUNCTION calcular_deuda_arriendo(p_id_contrato INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE v_deuda DECIMAL(12,2);
    SELECT (c.valor_total - IFNULL(SUM(p.valor_pagado),0))
    INTO v_deuda
    FROM contrato c
    LEFT JOIN pago p ON p.contrato_id = c.id_contrato
    WHERE c.id_contrato = p_id_contrato
    AND c.tipo_contrato = 'arriendo'
    GROUP BY c.valor_total;

    RETURN IFNULL(v_deuda,0);
END //

DELIMITER ;

SELECT calcular_deuda_arriendo(1);