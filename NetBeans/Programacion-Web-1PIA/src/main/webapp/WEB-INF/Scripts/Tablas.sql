create database Prueba;
use Prueba;

CREATE TABLE `prueba`.`usuario` (
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

alter table usuario
modify column Telefono varchar(20);

#el date funciona con un formato de año, mes y dia 
select * from usuario where NombreUsuario= 'Edson' and Contraseña = '1234';

insert into usuario(Nombre, ApellidoPaterno, ApellidoMaterno, Correo, Telefono, NombreUsuario,Contrasena,FechaNacimiento)
values('ee Eduardo','Arguello','Tienda','TaPeln@gmail.com','8184714186','Nacth','1105me','2000-02-12');



INSERT into usuario(NombreUsuario, Contraseña) values ("Edson","1234");