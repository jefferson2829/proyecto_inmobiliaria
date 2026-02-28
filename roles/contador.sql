CREATE USER 'contador'@'localhost'
IDENTIFIED BY 'Conta2026!';

GRANT SELECT
ON inmobiliaria.contrato
TO 'contador'@'localhost';

GRANT SELECT, INSERT
ON inmobiliaria.pago
TO 'contador'@'localhost';

GRANT SELECT
ON inmobiliaria.reporte_mensual_pagos
TO 'contador'@'localhost';

GRANT SELECT
ON inmobiliaria.*
TO 'contador'@'localhost';

FLUSH PRIVILEGES;