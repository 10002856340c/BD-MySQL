--                                                             Backup de nuestra base de datos ("Copia de Seguridad")


-- 1) Para hacer un Backup de nuestra base de datos debemos primero detener nuestra base de datos con el siguiente comando

LOCK instance for backup;

-- 2) Debemos ir a nuestra base de datos y exportarla con la ayuda de MySQL Workbench "

-- 3) Elegimos nuestra carpeta donde queremos que se guarde nuestra base de datos , " TENER PRIORIDAD CON NUESTRA BASE DE DATOS "

-- 4) Despues de hacer nuestro Backup("Copia de seguridad") hacemos nuestro levantamiento de la base datos para que siga funcionado correctamente con el siguiente comando 

UNLOCK INSTANCE;

******************************************************************************************************************************************************************************

-- tambien se puede hacer por la linea de comandos con el siguiente comando :

 *) mysqldump -u [username] -p[password] [database_name] > [backup_file.sql]

username : es el nombre de usuario de MySQL.
password : es la contraseña de MySQL.
database_name : es el nombre de la base de datos que deseas hacer una copia de seguridad.
backup_file.sql : es el nombre del archivo de copia de seguridad que se creará.
