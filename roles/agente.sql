CREATE USER 'agente'@'localhost'
IDENTIFIED BY 'Agente2026!';

GRANT SELECT
ON inmobiliaria.propiedad
TO 'agente'@'localhost';

GRANT SELECT, INSERT
ON inmobiliaria.cliente
TO 'agente'@'localhost';

GRANT SELECT, INSERT
ON inmobiliaria.contrato
TO 'agente'@'localhost';

GRANT SELECT
ON inmobiliaria.*
TO 'agente'@'localhost';
