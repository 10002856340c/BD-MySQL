use jugos_ventas;
use ejemplo;

select * from facturas;
SELECT * FROM items_facturas;
select * from tabla_de_clientes;
select * from tabla_de_productos;
select * from tabla_de_vendedores;
select * from tabla_de_clientes;
describe facturas;
describe tabla_de_clientes;
describe tabla_de_productos;
describe tabla_de_vendedores;


/*Para alterar,modificar, o cambia el tipo de dato de nuestra columna en la tabla
*/

ALTER TABLE tb_cliente MODIFY COLUMN LIMITE_CREDITO FLOAT;

                                     /*usando IN*/

/*------------------------------------------------------------------------------------------------*/
SELECT 
    *
FROM
    tabla_de_productos
WHERE
    SABOR IN ('mango' , 'uva');
       
/*------------------------------------------------------------------------------------------------------*/

SELECT 
 CODIGO_DEL_PRODUCTO AS STOCK , NOMBRE_DEL_PRODUCTO AS NOMBRE, TAMANO AS VOLUMEN 
FROM
    tabla_de_productos
WHERE
    NOMBRE_DEL_PRODUCTO IN ('vida del campo' , 'linea citrus') AND NOT (SABOR = 'sandia' OR SABOR = 'limon')AND NOT (TAMANO = '700 ml');
    

/*----------------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT 
    *
FROM
    tabla_de_productos
WHERE
    (NOMBRE_DEL_PRODUCTO = 'vida del campo' OR NOMBRE_DEL_PRODUCTO = 'verano')
        AND (PRECIO_DE_LISTA  BETWEEN 1 AND 50) AND ENVASE IN ('botella de vidrio','lata') ;
        
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
 SELECT 
    *
FROM
    tabla_de_productos
WHERE
    SABOR IN ('uva' , 'sandia') ;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT 
    *
FROM
    tabla_de_vendedores
WHERE
    PORCENTAJE_COMISION < 10
        AND YEAR(FECHA_ADMISION) = 2014;
 /*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

SELECT 
    *
FROM
    tabla_de_clientes
WHERE
    BARRIO IN ('del valle' , 'floresta coyoacan', 'carola')
        AND (LIMITE_DE_CREDITO BETWEEN 80000 AND 150000)
        AND (YEAR(FECHA_DE_NACIMIENTO) <= 1995);
        
/*---------------------------------------------------------------------------------------------------------------------------------------------------------*/

														 /*Usando LIKE*/

SELECT 
    *
FROM
    tabla_de_productos
WHERE
    SABOR LIKE ('c%');
    
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

SELECT 
    *
FROM
    tabla_de_productos
WHERE
    SABOR LIKE ('s_%');

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

SELECT 
    *
FROM
    tabla_de_productos
WHERE
    SABOR LIKE ('%i%')
        AND SABOR LIKE ('%O%');
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Los nombres que terminan en ez*/

SELECT 
    *
FROM
    tabla_de_clientes
WHERE
    NOMBRE LIKE ('%ez');
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
                                      
                                                           /*Usando DISTINCT*/
/* DATOS QUE QUEROS QUE NO SE REPITAN EN NUESTRA BASE DE DATOS*/
SELECT DISTINCT
    NOMBRE_DEL_PRODUCTO AS PRODUCTO, TAMANO AS VOLUMEN
FROM
    tabla_de_productos;


SELECT DISTINCT
    LIMITE_DE_CREDITO AS CREDITO , NOMBRE
FROM
    tabla_de_clientes;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

SELECT DISTINCT
    BARRIO
FROM
    tabla_de_clientes
WHERE
    CIUDAD = 'ciudad de mexico';

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

                                                   /*usando LIMIT */

SELECT 
    *
FROM
    tabla_de_clientes
LIMIT 8;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

SELECT 
    *
FROM
    tabla_de_clientes
LIMIT 8,4;


/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/


SELECT 
    NOMBRE, FECHA_DE_NACIMIENTO 
