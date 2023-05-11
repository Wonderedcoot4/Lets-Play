create database PrograWebDB;
use PrograWebDB;

CREATE TABLE `PrograWebDB`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NULL,
  `ApellidoPaterno` VARCHAR(50) NULL,
  `ApellidoMaterno` VARCHAR(50) NULL,
  `Correo` VARCHAR(30) NULL,
  `Telefono` INT NULL,
  `NombreUsuario` VARCHAR(45) NULL,
  `Contrasena` VARCHAR(45) NULL,
  `FechaNacimiento` DATE NULL,
  `FotoPerfl` varchar(500) NULL,
  PRIMARY KEY (`idUsuario`));

SHOW TABLES; -- esto de aqui nos muestra las tablas en la db actualmente en uso --
-- a

CREATE TABLE `prograwebdb`.`estatuspublicacion` (
  `idEstatusPublicacion` INT NOT NULL AUTO_INCREMENT,
  `EstatusPublicacion` VARCHAR(45) NOT NULL DEFAULT 'Activo' COMMENT 'Activo, inactivo, desactivada, revision\n',
  PRIMARY KEY (`idEstatusPublicacion`))
COMMENT = 'Es tabla que se encargara de los estatus de las publicaciones';


CREATE TABLE `prograwebdb`.`categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(50) not null,
  PRIMARY KEY (`idCategoria`))
COMMENT = 'Categorias de las publicaciones\n';

CREATE TABLE `prograwebdb`.`publicacion` (
  `idPublicacion` INT NOT NULL AUTO_INCREMENT, 
  `Contenido` VARCHAR(500) NOT NULL,
  `IdEstatusPost` INT NOT NULL,
  `FechaCreacion` DATE NULL, -- CAMBIARLO A NULL DE MOMENTO PQ AUN NOTENEMOS DE DONDE AGARRAR LA FECHA MAS QUE POR DENTRO DE LA DB
  `Titulo` VARCHAR(55) NULL,
  `IdCategoria` INT NULL,
  `FotoPublicacion` varchar(500) null,
  `IdPublicador` varchar(500) null, 
  PRIMARY KEY (`idPublicacion`),
  INDEX `IdEstatusPublicacion_idx` (`IdEstatusPost` ASC) VISIBLE,
  INDEX `IdCategoria_idx` (`IdCategoria` ASC) VISIBLE,
  CONSTRAINT `IdEstatusPublicacion`
    FOREIGN KEY (`IdEstatusPost`)
    REFERENCES `prograwebdb`.`estatuspublicacion` (`idEstatusPublicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdCategoria`
    FOREIGN KEY (`IdCategoria`)
    REFERENCES `prograwebdb`.`categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
ALTER TABLE publicacion
modify column FechaCreacion date null;    
    
drop table categoria; 
select NombreUsuario , Contrasena from usuario where BINARY NombreUsuario = 'wonder' and Contrasena = '1105me';
select * from usuario;
select Nombre, NombreUsuario from usuario where  NombreUsuario = 'Wonder';

select Correo from usuario where Correo = 'Isaacpro553@gmail.com';

DELIMITER //
CREATE PROCEDURE `crearPost` (in Titulo varchar(50), in Contenido varchar(500), in EstatusPost varchar(50), in FechaCreacion date, in Categoria varchar(50))
BEGIN
  --  Declare IdCategoriaCreada int;
   Insert into categoria(Categoria) values (Categoria);
   set @IdCategoriaCreada = LAST_INSERT_ID();
   INSERT INTO estatuspublicacion(EstatusPublicacion) values (EstatusPost);
    set @IdEstatus = LAST_INSERT_ID();
   INSERT INTO publicacion(Titulo, Contenido, FechaCreacion,IdCategoria, IdEstatusPost) values (Titulo, Contenido, FechaCreacion, @IdCategoriaCreada, @IdEstatus);
END //

CALL crearPost('Prueba','Texto','Activo','10/12/23','Accion');
DELIMITER ;

select C.Categoria, p.Contenido, p.FechaCreacion, p.Titulo from publicacion p join Categoria C
on C.idCategoria = p.IdCategoria ;

