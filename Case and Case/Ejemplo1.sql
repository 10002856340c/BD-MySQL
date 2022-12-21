CREATE DEFINER=`root`@`localhost` PROCEDURE `sabores`(vcodigo VARCHAR(50))

-- primero declaramos una variable en elcual se va almacenar el sabor de la tabla 
-- segundo hacemos nuestra consulta en el cual se almacena el sabor en la variable dependiendo del codigo del producto (vcodigo)
-- tercero hacemos un CASE en el cual va depender del "vsabor" cuando el encuentre ese sabor en la consulta va apasar el mensaje 
-- cuarto si no encuentra el sabor por defecto va aponer el siguiente mensaje "comunes"
BEGIN
DECLARE vsabor VARCHAR(50);

SELECT SABOR INTO vsabor FROM tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO = vcodigo;
-- case and case
CASE Vsabor 
   WHEN 'Maracuya' THEN SELECT 'MUY RICO';
   WHEN 'limon' THEN SELECT 'MUY RICO';
   WHEN 'frutilla' THEN SELECT 'MUY RICO';
   WHEN 'Uva' THEN SELECT 'MUY RICO';
   WHEN 'Sandia' THEN SELECT 'normal';
   WHEN 'mango' THEN SELECT 'normal';
   ELSE SELECT 'comunes';
END CASE;
END