FROM
    tabla_de_clientes
WHERE
    YEAR(FECHA_DE_NACIMIENTO) < 1999
     LIMIT 3;
 
 /*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

SELECT 
    VENTAS
FROM
    TABLA_VENTAS
WHERE
    DIA = '01/01/2017'
LIMIT 10;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

                                                  /*usando ORDER BY*/
/*ORGANIZAR DE FORMA ASCENDENTE LOS NOMBRES Y EL LIMITE DE CREDITO DE FORMA DESCENDENTE PARA VER DEL MAYOR CREDITO A MENOR CREDITO*/
SELECT 
    NOMBRE, DIRECCION_1, BARRIO, LIMITE_DE_CREDITO AS DEUDA
FROM
    tabla_de_clientes
WHERE
    BARRIO IN ('Del Valle' , 'carola')
ORDER BY NOMBRE ASC , LIMITE_DE_CREDITO DESC;

/*SELECCIONAME LOS DATOS DE LAS PERSONAS DESDE LA MAYOR DEUDA A LA MENOR DEUDAD Y EL MAYOR SALDO AL MENOR SALDO  EN COMPRAS ESTO DE FORMA DESCENDENTE QUE
 ESTEN ENTRE UNA EDAD DE 22 A 40 AÑOS Y QUE HAYAN ECHO COMPRAS*/
SELECT DISTINCT
    NOMBRE,
    DIRECCION_1,
    BARRIO,
    LIMITE_DE_CREDITO AS DEUDA,
    VOLUMEN_DE_COMPRA AS SALDO_COMPRAS,
    EDAD
FROM
    tabla_de_clientes
WHERE
    YEAR(FECHA_DE_NACIMIENTO) < 1995
        AND EDAD BETWEEN 22 AND 40 AND PRIMERA_COMPRA = 1
ORDER BY  LIMITE_DE_CREDITO DESC , VOLUMEN_DE_COMPRA DESC;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

/*organizar los productos refrescantes con sabor mango o frutilla limon desde el mas caro */
SELECT DISTINCT
    *
FROM
    tabla_de_productos
WHERE
    NOMBRE_DEL_PRODUCTO = 'refrescante'
        AND SABOR IN ('mango' , 'frutilla/limon')
ORDER BY PRECIO_DE_LISTA DESC  ;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

                                            /*usando GROPU BY*/
                                            
/*Agrupar por nombre del producto cuantos sabores tiene cada producto*/

SELECT 
    NOMBRE_DEL_PRODUCTO, COUNT(SABOR) AS NUMERO_SABORES
FROM
    tabla_de_productos
GROUP BY NOMBRE_DEL_PRODUCTO;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

/*agrupar por la suma total de deuda que tiene cada barrio mayor a 150000 dolares desde el mayor a menor*/
SELECT 
    NOMBRE, BARRIO, SUM(LIMITE_DE_CREDITO) AS DEUDA
FROM
    tabla_de_clientes
WHERE
    LIMITE_DE_CREDITO > 150000
GROUP BY BARRIO
ORDER BY LIMITE_DE_CREDITO DESC;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/


SELECT 
    ESTADO, SUM(LIMITE_DE_CREDITO) AS TOTAL_DEUDA
FROM
    tabla_de_clientes
GROUP BY ESTADO;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/


SELECT 
    CODIGO_DEL_PRODUCTO, ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO
FROM
    tabla_de_productos
GROUP BY ENVASE;


SELECT 
    ENVASE, COUNT(*)
FROM
    tabla_de_productos
GROUP BY ENVASE;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/


SELECT 
    BARRIO,
    ESTADO,
    SUM(VOLUMEN_DE_COMPRA) AS VOLUMEN_DE_COMPRA,
    PRIMERA_COMPRA
    
FROM
    tabla_de_clientes
WHERE
    PRIMERA_COMPRA = 1
GROUP BY BARRIO,ESTADO
ORDER BY VOLUMEN_DE_COMPRA; 


