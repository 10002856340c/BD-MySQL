-- Ejemplo 1 
USE ejemplo;

INSERT INTO `ejemplo`.`items_facturas_tb`
(`NUMERO`,
`CODIGO_DEL_PRODUCTO`,
`CANTIDAD`,
`PRECIO`)
VALUES
(4785,
'1166',
10,
5.64);

INSERT INTO `ejemplo`.`facturas_tb`
(`DNI`,
`MATRICULA`,
`FECHA_VENTA`,
`NUMERO`,
`IMPUESTO`)
VALUES
('6549',
'1124',
'2022-04-24',
1166,
0.1
);


-- creamos nuestro trigger

-- creamos nuestro trigger para actualizar nuestra tabla cada vez que se haga un update 
-- empezamos con el comando "DELIMITER //" para iniciar nuestro trigger
DELIMITER //
-- primero creamos nuestro trigger y le asignamos un nombre
CREATE TRIGGER  TG_FACTURACION_INSERT
-- despues le indicamos de que evento quiero que se dipare el trigger en este caso le indicadamos despues de que se haga un "INSERT"
AFTER INSERT ON items_facturas_tb
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
