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
  `FotoPerfl` BLOB(100) NULL,
  PRIMARY KEY (`idUsuario`));

select NombreUsuario , Contrasena from usuario where NombreUsuario = 'Wonder' and Contrasena = '1105me';