/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
                                      
                                                         /*sentencia HAVING */

SELECT 
    ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL
FROM
    tabla_de_clientes
GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO)>300000;



SELECT DISTINCT
    CODIGO_DEL_PRODUCTO,
    ENVASE,
    MAX(PRECIO_DE_LISTA) AS PRECIO_MAYOR,
    MIN(PRECIO_DE_LISTA) AS PRECIO_MENOR,
    SUM(PRECIO_DE_LISTA) AS SUMATOTAL
FROM
    tabla_de_productos
GROUP BY ENVASE 
/*HAVING REEMPLAZA A LA CLAUSA DE FILTRO WHERE*/
HAVING SUM(PRECIO_DE_LISTA)>80 ;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                    /*sentencia CASE*/

SELECT NOMBRE,FECHA_DE_NACIMIENTO,
    CASE 
        WHEN YEAR(FECHA_DE_NACIMIENTO) < 1990 THEN 'Viejos'
        WHEN YEAR(FECHA_DE_NACIMIENTO) BETWEEN 1990 AND 1995 THEN 'Jovenes o nacidos'
        WHEN YEAR(FECHA_DE_NACIMIENTO) > 1995 THEN 'Niños'
        ELSE 'No se encontraron resultados'
    END AS RESULTADOS
FROM
    tabla_de_clientes;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
							            /*sentencia INNER JOIN*/  

/*EJEMPLO CON INNER JOIN*/
/*RECORDAR QUE INNER JOIN TE VA CONSULTAR LOS DATOS SIEMPRE Y CUANDO LOS DATOS ENTRE LAS DOS TABLAS O MAS TENGAN UNA 
COINCIDENCIA */
SELECT 
    A.TAMANO,
    B.CANTIDAD,
    A.CODIGO_DEL_PRODUCTO,
    B.CODIGO_DEL_PRODUCTO
FROM
    tabla_de_productos A
        INNER JOIN
    items_facturas B ON A.CODIGO_DEL_PRODUCTO = B.CODIGO_DEL_PRODUCTO;
    

SELECT 
    A.NOMBRE, A.PORCENTAJE_COMISION, B.DNI, B.FECHA_VENTA,A.MATRICULA,B.MATRICULA
FROM
    tabla_de_vendedores A
        INNER JOIN
    facturas B ON A.MATRICULA = B.MATRICULA;
    

SELECT 
    A.NOMBRE, B.MATRICULA, COUNT(*) AS TOTAL_MATRICULAS
FROM
    tabla_de_vendedores A
        INNER JOIN
    facturas B ON A.MATRICULA = B.MATRICULA
    GROUP BY  A.NOMBRE, B.MATRICULA;
    


SELECT DISTINCT
    SUM(A.CANTIDAD * A.PRECIO) AS TOTAL_ANUAL,
    YEAR(B.FECHA_VENTA) AS AÑO
FROM
    items_facturas A
        INNER JOIN
    facturas B ON A.NUMERO = B.NUMERO
GROUP BY YEAR(B.FECHA_VENTA)
ORDER BY TOTAL_ANUAL DESC;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
                                                        /*EJEMPLOS CON LEFT JOIN*/

/*QUEREMOS QUE NOS TRAIGA LOS NOMBRES DE LAS PERSONAS DE LAS DOS TABLAS DONDE HAYAN DOS COLUMNAS REFERENCIADAS
Y TAMBIEN LAS QUE NOS ENTEN REFERENCIADAS EN OTRA COLUMNA , EN ESTE CASO EL BARRIO*/
SELECT 
    A.NOMBRE, A.BARRIO, B.NOMBRE, B.BARRIO,B.VACACIONES
FROM
    tabla_de_clientes A
        LEFT JOIN
    tabla_de_vendedores B ON A.BARRIO = B.BARRIO;

SELECT 
    A.BARRIO,
    A.CIUDAD,
    A.DNI,
    B.MATRICULA,
    FECHA_VENTA,
    B.DNI,
    A.ESTADO,
    COUNT(*) AS ESTADOS