DELIMITER //
CREATE PROCEDURE `crearPostSencillo` (in Titulo varchar(50), in Contenido varchar(500), in EstatusPost varchar(50), in Categoria varchar(50))
BEGIN 
  --  Declare IdCategoriaCreada int;
   Insert into categoria(Categoria) values (Categoria);
   set @IdCategoriaCreada = LAST_INSERT_ID();
   INSERT INTO estatuspublicacion(EstatusPublicacion) values (EstatusPost);
    set @IdEstatus = LAST_INSERT_ID();
   INSERT INTO publicacion(Titulo, Contenido,IdCategoria, IdEstatusPost) values (Titulo, Contenido, @IdCategoriaCreada, @IdEstatus);
END //
select NombreUsuario, Contenido, idUsuario, IdPublicador, Nombre from publicacion
join usuario
on idPublicador = usuario.idUsuario
select * from EstatusPublicacion -- Ver si cambio esto para que sea solo 3 estados y no 300000 activos mismo caso para categoria
select * from usuario
select idUsuario from usuario where NombreUsuario = 'Wonder'
CALL crearPost('Prueba','Texto','Activo','10/12/23','Accion');
DELIMITER ;


select * from publicacion
DELIMITER //
CREATE PROCEDURE `creacionPostSinUsuario` (in Titulo varchar(50), in Contenido varchar(500), in EstatusPost varchar(50), in Categoria varchar(50), in Foto varchar(500))
BEGIN 
  --  Declare IdCategoriaCreada int;
   -- Declare @idUsuarioPosteador int;
 
   Insert into categoria(Categoria) values (Categoria);
   set @IdCategoriaCreada = LAST_INSERT_ID();
   INSERT INTO estatuspublicacion(EstatusPublicacion) values (EstatusPost);
    set @IdEstatus = LAST_INSERT_ID();
   INSERT INTO publicacion(Titulo, Contenido,IdCategoria, IdEstatusPost,FotoPublicacion) values (Titulo, Contenido, @IdCategoriaCreada, @IdEstatus, Foto);
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE `creacionPost` (in Titulo varchar(50), in Contenido varchar(500), in EstatusPost varchar(50), in Categoria varchar(50), in Foto varchar(500), in UserName varchar(100))
BEGIN 
  --  Declare IdCategoriaCreada int;
   -- Declare @idUsuarioPosteador int;
   set @idUsuarioPosteador = (select idUsuario from usuario where NombreUsuario = UserName);
   Insert into categoria(Categoria) values (Categoria);
   set @IdCategoriaCreada = LAST_INSERT_ID();
   INSERT INTO estatuspublicacion(EstatusPublicacion) values (EstatusPost);
    set @IdEstatus = LAST_INSERT_ID();
   INSERT INTO publicacion(Titulo, Contenido,IdCategoria, IdEstatusPost,FotoPublicacion,IdPublicador) values (Titulo, Contenido, @IdCategoriaCreada, @IdEstatus, Foto, @idUsuarioPosteador);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `LoginUsuario` (in Usuario varchar(50), in Contraseña varchar(50))
BEGIN 
	Select NombreUsuario, Contrasena, idUsuario, FotoPerfl, Correo, Nombre, Telefono, FechaNacimiento, ApellidoPaterno, ApellidoMaterno, Contrasena from usuario
    where binary NombreUsuario = usuario and binary Contrasena = Contraseña;
	
END //
DELIMITER ;

Select * from publicacion 
-- join pertinentes para los estatus y asi
limit 0, 5;

-- si son 2 parametros, con el primero le digo a partir de que registro busque y que a partir de ahi cuantos busque

Select * from publicacion 
limit 0, 5;

select count(*) as Total from publicacion

drop procedure LoginUsuario;
CALL creacionPost('Aja','Pipipi','Activo','Accion', 'C:\Users\isaac\Desktop\Programacion Web 1\Programacion-Web\NetBeans\PrograWeb1-PIA\src\main\webapp\Imagenes\makeitmeme_5YHaI.jpeg', 'Wonder');
CALL LoginUsuario('Arlender21', 'Wondered9');