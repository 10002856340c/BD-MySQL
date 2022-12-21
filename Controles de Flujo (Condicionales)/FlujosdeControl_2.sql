CREATE DEFINER=`root`@`localhost` PROCEDURE `mueastra_numero`(vfecha date)
BEGIN

-- primero creamos un parametro de tipo date para que cuando de llame el Procedure se inserte la fecha
-- segundo creamos dos variables en en cual en la variable vmensaje va almacenar un mensaje que queremos mostrar siempre y cuando se cumpla alguna de las dos condiciones
-- tercero la variable vfacturas es donde se va almacenar el valor de conteo de las facturas de una determinada fecha
-- cuarto hacemos el respectivo flujo en donde la variable vfacturas debe ser mayor a 85 , respectivamente le agregamos las condiciones con sus respectivos mensajes

DECLARE vmensaje VARCHAR(100);
DECLARE vfacturas INTEGER;

SELECT COUNT(*) vfecha INTO vfacturas FROM facturas
WHERE FECHA_VENTA = vfecha;
IF vfacturas > 85
	THEN 
	SET vmensaje = "muchas facturas";
	ELSE
	SET vmensaje = "pocas facturas";
END IF;

SELECT vmensaje ;
END