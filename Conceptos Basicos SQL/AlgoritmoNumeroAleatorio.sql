SELECT * FROM empresa.clientes;
-- para crear una funcion tenemos primero que declarar esta variable
SET GLOBAL log_bin_trust_function_creators = 1;
-- Algoritmo para hayar un numero entero aleatorio

/*MIN = 20 Y MAX = 250

(RAND() * (MAX - MIN + 1))+ MIN

*/

-- la funcion RAND te genera un numero aleatorio desde 0 a 1 
-- la funcion FLOOR te genera el numero entero de un decimal o un numero que tenga muchos decimales

SELECT FLOOR(RAND() * (250-20+1)+20) AS NUMERO;

SELECT RAND()*8;