FROM
    tabla_de_clientes A
        LEFT JOIN 
    facturas B ON A.DNI = B.DNI
GROUP BY A.DNI;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
                                    /*sentencia  UNION */


/*Nos traer la informacion de la dos tabla siempre y cuando sea el mismo numero de filas y columnas
*/
SELECT 
    VACACIONES,NOMBRE,'Vendedores'
FROM
    tabla_de_vendedores 
UNION 
SELECT 
    BARRIO,NOMBRE,'Clientes'
FROM
    tabla_de_clientes;
    

SELECT 
    NUMERO, DNI,'Tabla Facturas'
FROM
    facturas
UNION
SELECT NUMERO,CODIGO_DEL_PRODUCTO,'Tabla items facturas'
FROM items_facturas 
group by NUMERO
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

								/*SUBCONSULTAS*/
                                
/*En vez de hacer esta consulta un poco larga para consultar cierto tipo de barrios */
SELECT 
    *
FROM
    tabla_de_clientes
WHERE
    BARRIO IN ('Del valle' , 'Locaxco','Cuajimalpa','Condesa','Héroes de Padierna','etc...');                      
   
/*Puedes hacer esta subconsulta,una consulta dentro de otra consulta*/
SELECT 
    *
FROM
    tabla_de_clientes
WHERE
    BARRIO IN (SELECT DISTINCT BARRIO FROM tabla_de_clientes);

 
 
/*ENVES DE HACER ESTO PARA CONSULTAR EL PRECIO MAXIMO POR ENVASE */
 SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO FROM tabla_de_productos
 GROUP BY ENVASE;


/* PUEDES HACER ESTA SUBCONSULTA*/
SELECT A.ENVASE,A.PRECIO_MAXIMO 

FROM (SELECT ENVASE, MAX(PRECIO_DE_LISTA)AS PRECIO_MAXIMO FROM TABLA_DE_PRODUCTOS GROUP BY ENVASE) A ;



/*EN ves de hacer esta consulta para hallar el numero de dni por fecha de venta*/

SELECT 
    fecha_venta,DNI,COUNT(*) AS TOTAL
FROM
    facturas
    WHERE YEAR(FECHA_VENTA)=2016
    GROUP BY DNI
    HAVING COUNT(*)>2000
    ORDER BY TOTAL DESC;

/*Puedes hacerlo de la siguiente manera , haciendo una subconsulta*/

/*1 forma echa por el estudiante*/
SELECT 
    A.DNI, A.TOTAL
FROM
    (SELECT 
        fecha_venta, DNI, COUNT(*) AS TOTAL FROM facturas 
        WHERE YEAR(fecha_venta) = 2016
        GROUP BY DNI HAVING COUNT(*) > 2000) A;


/*2 forma echa por el docente*/
SELECT 
    X.DNI, X.CONTADOR
FROM
    (SELECT 
        DNI, COUNT(*) AS CONTADOR
    FROM
        facturas
    WHERE
        YEAR(FECHA_VENTA) = 2016
    GROUP BY DNI) X
WHERE
    X.CONTADOR > 2000;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/


                                            /*VIEWS EN SQL*/
/*Creamos una tabla view apartir de una consulta ya creada 
en este caso ya creamos una tabla view  que se llama new_view*/

SELECT 
    fecha_venta, dni, COUNT(*) AS DNI
FROM
    new_view
GROUP BY dni;


/*Creamos una tabla view apartir de una consulta ya creada 
en este caso ya creamos una tabla view  que se llama envases_sabores


VAMOS A HAYAR EL PROMEDIO DE VARIACION RESPECTO AL PRECIO DE LISTA Y EL PRECIO MAXIMO
RECORDEMOS QUE EN SQL TAMBIEN SE PUEDEN HACER OPERACIONES MATEMATICAS QUE NOS HAYUDAN AL ANALISIS DE NUESTRA BASE DE DATOS*/			
            
