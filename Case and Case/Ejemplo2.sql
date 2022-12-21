CREATE DEFINER=`root`@`localhost` PROCEDURE `producto_case`(vcodigo varchar(50))

-- primero declaramos 2 variables 
-- la primera variable va almacenar el precio de la tabla productos "vprecio"
-- la segunda variable va almacenar el mensaje que nosotros le vamos a indicar  "vmensaje"
-- segundo vamos a hacer la consulta para almacenar nuestro precio de la tabla a nuestra variable "vprecio",recordemos que deben coincidir con el parámetro "vcodigo" cuando se llame al PROCEDURE
-- por ultimo hacemos nuestro CASE según el "vprecio" y le asignamos dependiendo de la condición el "vmensaje"

BEGIN
DECLARE vprecio FLOAT;
DECLARE vmensaje VARCHAR(50);

SELECT PRECIO_DE_LISTA INTO vprecio FROM tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO = vcodigo;

CASE vprecio
  WHEN vprecio BETWEEN 12 AND 50 THEN SET vmensaje = 'Producto costoso';
  WHEN vprecio  BETWEEN 7 AND 12 THEN SET vmensaje = 'Producto asequible';
  WHEN vprecio < 7 THEN SET vmensaje = 'Producto barato';
END case;

END