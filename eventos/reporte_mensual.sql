use inmobiliaria;

CREATE EVENT reporte_mensual_pagos
ON SCHEDULE EVERY 1 MONTH
STARTS '2026-03-01 00:00:00'
DO
INSERT INTO reporte_mensual_pagos (
    fecha_generacion,
    contrato_id,
    deuda_pendiente
)
SELECT
    CURDATE(),
    c.id_contrato,
    (c.valor_total - IFNULL(SUM(p.valor_pagado),0)) AS deuda_pendiente
FROM contrato c
LEFT JOIN pago p ON p.contrato_id = c.id_contrato
WHERE c.tipo_contrato = 'arriendo'
GROUP BY c.id_contrato, c.valor_total;

SHOW EVENTS FROM inmobiliaria;