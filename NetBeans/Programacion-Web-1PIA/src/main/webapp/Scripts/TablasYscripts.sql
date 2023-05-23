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
    
insert into categoria(Categoria) values ('Plataformas');
insert into categoria(Categoria) values ('Lucha');
insert into categoria(Categoria) values ('AccionyAventura');
insert into categoria(Categoria) values ('Clasicos');
insert into categoria(Categoria) values ('Carreras');
insert into categoria(Categoria) values ('Disparos');
insert into categoria(Categoria) values ('Independientes');
insert into categoria(Categoria) values ('Familiares');
insert into estatuspublicacion(EstatusPublicacion) values ('Activo');
insert into estatuspublicacion(EstatusPublicacion) values ('Inactivo');
insert into categoria(Categoria) values ('Clasicos');

select * from categoria   ;
select * from estatuspublicacion   ;

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
CREATE PROCEDURE `creacionPost`(in Titulo varchar(50), in Contenido varchar(500), in EstatusPost varchar(50), in cat varchar(50), in Foto varchar(500), in UserName varchar(100), in Fecha varchar(100))
BEGIN 
  --  Declare IdCategoriaCreada int;
   -- Declare @idUsuarioPosteador int;
   set @idUsuarioPosteador = (select idUsuario from usuario where NombreUsuario = UserName);
   set @idCategoria = (select idCategoria FROM categoria where cat = Categoria);
   set @idEstatus = (select idEstatusPublicacion FROM estatuspublicacion where EstatusPublicacion = EstatusPost);
   
   
   
   INSERT INTO publicacion(Titulo, Contenido,IdCategoria, IdEstatusPost,FotoPublicacion,IdPublicador, FechaCreacion) values (Titulo, Contenido, @idCategoria, @idEstatus, Foto, @idUsuarioPosteador, Fecha);
END //
DELIMITER ;
-- as es para cambiarle el nombre a las columnas en consultas
DELIMITER //
CREATE PROCEDURE `consultaPostRecientes`()
BEGIN 
	Select pub.idPublicacion, pub.Contenido, pub.FechaCreacion, pub.Titulo, pub.FotoPublicacion, pub.IdPublicador, pub.idEstatusPost, us.NombreUsuario, cat.idCategoria, cat.Categoria, est.EstatusPublicacion, pub.FechaCreacion as FechaPublicacion from publicacion pub
    join estatuspublicacion est
    on est.idEstatusPublicacion = pub.idEstatusPost
    join categoria cat
    on cat.idCategoria = pub.idCategoria
    join usuario us
    on us.idUsuario = pub.IdPublicador
    where est.EstatusPublicacion = 'Activo'
    order by pub.idPublicacion DESC LIMIT 0,10;
    
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `consultaPostRecientesIndex`( in indice int, in LimitPost int)
BEGIN 
	Select pub.idPublicacion, pub.Contenido, pub.FechaCreacion, pub.Titulo, pub.FotoPublicacion, pub.IdPublicador, pub.idEstatusPost, us.NombreUsuario, cat.idCategoria, cat.Categoria, est.EstatusPublicacion, pub.FechaCreacion as FechaPublicacion from publicacion pub
    join estatuspublicacion est
    on est.idEstatusPublicacion = pub.idEstatusPost
    join categoria cat
    on cat.idCategoria = pub.idCategoria
    join usuario us
    on us.idUsuario = pub.IdPublicador
    where est.EstatusPublicacion = 'Activo'
    order by pub.idPublicacion DESC LIMIT indice,LimitPost;
    
END //
DELIMITER ;





drop procedure consultaPostRecientesIndex

 select idEstatusPublicacion FROM estatuspublicacion where EstatusPublicacion = 'Activo'
 select idCategoria FROM categoria where Categoria = 'Lucha'

