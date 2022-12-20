CREATE DEFINER=`root`@`localhost` PROCEDURE `edad_clientes`(vdni varchar(20))
BEGIN
DECLARE vmensaje VARCHAR(100);
DECLARE vfecha DATE;

SELECT FECHA_DE_NACIMIENTO INTO vfecha  FROM tabla_de_clientes 
WHERE DNI = vdni;
IF vfecha > '19900101'
	THEN 
	SET vmensaje = "joven";
	ELSE
	SET vmensaje = " viejo";
END IF;

SELECT vmensaje ;
END