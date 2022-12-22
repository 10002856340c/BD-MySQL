CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_1`()
BEGIN
-- declaramos la variable
DECLARE vnombre VARCHAR(50);
-- declaramos nuestro cursor(array) en el cual va a tener un limite de 4 elemnetos {0,1,2,3}
DECLARE cursor1 CURSOR FOR SELECT NOMBRE FROM tabla_de_clientes LIMIT 4;
-- abrimos nuestro cursor;
OPEN cursor1;
-- empezamos a introducir nuestros datos a nuestra variable "vnombre"
FETCH cursor1 INTO vnombre;
-- lo seleccionamos para ver la tabla con nuestro dato
SELECT vnombre;

-- como son 4 elementos lo hacemos 4 veces(ojo no es una buena practica) pero es para entender su funcionamiento, en el segundo ejemplo muestro otra manera por medio de un bucle while 
FETCH cursor1 INTO vnombre;
SELECT vnombre;
FETCH cursor1 INTO vnombre;
SELECT vnombre;
FETCH cursor1 INTO vnombre;
SELECT vnombre;
-- cerramos nuestro cursor (array)
CLOSE cursor1;

END