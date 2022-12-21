CREATE DEFINER=`root`@`localhost` PROCEDURE `incluir_productos`(codigo varchar(10),nombre varchar(50),tamano varchar(10),sabor varchar(20),envase varchar(20),precio_lista float)
BEGIN
DECLARE mensaje varchar(50);

/*CREAR UNA EXCEPCION DE ERROR */
DECLARE EXIT HANDLER FOR 1062
BEGIN 
   SET mensaje = 'producto duplicado';
   SELECT mensaje;
END;
/*SI NO SE PRESENTA ESTE ERROR SE EJECUTA EL SIGUIENTE CODIGO*/
INSERT INTO tabla_de_productos(CODIGO_DEL_PRODUCTO,NOMBRE_DEL_PRODUCTO,TAMANO,SABOR,ENVASE,PRECIO_DE_LISTA)
 VALUES(codigo,nombre,tamano,sabor,envase,precio_lista);
 
 /*Y MUESTRA EL MENSAJE */
SET mensaje = "producto incluido con exito";
SELECT mensaje;

/*Y POSTERIORMENTE LA TABLA*/
SELECT * FROM tabla_de_productos;
END