SELECT 
    A.ENVASE,
    A.NOMBRE_DEL_PRODUCTO,
    B.ENVASE,
    B.SABOR,
    ((A.PRECIO_DE_LISTA / B.PRECIO_MAXIMO) - 1) * 100 AS PROMEDIO
FROM
    tabla_de_productos A
        INNER JOIN
    envases_sabores B ON A.ENVASE = B.ENVASE;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*DOCUMENTACION DE TODAS LAS FUNCIONES DE MYSQL*/
 /*https://www.w3schools.com/mysql/mysql_ref_functions.asp*/   
 
 
                                       /*Funciones STRING*/
                                       
/*cuando hay caracteres a la izquierda y los queremos "centrar"*/                                       
SELECT LTRIM("  CRISTIAN");
/*cuando hay caracteres a la derecha y los queremos "centrar"*/
SELECT RTRIM("CRISTIAN   ");
/*cuando hay caracteres a la derecha y a la izquierda y los queremos "centrar"*/
SELECT TRIM("    cristian     ");
/*cuando hay dos tipos de caracteres diferentes y los queremos concatenar*/
SELECT CONCAT("MY SQL ES FACIL"," NO LO CREES ?");
/*cuando hay caracteres en minuscula y queremos pasarlos a mayusculas */
SELECT UPPER("mi sql es facil ");
/*cuando hay caracteres en amyuscula y queremos pasarlos a minusculas */
SELECT LOWER("MY SQL ES FACIL");
/*cuando queremos seleccionar una palabra en especifica de un conjunto de caracteres se le indica el indice,# de caracteres */
select SUBSTRING("hola mi amor como estas?",9,4);
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

                                          /*Funciones DATE */

/*Seleccionar la fecha actual,AÑO,MES,DIA*/
SELECT CURDATE();
/*selecciona el AÑO,MES,DIA Y LA HORA ACTUAL*/
SELECT CURRENT_TIMESTAMP();
/*Seleccionar el año actual */
SELECT YEAR(CURRENT_TIMESTAMP());
/*Seleccionar el mes actual*/
SELECT MONTH(current_timestamp());
/*Seleccionar el dia actual*/
SELECT DAY(current_timestamp());
/*Seleccionar el nombre del mes actual*/
SELECT MONTHNAME(current_timestamp());
/*Seleccionar el nombre de el dia actual*/
SELECT DAYNAME(current_timestamp());
/*seleccionar la diferencia de dias respecto a la fecha actual con otra fecha*/
SELECT DATEDIFF(current_timestamp(),'2022/11/28');/*UNA DIFERENCIA DE DOS DIAS RESPECTO AL DIA 30 DE NOVIEMBRE*/
/*seleccionar un intervalo de la fecha actual es deciar hace 1 mes, hace dos meses etc,TAMBIEN CONDIAS Y TAMBIEN CON DIAS Y AÑOS*/
SELECT (current_timestamp()) AS DIA_HOY,
DATE_SUB(current_timestamp(), INTERVAL 2 MONTH) AS RESULTADO;

/*QUEDAMOS EN ESTA PARTEEE DE NUESTRO DOCUMENTO DE GOOGLE*/
/*EJEMPLO CON NUESTRAS TABLAS */
/*Queremos saber en que  dia de la semana, mes y en que año fueron las ventas de nuestra empresa*/
SELECT DISTINCT
    FECHA_VENTA,
    DAYNAME(FECHA_VENTA) AS DAY_NAME,
    MONTHNAME(FECHA_VENTA) AS MONTH_NAME,
    YEAR(FECHA_VENTA) AS YEAR_
FROM
    facturas
ORDER BY YEAR(FECHA_VENTA) ;



SELECT DATEDIFF(YEAR,fecha_de_nacimiento,GETDATE()) AS edad;


