CREATE DEFINER=`root`@`localhost` PROCEDURE `cantidad_facturas`(fecha date)
BEGIN
/*declaramos la variable*/
DECLARE N_FACTURAS INTEGER;
/*ingresamos datos atraves del SELECT , INTO*/
SELECT COUNT(*) INTO N_FACTURAS FROM facturas WHERE
/*CREAMOS UN PARAMETRO DATE --> fecha PARA HACER MAS FUNCIONAL EL STORED PROCEDURE*/
FECHA_VENTA = fecha;
SELECT N_FACTURAS;
END