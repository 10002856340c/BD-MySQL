CREATE DEFINER=`root`@`localhost` PROCEDURE `variables`()
BEGIN

-- Para declarar una variable en mysql tenemos que usar la sintaxis 
-- DECLARE y poner el nombre de la variable , posteriormente poner el tipo de variable int,varchar,float,double,etc ..

DECLARE nombre VARCHAR(10) DEFAULT 'Juan';
DECLARE edad INTEGER DEFAULT 10;
DECLARE fecha_nacimiento DATE DEFAULT '2007-01-10';
DECLARE costo DECIMAL(4,2) DEFAULT 10.23;


SELECT nombre ;
SELECT edad;
SELECT fecha_nacimiento;
SELECT costo;

END