/*2 ejemplos para saber cual es la edad de los clientes de nuestra tabla clientes*/
SELECT 
    NOMBRE,
    (YEAR(CURDATE()) - YEAR(A.FECHA_DE_NACIMIENTO)) AS EDAD
FROM
    tabla_de_clientes A
ORDER BY EDAD DESC;


SELECT 
    NOMBRE,
    TIMESTAMPDIFF(YEAR,
        FECHA_DE_NACIMIENTO,
        CURDATE()) AS EDAD
FROM
    tabla_de_clientes
    ORDER BY EDAD DESC;
  /*-----------------------------------------------------------------------------------------------------------------------------------------------------*/
  
                                            /*funciones MATEMATICAS*/
/*Salta al siguiente numero independientemente de los decimales que le coloquemos o tenga*/
SELECT CEILING(25.01);
/*redondeamos y le indicamos el numero de decimales que queremos que aparezca*/
SELECT ROUND((34 + 60)/15 *96,2) AS OPERACION;
SELECT ROUND(125.6987548954521,2) AS REDONDEADO;


/*seleccionar cuanto seria el total entre la cantidad y el precio organizados por numero de identificacion de manera descendente*/
SELECT DISTINCT
    NUMERO,
    CANTIDAD,
    PRECIO,
    ROUND(CANTIDAD * PRECIO, 2) AS TOTAL
FROM
    items_facturas
GROUP BY NUMERO
ORDER BY TOTAL DESC
LIMIT 10;


/*SELECCIONAR EL IMPUESTO TOTAL PAGADO EN EL AÑO 2016*/
SELECT 
    YEAR(A.FECHA_VENTA) AS AÑO,
    SUM(FLOOR((B.CANTIDAD*B.PRECIO)*A.IMPUESTO)) AS TOTAL_IMPUESTO

    
FROM
    facturas A
        INNER JOIN
    items_facturas B ON A.NUMERO = B.NUMERO
WHERE
    YEAR(A.FECHA_VENTA) = 2016;
/*-----------------------------------------------------------------------------------------------------------------------------------------------------*/

                                                /*CONVIRTIENDO DATOS */
/*DOCUMENTACION DE FUNCIONES DATE AND TIME*/

/*https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html*/


SELECT CONCAT("EL DIA DE HOY ES ", CURRENT_TIMESTAMP) AS DIA_HOY;
SELECT CONCAT("LA FECHA Y EL HORARIO SON :",DATE_FORMAT(CURRENT_TIMESTAMP(),"%W,%T,%y")) AS HOY;
SELECT CONVERT(12.58,CHAR) AS RESULTADO;

/*Vamos a convertir el float 12.58 a un string mediante la funcion convert,se le indica tambien el tipo de dato a que queremos convertir
 y vamos a seleccionar un caracter en especial mediante la funcion substring para verificar si se hizo la conversion*/


SELECT SUBSTRING(CONVERT(12.58,CHAR),4,3) AS CONVERSION;

/*QUEREMOS SELECCIONAR EL NOMBRE DEL CLIENTE Y SABER EL TOTAL QUE FACTURO EN EL AÑO 2016 MEDIANTE LA CANTIDAD Y EL PRECIO AL CUAL COMPRO LOS PRODUCTOS 
Y QUE SE VEA MEDIANTE UNA CONCATENACION DE STRING --> "el cliente ?? facturo ?? USD  en el año 2016"<-- */

/*en este ejemplo utilizamos conversion de datos , inner join , soncatenacion de string,funciones matematicas como round y sum, y group by para agrupar los datos
, posteriormente utilizamos un filtro para hayar en un año especifico  */

SELECT 
    CONCAT(' El cliente ', A.NOMBRE,' facturo ',
	    CONVERT( ROUND(SUM(C.CANTIDAD * C.PRECIO),2) , CHAR (20)),' USD ',
            ' EN EL AÑO ',
	    CONVERT( YEAR(B.FECHA_VENTA) , CHAR (20))) AS FACTURACION_ANUAL 
        FROM tabla_de_clientes A
        INNER JOIN facturas B
        ON A.DNI = B.DNI
        INNER JOIN items_facturas C
        ON B.NUMERO = C.NUMERO
        WHERE YEAR(B.FECHA_VENTA)=2016
        GROUP BY YEAR(B.FECHA_VENTA),A.NOMBRE;
	
    
    
