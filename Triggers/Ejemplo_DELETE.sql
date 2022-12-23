-- creamos nuestro trigger

-- creamos nuestro trigger para actualizar nuestra tabla cada vez que se haga un update 
-- empezamos con el comando "DELIMITER //" para iniciar nuestro trigger
DELIMITER //
-- primero creamos nuestro trigger y le asignamos un nombre
CREATE TRIGGER  TG_FACTURACION_DELETE
-- despues le indicamos de que evento quiero que se dipare el trigger en este caso le indicadamos despues de que se haga un "DELETE"

AFTER DELETE ON items_facturas_tb
-- ponemos el comando for each row begin para indicar el monado que queremos que haga
FOR EACH ROW BEGIN
	DELETE FROM facturacion_tb;
	INSERT INTO facturacion_tb
	SELECT   B.FECHA_VENTA,SUM(A.CANTIDAD * A.PRECIO)AS TOTAL
	FROM items_facturas_tb A
	INNER JOIN facturas_tb B
	ON A.NUMERO = B.NUMERO
	WHERE B.FECHA_VENTA = '2022-04-24'
	GROUP BY B.FECHA_VENTA;

END //
-- finalizamos el trigger con nuestro END
-- RECORDEMOS QUE ESTA INFORMACION SE ALAMACENA EN UNA TABLA YA POSTERIORMENTE CREADA PARA VER LA INFORMACION MAS CLARA


DELETE FROM items_facturas_tb
WHERE NUMERO = 2547;