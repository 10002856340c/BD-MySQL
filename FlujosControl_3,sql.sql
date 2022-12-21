CREATE DEFINER=`root`@`localhost` PROCEDURE `producto`(vcodigo varchar(50))
BEGIN
-- declaramos dos variables 
DECLARE vmensaje varchar(50);
DECLARE vprecio integer;
-- hacemos la siguiente consulta, el cual lo que va hacer es seleccionarme el precio del producto siempre y cuando el codigo del producto coincida con el codigo introducido por el usuario , esta informacion se alamcena en la variable  'vcodigo'
SELECT PRECIO_DE_LISTA INTO vprecio FROM tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO = vcodigo;

-- hacemos el siguiente flujo de control para determinar si un producto es costoso,asequible o barato segun su precio 
IF vprecio BETWEEN 12 AND 20
   THEN 
   SET vmensaje = 'Producto costoso';
ELSEIF vprecio BETWEEN 7 AND 12 
   THEN 
   SET vmensaje = 'Producto asequible';
ELSE
   SET vmensaje = 'Producto barato';
END IF;

SELECT vmensaje;
END