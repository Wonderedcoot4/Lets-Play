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

alter table imagenes2
modify column Dir mediumblob;

CREATE TABLE `prograwebdb`.`imagenes2` (
  `idimagenes2` INT NOT NULL,
  `Dir` longblob NULL,
  `imagenes2col` VARCHAR(45) NULL,
  PRIMARY KEY (`idimagenes2`));


select NombreUsuario , Contrasena from usuario where BINARY NombreUsuario = 'wonder' and Contrasena = '1105me';
select * from usuario;
select Nombre, NombreUsuario from usuario where  NombreUsuario = 'Wonder';

insert into usuario(FotoPerfl) values (load_file("C:\Users\isaac\Downloads\DSC_0264.JPG")) where NombreUsuario = 'Wonder';
select * from imagenes2;
insert into ya (img) values( LOAD_FILE('C:\\Programacion-Web\Imagenes\reach.jpg'));

INSERT INTO xx_BLOB(imagenesdemierda) VALUES(1,LOAD_FILE('C:\\Users\isaac\Downloads\DSC_0264.JPG'));

CREATE TABLE `prograwebdb`.`ya` (
  `idya` INT NOT NULL AUTO_INCREMENT,
  `img` MEDIUMBLOB NULL,
  PRIMARY KEY (`idya`));
