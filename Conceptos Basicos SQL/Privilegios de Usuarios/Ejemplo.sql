
-- En este ejemplo vamos a crear un usuario por medio de scripts SQL , con ciertos privilegios dentro de la base de datos alter

-- 1) Creamos nuestro usuario

CREATE USER 'Forero07'@'localhost' IDENTIFIED BY 'Barranquilla.';


-- 2) Para asignar todos los roles o privilegios de nuestra base de datos 

GRANT ALL PRIVILEGES ON *.* TO 'Forero07'@'localhost' WITH GRANT OPTION;

-- 3) Para asignar privilegios personalizados ,  en este caso con estos privilegios -- > SELECT,INSERT,UPDATE,DELETE,CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE --> stored procedures

GRANT SELECT,INSERT,UPDATE,DELETE,CREATE TEMPORARY TABLES, LOCK TABLES , EXECUTE ON *.* TO 'Forero07'@'localhost';

-- 4) Para asignar privilegios de lectura personalizados ,  en este caso con estos privilegios -- > SELECT , EXECUTE --> stored procedures

CREATE USER 'Cristian01'@'localhost' IDENTIFIED BY 'Bogota.';


GRANT SELECT , EXECUTE ON *.* TO 'Cristian01'@'localhost';

-- 4)  para crear un usuario generico para poder acceder desde cualquier servidor para eso utilizaremos el siguiente signo -- > %
/*

EJEMPLO
 si por ejemplo mi IP es 192.168.1.% entonces va DESDE --> 192.168.1.0 HASTA  -->  192.168.1.255

sipor ejemplo mi IP es  192.168.1.1__ entonces va DESDE  -->  192.168.1.100 HASTA --> 192.168.1.255

*/
CREATE USER 'admingeneric02'@'%' IDENTIFIED BY '123456w.';

GRANT ALL PRIVILEGES  ON *.* TO 'admingeneric02'@'%' WITH GRANT OPTION;

-- 5) Para crear un usuario con privilegios en ciertas bases de datos o base de datos (a todas las tablas)

CREATE USER 'admin34'@'%' IDENTIFIED BY '123456z.';

GRANT SELECT,INSERT, EXECUTE  ON jugos_ventas.* TO 'admin34'@'%' WITH GRANT OPTION;

-- 6)Para crear un usuario con privilegios en ciertas bases de datos o base de datos (en algunas tablas)

CREATE USER 'admin45'@'%' IDENTIFIED BY '123h.';

GRANT SELECT  ON jugos_ventas.facturas TO 'admin45'@'%' WITH GRANT OPTION;

-- para ver los usuarios de mysql 
SELECT * FROM mysql.USER;

-- Para remover los privilegios de nuestros usuarios 

REVOKE ALL PRIVILEGES , GRANT OPTION FROM 'Cristian01'@'localhost';
