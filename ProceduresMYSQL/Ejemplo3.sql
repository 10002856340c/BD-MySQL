CREATE DEFINER=`root`@`localhost` PROCEDURE `reajuste_comision`(porcentaje float)
BEGIN

UPDATE tabla_de_vendedores
SET PORCENTAJE_COMISION = PORCENTAJE_COMISION * (1 + porcentaje);

SELECT * FROM tabla_de_vendedores;

END