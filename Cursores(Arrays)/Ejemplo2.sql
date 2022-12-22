CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_looping`()
BEGIN
-- declaramos las variables
DECLARE vnombre VARCHAR (50);
DECLARE velemento INT DEFAULT 0 ;

-- declaramos el cursor 
DECLARE cursor2 CURSOR FOR SELECT NOMBRE FROM tabla_de_clientes;
-- declaramos el controlador de errores (excepsion)
DECLARE CONTINUE HANDLER FOR NOT FOUND
SET velemento = 1;
-- abrimos nuestro cursor(Array)
 OPEN cursor2;
-- creamos nuestro bucle while
WHILE velemento = 0
 DO
 -- se introduce el dato
  FETCH cursor2 INTO vnombre;
  -- ponemos la condicion siempre y cuando la variable "velemento" = 0  es decir mientras no se presente un error 
   IF velemento = 0 THEN SELECT vnombre;
   -- finalizamos el condicional if
   END IF;
-- finalizamos el ciclo while
END WHILE;
-- cerramos el cursor (Array)
CLOSE cursor2;
  
END