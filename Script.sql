#Creando base de datos llamada "db_empresa
CREATE SCHEMA `db_empresa` ; 

#creando una tabla llamada "clientes" dentro de la base de datos "db_empresa"
CREATE TABLE `db_empresa`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nit` VARCHAR(9) NULL,
  `nombres` VARCHAR(60) NULL,
  `apellidos` VARCHAR(60) NULL,
  `direccion` VARCHAR(100) NULL,
  `telefono` VARCHAR(8) NULL,
  PRIMARY KEY (`id_cliente`));

#actualizando la tabla clientes de la base de datos "db_empresa" para agregar una nueva columna
ALTER TABLE `db_empresa`.`clientes` 
ADD COLUMN `fecha_nacimiento` DATE NULL AFTER `telefono`;

#creando una tabla llamada "puestos" dentro de la base de datos "db_empresa"
CREATE TABLE `db_empresa`.`puestos` (
  `id_puesto` SMALLINT NOT NULL AUTO_INCREMENT,
  `puesto` VARCHAR(40) NULL,
  PRIMARY KEY (`id_puesto`));

#creando una tabla llada "empleados" dentro de la base de datos "db_empresa"
CREATE TABLE `db_empresa`.`empleados` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(20) NULL,
  `nombres` VARCHAR(60) NULL,
  `apellidos` VARCHAR(60) NULL,
  `direccion` VARCHAR(100) NULL,
  `telefono` VARCHAR(8) NULL,
  `fecha_nacimiento` DATE NULL,
  `id_puesto` SMALLINT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `id_puesto_puesto_empleados_idx` (`id_puesto` ASC) VISIBLE,
  CONSTRAINT `id_puesto_puesto_empleados`
    FOREIGN KEY (`id_puesto`)
    REFERENCES `db_empresa`.`puestos` (`id_puesto`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);
    

    
#insertando datos en una tabla
INSERT INTO `db_empresa`.`clientes` (`nit`, `nombres`, `apellidos`, `direccion`, `telefono`, `fecha_nacimiento`) 
VALUES ('444', 'Roberto', 'Santizo', 'Guatemala', '11111', '2003/1/19');
	
INSERT INTO clientes(nit,nombres,apellidos,direccion,telefono,fecha_nacimiento)
values('555','Carlos','Hernandez','El Tejar','12222','2004/2/21')

INSERT INTO `db_empresa`.`puestos` (`puesto`) VALUES ('Programador');
INSERT INTO `db_empresa`.`puestos` (`puesto`) VALUES ('Administrador');


INSERT INTO empleados
(codigo,nombres,apellidos,direccion,telefono,fecha_nacimiento,id_puesto)
VALUES('E002','Julio','Diaz','Chimaltenango','44444','1995/12/24',2)


#visualizando datos de una tabla
select * from empleados
select * from puestos
select * from clientes

#Actualizando datos de una tabla
UPDATE empleados set codigo = 'E002', nombres = 'Carlos', apellidos = 'Ramirez',telefono='2222' where id_empleado = 3  

#Eliminando datos de una tabla
DELETE FROM empleados where id_empleado = 3

#Consulta multiple
select e.id_empleado,e.codigo,e.nombres,e.apellidos,e.direccion,e.telefono,e.fecha_nacimiento,e.id_puesto from empleados as e 
inner join puestos as p on e.id_puesto = p.id_puesto