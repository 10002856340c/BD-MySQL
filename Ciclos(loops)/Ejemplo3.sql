CREATE DEFINER=`root`@`localhost` PROCEDURE `limite_creditos`()
BEGIN
DECLARE limitecredito int;
DECLARE limitetotal int default 0;

-- declaramos el cursor 
DECLARE cursor3 CURSOR FOR SELECT sum(LIMITE_DE_CREDITO) AS TOTAL FROM tabla_de_clientes ;
-- declaramos el controlador de errores (excepsion)
DECLARE CONTINUE HANDLER FOR NOT FOUND
SET limitetotal  = 1;

-- abrimos nuestro cursor(Array)
 OPEN cursor3;
 
 -- creamos nuestro bucle while
WHILE limitetotal = 0
 DO
 -- se introduce el dato
  FETCH cursor3 INTO limitecredito;
  -- ponemos la condicion siempre y cuando la variable "limite_total" = 0  es decir mientras no se presente un error 
   IF limitetotal  = 0 THEN SELECT limitecredito;
   -- finalizamos el condicional if
   END IF;
-- finalizamos el ciclo while
END WHILE;
-- cerramos el cursor (Array)
CLOSE cursor3;
  
END