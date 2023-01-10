USE jugos_ventas;

-- Costo "3.75"
START TRANSACTION;

SELECT A.CODIGO_DEL_PRODUCTO FROM tabla_de_productos A;
ALTER TABLE tabla_de_productos ADD INDEX (CODIGO_DEL_PRODUCTO)
ROLLBACK
-- Costo "6065.92" 
-- A medida que nuestras consultas (querys) tenga INNER JOIN LEFT JOIN , GROUP BY , UNION , UNION ALL claramente va incrementar el costo y el tiempo de ejecucion



EXPLAIN FORMAT = JSON SELECT A.NOMBRE_DEL_PRODUCTO, B.PRECIO AS TOTAL FROM tabla_de_productos A 
INNER JOIN items_facturas B 
ON A.CODIGO_DEL_PRODUCTO = B.CODIGO_DEL_PRODUCTO;

-- Costo 211939.80

EXPLAIN FORMAT = JSON SELECT A.NOMBRE_DEL_PRODUCTO, ROUND(SUM(B.PRECIO*B.CANTIDAD),2) AS TOTAL FROM tabla_de_productos A 
INNER JOIN items_facturas B 
ON A.CODIGO_DEL_PRODUCTO = B.CODIGO_DEL_PRODUCTO
INNER JOIN facturas C
ON B.NUMERO = C.NUMERO
GROUP BY A.NOMBRE_DEL_PRODUCTO;

-- a traves de los indices podemos reducir el costo de nuestras consultas (querys)





