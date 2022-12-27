CREATE DEFINER=`root`@`localhost` FUNCTION `producto_aleatorio`() RETURNS varchar(50) CHARSET utf8mb4
BEGIN
-- declaramos nuestras variables en las cueles

-- la variable "vresultado va alamcenar el DNI del cliente"
DECLARE vresultado VARCHAR(11);
DECLARE concat1 VARCHAR(50);
DECLARE concat2 VARCHAR(50);
-- la variable vmax va almacenar el numero maximo que en este caso seria 16 clientes
DECLARE vmax INT;
-- la variable donde se va almacenar nuestro numero aleatorio llamando nuestra funcion anterior en el cual le indicamos desde que rango va ir nuestro numero aleatorio
DECLARE valeatorio INT;
-- hacemos nuestra consulta para contar cuantos cliente hay en la tabla clientes esta informacion la introducimos en la variable "vmax"
SELECT COUNT(*) INTO vmax FROM productos;
-- Sobreescribimos nuestra variable "valeatorio" en el cual va almacenar nuestro numero aleatorio
SET valeatorio = F_aleatorio(1,vmax);
-- Teniendo en cuenta que vamos a utilizar el comando LIMIT tenemos que saber que en un intervalo de {0,16} si existe pero un intervalo de {1,17}no existe 
-- ya que solo hay 16 clientes es decir tenemos que resta un 1 para que cada vez que la funcion cree un numero aleatorio dentro del intervalo de {1,16}no se salga del rango y nos de un NULL en nuestra consulta o funcion
SET valeatorio = valeatorio-1;
-- hacemos nuestra consulta en el cual la informacion se va alamacenar en nuestra variable "vresultado" 
SELECT CODIGO INTO vresultado  FROM productos LIMIT valeatorio,1;

RETURN  vresultado;

END