select * from facturas;

select * from items_facturas;
    
SELECT A.DNI,DATE_FORMAT(A.FECHA_VENTA, "%m - %Y") AS MES_AÑO , CONCAT(SUM(B.CANTIDAD),  "  VENTAS" ) AS VENTAS
 FROM facturas A
 INNER JOIN items_facturas B
 ON A.NUMERO = B.NUMERO
 GROUP BY A.DNI,DATE_FORMAT(A.FECHA_VENTA, "%m,%Y");
 
 
 /*Ventas invalidas*/
SELECT 
    A.DNI,
    DATE_FORMAT(A.FECHA_VENTA, '%m - %Y') AS MES_AÑO,
    SUM(B.CANTIDAD)AS VENTAS,
    MAX(B.CANTIDAD) AS CANTIDAD_MAXIMA
FROM
    facturas A
        INNER JOIN
    items_facturas B ON A.NUMERO = B.NUMERO
GROUP BY A.DNI , DATE_FORMAT(A.FECHA_VENTA, '%m,%Y');


/*Limite de ventas por cliente */




SELECT 
    A.DNI,C.NOMBRE,
    DATE_FORMAT(A.FECHA_VENTA, '%m - %Y') AS MES_AÑO,
    SUM(B.CANTIDAD)AS VENTAS,
    MAX(VOLUMEN_DE_COMPRA)/10 AS CANTIDAD_MAXIMA
FROM
    facturas A
        INNER JOIN
    items_facturas B ON A.NUMERO = B.NUMERO
    INNER JOIN 
    Tabla_de_clientes C
    ON C.DNI = A.DNI
GROUP BY A.DNI,C.NOMBRE, DATE_FORMAT(A.FECHA_VENTA, '%m,%Y');




SELECT A.DNI,A.NOMBRE,A.MES_AÑO,(CANTIDAD_VENDIDA-CANTIDAD_MAXIMA) AS DIFERENCIA,
CASE 
 WHEN CANTIDAD_VENDIDA-CANTIDAD_MAXIMA <=0 THEN '-->  Venta Valida'
 WHEN CANTIDAD_VENDIDA-CANTIDAD_MAXIMA > 0 THEN '-->  Venta Invalida'
END AS ESTATUS, ROUND((1-(A.CANTIDAD_MAXIMA/A.CANTIDAD_VENDIDA))*100,2) AS PORCENTAJE
 FROM (SELECT 
    B.DNI,D.NOMBRE,
    DATE_FORMAT(B.FECHA_VENTA, '%m - %Y') AS MES_AÑO,
    SUM(C.CANTIDAD)AS CANTIDAD_VENDIDA,
    MAX(VOLUMEN_DE_COMPRA)/10 AS CANTIDAD_MAXIMA
FROM
    facturas B
        INNER JOIN
    items_facturas C ON B.NUMERO = C.NUMERO
    INNER JOIN 
    Tabla_de_clientes D
    ON D.DNI = B.DNI
    WHERE YEAR(B.FECHA_VENTA)=2018
GROUP BY B.DNI,D.NOMBRE, DATE_FORMAT(B.FECHA_VENTA, '%m,%Y'))A
WHERE ROUND((1-(A.CANTIDAD_MAXIMA/A.CANTIDAD_VENDIDA))*100,2) >50
ORDER BY DIFERENCIA;







