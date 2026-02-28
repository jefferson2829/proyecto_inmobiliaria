CREATE USER 'administrador_principal'@'localhost'
IDENTIFIED BY 'admin_principal';

GRANT ALL PRIVILEGES
ON inmobiliaria.*
TO 'administrador_principal'@'localhost';

FLUSH PRIVILEGES;

-------------------------------------------------

CREATE USER 'auxiliar_admin'@'localhost'
IDENTIFIED BY 'AuxAdmin2026!';

GRANT SELECT, INSERT, UPDATE
ON inmobiliaria.propiedad
TO 'auxiliar_admin'@'localhost';

GRANT SELECT, INSERT
ON inmobiliaria.cliente
TO 'auxiliar_admin'@'localhost';

GRANT SELECT
ON inmobiliaria.*
TO 'auxiliar_admin'@'localhost';

FLUSH PRIVILEGES;