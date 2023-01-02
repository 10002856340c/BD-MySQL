--                                                             Backup de nuestra base de datos ("Copia de Seguridad")


-- 1) Para hacer un Backup de nuestra base de datos debemos primero detener nuestra base de datos con el siguiente comando

LOCK instance for backup;

-- 2) Debemos ir a nuestra base de datos y exportarla con la ayuda de MySQL Workbench "

-- 3) Elegimos nuestra carpeta donde queremos que se guarde nuestra base de datos , " TENER PRIORIDAD CON NUESTRA BASE DE DATOS "

-- 4) Despues de hacer nuestro Backup("Copia de seguridad") hacemos nuestro levantamiento de la base datos para que siga funcionado correctamente con el siguiente comando 

UNLOCK INSTANCE;