/*TENEMOS CANTIDAD TOTAL VENDIDA POR SABOR EN EL AÑO 2016 */
SELECT  TABLA_D.TAMAÑO,TABLA_D.AÑO,TABLA_D.CANTIDAD_TOTAL,ROUND((TABLA_D.CANTIDAD_TOTAL/TABLA_H.CANTIDAD_TOTAL)*100,2) PORCENTAJE FROM(
SELECT A.TAMANO AS TAMAÑO,SUM(B.CANTIDAD) AS CANTIDAD_TOTAL,YEAR(C.FECHA_VENTA) AS AÑO 
FROM tabla_de_productos A
INNER JOIN items_facturas B
ON A.CODIGO_DEL_PRODUCTO = B.CODIGO_DEL_PRODUCTO
INNER JOIN facturas C
ON B.NUMERO = C.NUMERO
WHERE YEAR(C.FECHA_VENTA) = 2016 
GROUP BY A.TAMANO,YEAR(C.FECHA_VENTA)
ORDER BY SUM(B.CANTIDAD) DESC) TABLA_D

INNER JOIN (

/*CANTIDAD TOTAL VENDIDA*/
SELECT SUM(B.CANTIDAD) AS CANTIDAD_TOTAL,YEAR(C.FECHA_VENTA) AS AÑO
FROM tabla_de_productos A
INNER JOIN items_facturas B
ON A.CODIGO_DEL_PRODUCTO = B.CODIGO_DEL_PRODUCTO
INNER JOIN facturas C
ON B.NUMERO = C.NUMERO
WHERE YEAR(C.FECHA_VENTA) = 2016 
GROUP BY YEAR(C.FECHA_VENTA)) TABLA_H

ON TABLA_D.AÑO = TABLA_H.AÑO 
ORDER BY PORCENTAJE DESC;


/*ejemplo con la sentencia default*/

CREATE TABLE REGISTRO(
ID INT AUTO_INCREMENT,
DESCRIPCION VARCHAR(50) NOT NULL,
DIRECCION VARCHAR(50) default 'calle 58 b sur ',
CIUDAD VARCHAR(50)DEFAULT 'BOGOTA',
FECHA_DE_CREACION TIMESTAMP DEFAULT current_timestamp(),
PRIMARY KEY(ID)
);


SELECT * FROM REGISTRO;

INSERT INTO `jugos_ventas`.`registro`
(`DESCRIPCION`)
VALUES
('como ');


SELECT * FROM facturacion;

CREATE TABLE ejemplo.facturacion(

FECHA DATE NULL,
VENTA_TOTAL FLOAT

);


CREATE TABLE `facturas_tb1` (
  `DNI` varchar(11) NOT NULL,
  `MATRICULA` varchar(5) NOT NULL,
  `FECHA_VENTA` date DEFAULT NULL,
  `NUMERO` int NOT NULL,
  `IMPUESTO` float DEFAULT NULL,
  PRIMARY KEY (`NUMERO`),
  KEY `FK_VENDEDORES1` (`MATRICULA`),
  KEY `FK_CLIENTES1` (`DNI`),
  CONSTRAINT `FK_ITEMS1` FOREIGN KEY (`NUMERO`) REFERENCES `items_facturas_tb` (`NUMERO`),
  CONSTRAINT `FK_VENDEDORES1` FOREIGN KEY (`MATRICULA`) REFERENCES `tabla_de_vendedores_tb` (`MATRICULA`)
) ;

CREATE TABLE `items_facturas_tb1` (
  `NUMERO` int NOT NULL,
  `CODIGO_DEL_PRODUCTO` varchar(10) DEFAULT NULL,
  `CANTIDAD` int DEFAULT NULL,
  `PRECIO` float DEFAULT NULL,
  PRIMARY KEY (`NUMERO`),
  KEY `FK_PRODUCTOS1` (`CODIGO_DEL_PRODUCTO`),
  CONSTRAINT `FK_PRODUCTOS1` FOREIGN KEY (`CODIGO_DEL_PRODUCTO`) REFERENCES `tabla_de_productos_tb` (`CODIGO_DEL_PRODUCTO`)
) ;



select * from items_facturas_tb1;
select * from facturas_tb1;
  

        