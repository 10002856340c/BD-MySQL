CREATE DEFINER=`root`@`localhost` FUNCTION `F_aleatorio`(min INT , max INT)
-- primero declaramos que vamos a retornar un int,un varchar, un float , un double, un date etc
RETURNS int
BEGIN
-- declaramos normalmente nuestra variable 
DECLARE vresultado int ;
-- ejecutamos nuestro comando , recordar que la funcion tiene dos parametros 
SELECT FLOOR(RAND() * (max-min+1)+min) AS NUMERO into vresultado;
-- retornamos en este caso la variable  "vresultado" que es de tipo int
RETURN vresultado;
END

-- 1) recoradar que cuando se crea una funcion primero devemos ejecutar esta variabñe 
-- SET GLOBAL log_bin_trust_function_creators = 1;
-- 2) recordar que las funciones en MYSQL se llaman con el comando SELECT y el nombre de la funcion con sus respectivos parametros