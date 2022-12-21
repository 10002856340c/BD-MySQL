CREATE DEFINER=`root`@`localhost` PROCEDURE `looping`(vinicial int , vfinal int)
BEGIN
-- declaramos una variable de tipo int
DECLARE vcontador INT;
-- cada vez que se ejecuta el proceso estructurado queremos que se elimine la información  anterior

DELETE FROM ciclos;

-- la variable vcontador va hacer igual al vinicial , para que cuando hagamos la condición en el ciclo while podamos indicarle
SET vcontador = vinicial;

-- en el bucle le indicamos la condicion de que vcontador es menor o igual al vfinal 
WHILE vcontador <= vfinal
	 DO
     -- si se cumple la condición vamos a insertar los números en la tabla indicada
	 INSERT INTO ciclos (ID) VALUES (vcontador);
     -- para que el bucle no sea infinito tenemos que ir incrementado la variable contador cada vez que se vaya repitiendo el bucle para que llegue a un momento determinado y ya no se cumpla la condición y se rompa el bucle
	 SET vcontador = vcontador + 1;
END WHILE;
-- para ver los datos suministrador podemos seleccionar la tabla
SELECT * FROM ciclos;
END