DELIMITER //
CREATE PROCEDURE `LoginUsuario` (in Usuario varchar(50), in Contraseña varchar(50))
BEGIN 
	Select NombreUsuario, Contrasena, idUsuario, FotoPerfl, Correo, Nombre, Telefono, FechaNacimiento, ApellidoPaterno, ApellidoMaterno from usuario
    where binary NombreUsuario = usuario and binary Contrasena = Contraseña;
	
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `UpdateUsuario` (in Usuario varchar(50), in Contraseña varchar(50), in Email varchar(50), in FechaNaci date, in NombreP varchar(100), in apP varchar(100), in apM varchar(100), in idUser int)
BEGIN 
	-- pasale el puto pero id --kevin
	-- le paso el correo aqui, luego con eso hago un select y busco el id de donde este guardado ese correo y con ese di hago todo el update
	Update usuario set Nombre = NombreP, ApellidoPaterno = apP, ApellidoMaterno = apM, Correo = Email, NombreUsuario = Usuario, Contrasena = Contraseña, FechaNacimiento = FechaNaci
    where idUsuario = idUser;
	
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `UpdateUsuarioFoto` (in Foto varchar(500), in idUser int)
BEGIN 
	
	Update usuario set FotoPerfl = Foto
    where idUsuario = idUser;
	
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `ConsultaPublicacionesUsuario` (in Usuario varchar(500))
BEGIN 
	
    Select pub.idPublicacion, pub.Contenido, pub.FechaCreacion, pub.Titulo, pub.FotoPublicacion, pub.IdPublicador, pub.idEstatusPost, us.NombreUsuario, cat.idCategoria, cat.Categoria, est.EstatusPublicacion, pub.FechaCreacion as FechaPublicacion from publicacion pub
    join estatuspublicacion est
    on est.idEstatusPublicacion = pub.idEstatusPost
    join categoria cat
    on cat.idCategoria = pub.idCategoria
    join usuario us
    on us.idUsuario = pub.IdPublicador
    where us.NombreUsuario = Usuario
    order by pub.idPublicacion DESC LIMIT 0,10;
	
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `ActualizarPublicacion` (in TituloPublicacion varchar(500), in ContenidoPost varchar(500), in CategoriaPost varchar(100), in idPost int)
BEGIN 
	set @idCategoria = (select idCategoria from categoria where Categoria = CategoriaPost); 
	Update publicacion set Titulo = TituloPublicacion, Contenido = ContenidoPost, IdCategoria = @idCategoria, idEstatusPost = 1
	where idPublicacion =idPost;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `BorrarrPublicacion` (in idPost int)
BEGIN 
	update publicacion set idEstatusPost = 2
    where idPublicacion = idPost;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `consultarTotalPublicaciones` ()
BEGIN 
	
 select count(idPublicacion) as Total from publicacion;
	
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `busquedaPublicacion` (in PARAMDEBUSQUEDA varchar(250))
BEGIN 
		SELECT pub.idPublicacion, pub.Contenido, pub.IdEstatusPost,est.EstatusPublicacion, pub.FechaCreacion, pub.Titulo, pub.IdCategoria, pub.FotoPublicacion, pub.IdPublicador, us.FotoPerfl, us.NombreUsuario, cat.Categoria
        from publicacion pub
        join categoria cat
        on cat.idCategoria = pub.IdCategoria
        join estatuspublicacion est 
        on est.idEstatusPublicacion = pub.IdEstatusPost
        join usuario us
        on us.idUsuario = pub.IdPublicador
        where est.EstatusPublicacion = 'Activo' and (Contenido LIKE CONCAT('%',PARAMDEBUSQUEDA, '%') OR Titulo LIKE CONCAT('%',PARAMDEBUSQUEDA, '%'));
		
	
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `categoriaPublicacion` (in PARAMDEBUSQUEDA varchar(250))
BEGIN 
        set @idCat = (Select idCategoria from categoria where Categoria =PARAMDEBUSQUEDA);
		SELECT pub.idPublicacion, pub.Contenido, pub.IdEstatusPost,est.EstatusPublicacion, pub.FechaCreacion, pub.Titulo, pub.IdCategoria, pub.FotoPublicacion, pub.IdPublicador, us.FotoPerfl, us.NombreUsuario,  cat.Categoria
        from publicacion pub
        join categoria cat
        on cat.idCategoria = pub.IdCategoria
        join estatuspublicacion est 
        on est.idEstatusPublicacion = pub.IdEstatusPost
        join usuario us
        on us.idUsuario = pub.IdPublicador
        where cat.idCategoria = @idCat;
		
	
END //
DELIMITER ;


delimiter //
create procedure sp_BusquedaAvanzada(IN p_titulo varchar(50),
    IN p_texto varchar(250), IN p_categoria bigint, IN p_fechain date, IN p_fechafin date)
