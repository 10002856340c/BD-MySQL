# BD-mysql


 Hola comunidad en este repositorio encontraras conceptos y ejemplos de el lenguaje de consultas SQL , cabe aclarar que el motor de bases de datos es MYSQL v 8.0 
   <code><img title="Visual Studio Code" height="30" weight="20" src="https://cdnb.20m.es/sites/30/2020/10/dolphins.png"></code>
 <br>
 </br>
 Tambien pueden encontrar documentacion oficila en --> https://dev.mysql.com/doc/   <code><img title="Visual Studio Code" height="30" src="https://www.pngfind.com/pngs/m/219-2195646_interesting-emojis-de-whatsapp-babeando-hd-png-download.png"></code>
  <br>
 </br>
 No olviden seguir en mi perfil de linkdln --> www.linkedin.com/in/cristian-galeano-
  <br>

 </br>
 
SQL es un lenguaje de computación para trabajar con conjuntos de datos y las relaciones entre ellos. Los programas de bases de datos relacionales, como Microsoft Office Access, usan SQL para trabajar con datos. A diferencia de muchos lenguajes de computación, SQL no es difícil de leer y entender, incluso para un usuario inexperto. Al igual que muchos lenguajes de computación, SQL es un estándar internacional reconocido por organismos de estándares como ISO y ANSI.

SQL se usa para describir conjuntos de datos que pueden ayudarle a responder preguntas. Al usar SQL, debe usar la sintaxis correcta. La sintaxis es el conjunto de reglas mediante las que se combinan correctamente los elementos de un idioma. La sintaxis SQL se basa en la sintaxis del idioma inglés y usa muchos de los mismos elementos que la sintaxis de Visual Basic para Aplicaciones (VBA).

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 <br>
 </br>
 
# Para alterar,modificar, o cambia el tipo de dato de nuestra columna en la tabla

ALTER TABLE tb_cliente MODIFY COLUMN LIMITE_CREDITO FLOAT;

# Para seleccionar todos los datos que hay en una tabla de base de datos :

SELECT * FROM usuarios

--------------------------------------------------------------------------------------------------------------------------
 <br>
 </br>
 
# Para actualizar o modificar una columna o un dato en específico de una tabla utilizando filtros como el WHERE

UPDATE usuarios
SET correo='smith@gmail.com',Telefono='32569875428' --> nombre de las columnas 
where id_usuario=3

--------------------------------------------------------------------------------------------------------------------------
 <br>
 </br>
 
# Para agregar una llave primaria a una columna de nuestra tabla 

ALTER TABLE  tabla_vendedores
 ADD  primary key (matricula);

--------------------------------------------------------------------------------------------------------------------------
 <br>
 </br>
 
# para eliminar un dato de una tabla utilizando filtros como el WHERE y conectores lógico como el OR

DELETE FROM parqueo.clientes
WHERE id_usuario<8 or id_usuario=15;

--------------------------------------------------------------------------------------------------------------------------
 <br>
 </br>
 
# Para crear una tabla de de datos, una llave primaria es un dato que no se puede repetir , en este caso
el dato id_usuario no se puede repetir 

create table parqueo.clientes(
   id_usuario int not null auto_increment ,
   usuario varchar(60)not null,
   password blob(60) not null,
   primary key (id_usuario)
);
-------------------------------------------------------------------------------------------------------------------------
 <br>
 </br>
 
# Para insertar datos en nuestra tabla creada 


INSERT INTO usuarios(id_usuario,usuario,password)VALUES(1,'cristian12',254897),(2,'fabian12',2568),(3,'daniel45',25689)

-------------------------------------------------------------------------------------------------------

 <br>
 </br>
 
# Para crear una nueva columna en nuestra tabla 

ALTER TABLE usuarios
add telefono int (10) 

-------------------------------------------------------------------------------------------------------
 <br>
 </br>
 
# Para eliminar una columna de nuestra tabla 

ALTER TABLE usuarios
 DROP COLUMN teléfono
-------------------------------------------------------------------------------------------------------
 <br>
 </br>
 
# para cambiar el nombre de una columna 

ALTER TABLE rubros 
RENAME COLUMN id_rubros TO id

para cambiar el nombre de nuestra tabla 

ALTER TABLE tb_rubros RENAME tb_jobs

--------------------------------------------------------------------------------------------------------

 <br>
 </br>
  
# como crear una llave foránea de otra tabla a otra tabla 

en este ejemplo vamos a crear dos tabla una tabla llamada "usuarios" y otra tabla llamada "productos"


1)creamos nuestra tabla usuarios con los siguientes datos 


create table usuarios(
  id_usuarios int (50) not null,
  nombres varchar (50) not null,
  Apellidos varchar(50) not null,
  primary key(id_usuarios)

);

2 )creamos otra tabla y en este caso queremos crear un dato id_usuarios que se referencie a la tabla usuarios , es decir creamos una llave foránea 

create table productos(
 dni_producto int, 
 nombre_producto varchar(50),
 primary key (dni_producto),
 id_usuario int,
 constraint fk_usuario_id foreign key (id_usuario) references usuarios(id_usuarios)
);


---------------------------------------------------------------------------------------------------------------------

 <br>
 </br>
 
# Otro ejemplo para crear una base de datos con llaves foraneas en sus tablas

CREATE TABLE rubros (
    id  INT AUTO_INCREMENT,
    descripcion VARCHAR(20),
    PRIMARY KEY (id)
);


CREATE TABLE productos (
    id_productos INT AUTO_INCREMENT,
    codigo VARCHAR(10),
    descripcion VARCHAR(45),
    precioCompra DOUBLE,
    precioVenta DOUBLE,
    stock VARCHAR(20),
    PRIMARY KEY (id_productos),
    id_rubro INT,
    productos_proveedores_id int,
    CONSTRAINT fk_productos_id_rubro FOREIGN KEY (id_rubro)
        REFERENCES rubros (id),
	CONSTRAINT fk_productos_productos_proveedores FOREIGN KEY (productos_proveedores_id)
        REFERENCES productos_proveedores (id)
        
        
);


---------------------------------------------------------------------------------------------------------------------

create table proveedores(
   
   id int auto_increment,
   nombre varchar(50),
   primary key(id),
    productos_proveedores_id INT,
    CONSTRAINT fk_proveedores_productos_proveedores_id FOREIGN KEY (productos_proveedores_id)
        REFERENCES  productos_proveedores (id)

);

---------------------------------------------------------------------------------------------------------------------


create table factura_detalle(
 id_factura int,
 id_detalle int,
 id_producto int,
 cantidad int,
 facturas_id int,
 productos_id int,
 primary key(id_factura),
 
  CONSTRAINT fk_factura_detalle_facturas_id FOREIGN KEY (facturas_id)
        REFERENCES  facturas (id),
CONSTRAINT fk_factura_detalle_productos_id FOREIGN KEY (productos_id)
        REFERENCES  productos (id_productos)

);



---------------------------------------------------------------------------------------------------------------------


create table facturas(
id int,
fecha date,
total int ,
primary key(id)
);

create table cliente (
id int,
nombre varchar(45),
apellido varchar(45),
primary key(id),
facturas_id int,
CONSTRAINT fk_cliente_facturas_id FOREIGN KEY (facturas_id)
        REFERENCES facturas (id)
);



 
 
  ![image](https://user-images.githubusercontent.com/101605501/208708728-63fa9e9e-5d88-4c8d-8d37-52d78cded2e5.png)
  





