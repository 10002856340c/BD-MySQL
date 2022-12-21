CREATE DEFINER=`root`@`localhost` PROCEDURE `sabores2`(vcodigo varchar(50))
-- primero declaramos 2 variables
-- la primera variable va a contener el sabor de la tabla de productos
-- la segunda variable va a contener el mensaje de error que nosotros mismos le vamos almacenar 
-- Segundo creamos una excepción o un error en el cual va a mandar un mensaje más amigable para el usuario con el siguiente comando -- > DECLARE CONTINUE HANDLER FOR 1339 SET vmensajeerror = 'Caso no encontrado';
-- recordemos que para indicarle a mysql cual es el error tenemos que indicarle el código de error 
-- por último hacemos nuestro case en el cual va buscar los sabores que están presentes
-- si el case no encuentra ningún sabor se va activar el error 1339 y se va activar la excepción o error que creamos y va a mandar el mensaje que nosotros le almacenamos en la variable "vmensaje"

BEGIN
DECLARE vsabor VARCHAR(50);
DEClARE vmensajeerror Varchar(50);
DECLARE CONTINUE HANDLER FOR 1339
SET vmensajeerror = 'Caso no encontrado';

SELECT SABOR INTO vsabor FROM tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO = vcodigo;

CASE vsabor 
   WHEN 'Maracuya' THEN SELECT 'MUY RICO';
   WHEN 'limon' THEN SELECT 'MUY RICO';
   WHEN 'frutilla' THEN SELECT 'MUY RICO';
   WHEN 'Uva' THEN SELECT 'MUY RICO';
   WHEN 'Sandia' THEN SELECT 'normal';
   WHEN 'mango' THEN SELECT 'normal';
END CASE;

SELECT vmensajeerror;

END