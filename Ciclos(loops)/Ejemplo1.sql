CREATE DEFINER=`root`@`localhost` PROCEDURE `suma_dias_facturas`()
BEGIN
-- Primero declaramos 3 variables 
-- la primera variable va almacenar la fecha inicial
-- la segunda va almacenar la fecha final
-- la tercera variable va almacenar la variable donde se va almacenar el número de facturas que hay en cada dia o fecha determina


DECLARE fecha_inicial DATE ;
DECLARE fecha_final DATE ;
DECLARE n_facturas INT;

-- indicamos o inicializamos las variables con los siguientes valores 
-- la fecha inicial va a tener una fecha 01-01-2015
-- la fecha final va a tener una fecha 10-01-2015
-- hay un intervalos de 9 días es decir va haber 9 cuadros o 9 consultas

SET fecha_inicial = '20150101';
SET fecha_final = '20150110';

-- inicializamos nuestro ciclo while en el cual la condición va hacer que la fecha inicial sea menor que la fecha final, cuando deje de pasar esto automáticamente el bucle se rompe
WHILE fecha_inicial < fecha_final
	DO
    -- contamos el número de facturas
	SELECT COUNT(*) INTO n_facturas FROM facturas
	WHERE FECHA_VENTA = fecha_inicial;
    
    -- hacemos una concatenación para añadir el número de facturas y la fecha le hacemos un date format para cambiar su orden dia mes año , y posteriormente cambiamos el tipo de variable "n_facturas a un char "string" para que se concatene correctamente con la fecha
	SELECT concat('El dia ', DATE_FORMAT(fecha_inicial, '%d/%m/%Y'), ' el numero de facturas fue - > ' , CAST(n_facturas AS CHAR(50))) AS RESULTADO;
    
    -- para que el bucle no sea infinito tenemos que ir aumentando el dia de nuestra fecha para que cuando ya sea mayor a la fecha final se rompa el bucle 
    SELECT ADDDATE(fecha_inicial,INTERVAL 1 DAY)INTO fecha_inicial;
-- finalizamos el ciclo while
END WHILE;
END