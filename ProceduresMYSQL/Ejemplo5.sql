CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_venta`(vfecha DATE, maxitems INT, maxcantidad INT)
BEGIN
-- declaramos variables
DECLARE vcliente VARCHAR(12);
DECLARE vproducto VARCHAR(20);
DECLARE vvendedor VARCHAR(20);
DECLARE vcantidad INT ;
DECLARE vprecio FLOAT;
DECLARE vitems INT;
DECLARE vnfactura INT;
DECLARE vcondicion INT DEFAULT 1;
DECLARE vnumitems INT;

-- sentencia SQL
SELECT MAX(NUMERO) +1 INTO vnfactura FROM FACTURAS;

-- agrgamos informacion a nuestras variables
SET vcliente = cliente_aleatorio();
SET vvendedor = vendedor_aleatorio();

-- insertamos la informacion de nuestras variables a nuestra tabla facturas
 INSERT INTO facturas (NUMERO,FECHA_VENTA,DNI,MATRICULA,IMPUESTO)VALUES(vnfactura,vfecha,vcliente,vvendedor,0.5);
 SET vitems = F_aleatorio(1,maxitems);
-- creamos nuestro bucle while
WHILE vcondicion <= vitems
DO
   SET vproducto = producto_aleatorio();
   
   SELECT COUNT(*) INTO vnumitems  FROM items
   WHERE CODIGO= vproducto AND NUMERO = vnfactura;
     
 IF vnumitems = 0 THEN
 
	SET vcantidad = F_aleatorio(1,maxcantidad);
    SELECT PRECIO INTO vprecio FROM productos WHERE CODIGO = vproducto;
    INSERT INTO items (NUMERO,CODIGO,CANTIDAD,PRECIO)VALUES(vnfactura,vproducto,vcantidad,vprecio);
    
 END IF; 
 
 SET vcondicion = vcondicion + 1;
  
END WHILE;

END