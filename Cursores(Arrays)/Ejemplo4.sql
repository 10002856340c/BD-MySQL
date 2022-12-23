CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_looping2`()
BEGIN
-- declaramos las variables
DECLARE vcondicion INT DEFAULT 0;
DECLARE vnombre,vdireccion VARCHAR(150);
DECLARE vbarrio,vciudad,vcp,vestado VARCHAR(50);

-- declaramos el cursor 
DECLARE cursor4 CURSOR FOR SELECT NOMBRE,DIRECCION_1,BARRIO,CIUDAD,ESTADO,CP FROM tabla_de_clientes ;
-- declaramos el controlador de errores (excepsion)
DECLARE CONTINUE HANDLER FOR NOT FOUND
SET vcondicion  = 1;

-- abrimos nuestro cursor(Array)
 OPEN cursor4;
 
 WHILE vcondicion = 0
 DO
  FETCH cursor4 INTO vnombre,vdireccion,vbarrio,vciudad,vestado,vcp;
	  -- ponemos la condicion siempre y cuando la variable "VCONDICION" = 0  es decir mientras no se presente un error 
	   IF vcondicion  = 0 THEN SELECT CONCAT("NOMBRE : ",vnombre," --  DIRECCION : ",vdireccion," --  BARRIO : ",vbarrio,"  -- CIUDAD : ",vciudad," --  ESTADO : ",vestado," --  CP :",vcp ) AS datos_clientes;
	  END IF;
      -- finalizamos el condicional if
  END WHILE;
  -- finalizamos el ciclo while
CLOSE cursor4;
-- cerramos el cursor (Array)
END