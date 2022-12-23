CREATE DEFINER=`root`@`localhost` PROCEDURE `campo_adicional`()
BEGIN
-- declaramos las variables
DECLARE vtotal FLOAT;
DECLARE vcondicion INT DEFAULT 0;
-- declaramos el cursor 
DECLARE cursor5 CURSOR FOR SELECT  ROUND(SUM(A.CANTIDAD*A.PRECIO),2) FROM items_facturas A
INNER JOIN facturas B  ON B.NUMERO = A.NUMERO
WHERE MONTH(B.FECHA_VENTA) = 1 AND YEAR(B.FECHA_VENTA) = 2015;
-- declaramos el controlador de errores (excepsion)
DECLARE CONTINUE HANDLER FOR NOT FOUND
SET vcondicion  = 1;
-- abrimos nuestro cursor(Array)
 OPEN cursor5;
 -- abrimos nuestro bucle while
 WHILE vcondicion=0
 DO
  FETCH cursor5 INTO vtotal;
  -- declaramos nuestra condicion y lo que queremos que haga
   IF vcondicion =0 THEN SELECT vtotal AS FACTURACION_TOTAL;
   END IF;
   -- cerramos nuestro if
END WHILE;
-- cerramos nuestro bucle
CLOSE cursor5;
-- cerramos nuestro cursor
END