begin
	IF(p_fechain IS NULL AND p_fechafin IS NOT NULL) THEN
	SELECT publicacion.idPublicacion, publicacion.Titulo, publicacion.Contenido,
            publicacion.FechaCreacion, publicacion.FotoPublicacion, publicacion.IdEstatusPost,
            usuario.NombreUsuario, categoria.Categoria
            FROM publicacion INNER JOIN categoria ON categoria.idCategoria=publicacion.IdCategoria
            INNER JOIN usuario ON usuario.idUsuario=publicacion.IdPublicador  WHERE publicacion.IdEstatusPost=1 AND (publicacion.Contenido LIKE CONCAT('%',IFNULL(p_texto,publicacion.Contenido),'%') OR publicacion.Titulo LIKE CONCAT('%', IFNULL(p_texto,publicacion.Titulo),'%')) AND publicacion.FechaCreacion<=p_fechafin AND publicacion.IdCategoria=ifnull(p_categoria, publicacion.IdCategoria) ORDER BY publicacion.FechaCreacion DESC;
            END IF;
            IF(p_fechafin IS NULL AND p_fechain IS NOT NULL) THEN
	SELECT publicacion.idPublicacion, publicacion.Titulo, publicacion.Contenido,
            publicacion.FechaCreacion, publicacion.FotoPublicacion, publicacion.IdEstatusPost,
            usuario.NombreUsuario, categoria.Categoria
            FROM publicacion INNER JOIN categoria ON categoria.idCategoria=publicacion.IdCategoria
            INNER JOIN usuario ON usuario.idUsuario=publicacion.IdPublicador  WHERE publicacion.IdEstatusPost=1 AND (publicacion.Contenido LIKE CONCAT('%',IFNULL(p_texto,publicacion.Contenido),'%') OR publicacion.Titulo LIKE CONCAT('%', IFNULL(p_texto,publicacion.Titulo),'%')) AND publicacion.FechaCreacion>=p_fechain AND publicacion.IdCategoria=ifnull(p_categoria, publicacion.IdCategoria) ORDER BY publicacion.FechaCreacion DESC;
            END IF;
            IF(p_fechain IS NULL AND p_fechafin is NULL) THEN
	SELECT publicacion.idPublicacion, publicacion.Titulo, publicacion.Contenido,
            publicacion.FechaCreacion, publicacion.FotoPublicacion, publicacion.IdEstatusPost,
            usuario.NombreUsuario, categoria.Categoria
            FROM publicacion INNER JOIN categoria ON categoria.idCategoria=publicacion.IdCategoria
            INNER JOIN usuario ON usuario.idUsuario=publicacion.IdPublicador  WHERE publicacion.IdEstatusPost=1 AND (publicacion.Contenido LIKE CONCAT('%',IFNULL(p_texto,publicacion.Contenido),'%') OR publicacion.Titulo LIKE CONCAT('%', IFNULL(p_texto,publicacion.Titulo),'%')) AND publicacion.IdCategoria=ifnull(p_categoria, publicacion.IdCategoria) ORDER BY publicacion.FechaCreacion DESC;
            END IF;
            IF(p_fechain IS NOT NULL AND p_fechafin IS NOT NULL) THEN
	SELECT publicacion.idPublicacion, publicacion.Titulo, publicacion.Contenido,
            publicacion.FechaCreacion, publicacion.FotoPublicacion, publicacion.IdEstatusPost,
            usuario.NombreUsuario, categoria.Categoria
            FROM publicacion INNER JOIN categoria ON categoria.idCategoria=publicacion.IdCategoria
            INNER JOIN usuario ON usuario.idUsuario=publicacion.IdPublicador  WHERE publicacion.IdEstatusPost=1 AND (publicacion.Contenido LIKE CONCAT('%',IFNULL(p_texto,publicacion.Contenido),'%') OR publicacion.Titulo LIKE CONCAT('%', IFNULL(p_texto,publicacion.Titulo),'%')) AND publicacion.FechaCreacion>=p_fechain AND publicacion.FechaCreacion<=p_fechafin AND publicacion.IdCategoria=ifnull(p_categoria, publicacion.IdCategoria) ORDER BY publicacion.FechaCreacion DESC;
		end if;
END//
DELIMITER ;

call busquedaPublicacion('kevin');

call ConsultaPublicacionesUsuario('Wonder');
call consultaPostRecientesIndex(0, 10);

select count(idPublicacion) as Total from publicacion;



Select * from publicacion;
Select * from estatuspublicacion;
Select * from categoria;
Select * from usuario 
-- join pertinentes para los estatus y asi
limit 0, 5;

-- si son 2 parametros, con el primero le digo a partir de que registro busque y que a partir de ahi cuantos busque

Select * from estatuspublicacion 
limit 0, 5;

select count(*) as Total from publicacion;

update publicacion set IdCategoria = 2 where idPublicacion =6 ;

drop procedure categoriaPublicacion;
CALL creacionPost('Aja','Pipipi','Activo','AccionyAventura', 'C:\Users\isaac\Desktop\Programacion Web 1\Programacion-Web\NetBeans\PrograWeb1-PIA\src\main\webapp\Imagenes\makeitmeme_5YHaI.jpeg', 'Wonder', '2023-05-12');
CALL LoginUsuario('Wonder', '1234');
CALL consultarTotalPublicaciones;
CALL categoriaPublicacion('Lucha');
CALL sp_BusquedaAvanzada('', '', 3, '2023-05-21', '2023-05-23');
  --  IN p_texto varchar(250), IN p_categoria bigint, IN p_fechain date, IN p_fechafin date)

