USE empresa ;

CREATE TABLE ejemplo (
ID INT ,
 NOMBRE VARCHAR(50)
);

-- PARA CAMBIAR NUESTRO TIPO DE MECANISMO DE ALMACENAMIENTO DE NUESTRA TABLA PREVIAMENTE CREADA (RECORDEMOS QUE MYSQL POR DEFECTO LO CREA CON TIPO "InnoDB")

-- Utilizamos el comando ALTER TABLE (name table) seguido del comando ENGINE "=" posteriormente ponemos el nombre de nuestro tipo de mecanismo 
-- Recordemos que tambien se puede hacer por medio del asistente virtual de MySQL Workbench

ALTER TABLE ejemplo ENGINE = MyISAM;

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Para cambiar el tipo de mecanismo de almacenamiento cuando creemos nuestra tabla 

CREATE TABLE ejemplo2 (
ID INT,
 NOMBRE VARCHAR(50)
) ENGINE = MEMORY;

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Para ver todos los tipos de mecanismos de alamacenamiento que hay en MySQL con sus respectivos detalles 

SHOW ENGINES ;


