CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarsaborytamaño`(codigo varchar(15))
BEGIN
select SABOR,TAMANO AS TAMAÑO from tabla_de_productos
where CODIGO_DEL_PRODUCTO = codigo;
END