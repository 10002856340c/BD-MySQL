CREATE DEFINER=`root`@`localhost` PROCEDURE `diferencia_porcentual`(vfecha1 DATE , vfecha2 DATE)

/*En este ejerciico vamos hayar la diferencia porcentual entre el total de ventas de una fecha determinada */
BEGIN
-- primero declaramos 4 variables
-- la primera variable vfactura1 va hacer para almacenar el total de ventas que se hicieron en la primera fecha "vfecha1"
-- la segunda variable vfactura2 va hacer para alamcenar el total de venta que se hicieron en la segunda fecha "vfecha2"
-- la tercera variable va hacer para almacenar nuestro mensaje
-- la cuarta variable va hacer para almacenar nuestro porcentaje de variacion o diferencia porcentual en el cual , utilizaremos la siguiente formula ((vfecha1 / vfecha2)-1)*100

DECLARE vfactura1 FLOAT;
DECLARE vfactura2 FLOAT;
DECLARE vmensaje VARCHAR(50);
DECLARE vvariacion FLOAT;

-- Hallamos la venta total que se obtuvo en determinada fecha "vfecha1"
SELECT SUM(B.CANTIDAD * B.PRECIO) INTO vfactura1  
FROM items_facturas B 
INNER JOIN facturas A
ON A.NUMERO = B.NUMERO
WHERE A.FECHA_VENTA = vfecha1;

-- Hallamos la venta total que se obtuvo en determinada fecha "vfecha2"
SELECT SUM(B.CANTIDAD * B.PRECIO) INTO vfactura2
FROM items_facturas B 
INNER JOIN facturas A
ON A.NUMERO = B.NUMERO
WHERE A.FECHA_VENTA = vfecha2;

-- Aplicamos a la variable de vvariacion la formula para hallar la diferencia que se alamacenan de las ventas totales en las variables vfactura1 y vfactura2
SET vvariacion = ((vfactura1 / vfactura2)-1)*100;

-- aplicamos los flujos de control poniendo condiciones 
IF vvariacion > 10
	 THEN 
	 SET vmensaje = 'Verde';
ELSEIF vvariacion BETWEEN -10 AND 10
	THEN
	SET vmensaje = 'Amarillo';
ELSE
    SET vmensaje = 'Rojo';
END IF;
-- finalmente seleccionamos el mensaje segun se cumpla la condicion de acuerso al porcentaje de variacion
SELECT vmensaje;
END