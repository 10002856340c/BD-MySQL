
-- para saber cuantas tablas tenemos en nuestro disco duro
SHOW GLOBAL STATUS LIKE 'Creadted_tmp_disk_tables';

-- para saber cuantas tablas temporales hemos creado en nuestro localhost (TEMPORALES)
SHOW GLOBAL STATUS LIKE 'Created_tmp_tables';

-- ver el tamaño de nuestra base de datos o conexiones , es decir el espacio para la creacion de tablas temporales 
SHOW GLOBAL VARIABLES LIKE 'tmp_table_size';

-- para aumentar nuestra memoria para la creacion de tablas temporales (siempre y cuando el servidor este activo) si se detine el servidor
-- el almacenamiento vuelve a su espacio de almacenamiento que tenia por defecto 
SET GLOBAL tmp_table_size = 115728640
