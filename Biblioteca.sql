CREATE DATABASE BIBLIOTECA;
USE BIBLIOTECA;

--- Crear tabla tipo de usuarios: usuario normal, bibliotecario, administrador, etc.
CREATE TABLE TipoUsuario(
    idTipoUsuario int identity (1,1) NOT NULL,
    nombreTipo varchar(20) NOT NULL,
    PRIMARY KEY (idTipoUsuario)

);

-- Insertar datos en la tabla TipoUsuario: estudiantes, profesores, investigadores, público en general
INSERT INTO TipoUsuario(nombreTipo) VALUES ('Administrador');
INSERT INTO TipoUsuario(nombreTipo) VALUES ('Bibliotecario')
INSERT INTO TipoUsuario(nombreTipo) VALUES ('Profesor');
INSERT INTO TipoUsuario(nombreTipo) VALUES ('Investigador');
INSERT INTO TipoUsuario(nombreTipo) VALUES ('Público general');


-- Crear tabla Nacionalidad: Guatemala, Mexico, El Salvador, Colombia, necesario para
CREATE TABLE Nacionalidad(
    idNacionalidad int identity(1,1) NOT NULL,
    pais varchar(100) unique,
    primary key (idNacionalidad)
);


-- Insertar nacionalidades en la tabla Nacionalidad
INSERT INTO Nacionalidad (pais) VALUES ('Guatemala');
INSERT INTO Nacionalidad (pais) VALUES ('México'); 
INSERT INTO Nacionalidad (pais) VALUES ('El Salvador');
INSERT INTO Nacionalidad (pais) VALUES ('Colombia');
INSERT INTO Nacionalidad (pais) VALUES ('Alemania');  
INSERT INTO Nacionalidad (pais) VALUES ('Países Bajos');
INSERT INTO Nacionalidad (pais) VALUES ('Estados Unidos'); 
INSERT INTO Nacionalidad (pais) VALUES ('Canadá'); 
INSERT INTO Nacionalidad (pais) VALUES ('Argentina');
INSERT INTO Nacionalidad (pais) VALUES ('Brasil'); 
INSERT INTO Nacionalidad (pais) VALUES ('Chile');
INSERT INTO Nacionalidad (pais) VALUES ('Perú'); 
INSERT INTO Nacionalidad (pais) VALUES ('Venezuela');
INSERT INTO Nacionalidad (pais) VALUES ('España');
INSERT INTO Nacionalidad (pais) VALUES ('Francia');
INSERT INTO Nacionalidad (pais) VALUES ('Italia');
INSERT INTO Nacionalidad (pais) VALUES ('Inglaterra'); 
INSERT INTO Nacionalidad (pais) VALUES ('Australia');
INSERT INTO Nacionalidad (pais) VALUES ('Japón'); 
INSERT INTO Nacionalidad (pais) VALUES ('China');
INSERT INTO Nacionalidad (pais) VALUES ('India');
INSERT INTO Nacionalidad (pais) VALUES ('Grecia');
INSERT INTO Nacionalidad (pais) VALUES ('Rusia');

INSERT INTO Nacionalidad (pais) VALUES ('Corea del Sur'); 
INSERT INTO Nacionalidad (pais) VALUES ('Sudáfrica'); 
INSERT INTO Nacionalidad (pais) VALUES ('Egipto');
INSERT INTO Nacionalidad (pais) VALUES ('Suiza'); 
INSERT INTO Nacionalidad (pais) VALUES ('Suecia'); 
INSERT INTO Nacionalidad (pais) VALUES ('Noruega'); 
INSERT INTO Nacionalidad (pais) VALUES ('Finlandia'); 
INSERT INTO Nacionalidad (pais) VALUES ('Filipinas'); 
INSERT INTO Nacionalidad (pais) VALUES ('Nueva Zelanda'); 
INSERT INTO Nacionalidad (pais) VALUES ('Arabia Saudita'); 
INSERT INTO Nacionalidad (pais) VALUES ('Turquía'); 
INSERT INTO Nacionalidad (pais) VALUES ('Pakistán'); 
INSERT INTO Nacionalidad (pais) VALUES ('Bangladés'); 
INSERT INTO Nacionalidad (pais) VALUES ('Nigeria'); 
INSERT INTO Nacionalidad (pais) VALUES ('Indonesia'); 

-- Crear tabla Miembros
CREATE TABLE Miembro(
    idMiembro INT identity(1,1) NOT NULL,
    nombres varchar(50) NOT NULL,
    apellidos varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    direccion varchar(255) NOT NULL UNIQUE,
    fechaMembresia date NOT NULL,
    telefono varchar(20) NOT NULL,
    contrasena varchar(256) NOT NULL,
    idTipoUsuario INT NOT NULL,
    recomendacionesLectura INT DEFAULT 1 CHECK (recomendacionesLectura IN (0,1)),
    alertarNuevosMateriales INT DEFAULT 1 CHECK (alertarNuevosMateriales IN (0,1)), 
    idNacionalidad INT NOT NULL,
    fechaNacimiemto DATE NOT NULL,
    PRIMARY KEY (idMiembro),
    FOREIGN KEY (idNacionalidad) REFERENCES Nacionalidad(idNacionalidad)
);

select * from Miembro;

INSERT INTO Miembro(nombres,apellidos,email,direccion,fechaMembresia,telefono,contrasena,idTipoUsuario,recomendacionesLectura,alertarNuevosMateriales,idNacionalidad,fechaNacimiemto)
VALUES('Santos','Lopez','santos.lopez@galileo.edu','2 calle a 4-47 Barcelona, España','2024-05-06 10:00:00','24403002','AbCdER.1000',1,1,1,1,'1993-10-11');
INSERT INTO Miembro(nombres,apellidos,email,direccion,fechaMembresia,telefono,contrasena,idTipoUsuario,recomendacionesLectura,alertarNuevosMateriales,idNacionalidad,fechaNacimiemto)
VALUES('Jimena','Barillas','jimenabarillas@gmail.com','12 calle 11-11 México','2024-05-06 11:00:00','24404040','RbTV.ET4530',2,1,1,1,'1990-05-15');
INSERT INTO Miembro(nombres,apellidos,email,direccion,fechaMembresia,telefono,contrasena,idTipoUsuario,recomendacionesLectura,alertarNuevosMateriales,idNacionalidad,fechaNacimiemto)
VALUES('Natalia','Alvarez','nataliaalvarez@gmail.com','1era calle zona 10, calle Universidad Galileo','2024-06-06 14:40:00','353404040','PlRT.ET5430',3,0,1,2,'1980-10-10');
INSERT INTO Miembro(nombres,apellidos,email,direccion,fechaMembresia,telefono,contrasena,idTipoUsuario,recomendacionesLectura,alertarNuevosMateriales,idNacionalidad,fechaNacimiemto)
VALUES('Pedro','Alberto','pedroalberto@gmail.com','10 calle zona 8, avenida ABC ciudad de México','2024-06-08 14:40:00','335675543','Pd37Id.ET98320',4,0,0,3,'1997-07-07');
INSERT INTO Miembro(nombres,apellidos,email,direccion,fechaMembresia,telefono,contrasena,idTipoUsuario,recomendacionesLectura,alertarNuevosMateriales,idNacionalidad,fechaNacimiemto)
VALUES('Adam','rodriguez','adam@gmail.com','5ta avenida 8-88 zona 9 avenida la reforma','2024-06-09 14:40:00','40403434','PdtR12O3fI0',5,1,0,4,'1990-03-03');
INSERT INTO Miembro(nombres,apellidos,email,direccion,fechaMembresia,telefono,contrasena,idTipoUsuario,recomendacionesLectura,alertarNuevosMateriales,idNacionalidad,fechaNacimiemto)
VALUES('Athena','Flores','athenaflores@hotmail.com','3era calle avenida flores 3-21 zona 10','2024-06-10 18:44:44','40345533','Pr.3Kd3lE2',5,1,1,5,'1998-06-20');


-- filtrar el usuario por tipo de usuario
select nombres,apellidos,email,direccion,fechaMembresia,telefono,pais from Miembro 
inner join Nacionalidad on Miembro.idNacionalidad=Nacionalidad.idNacionalidad
WHERE idTipoUsuario=1;



-- tabla que almacena si son libros, revistas, películas, otros
CREATE TABLE TipoMaterial(
    idTipoMaterial int identity(1,1) NOT NULL,
    nombreTipoMaterial varchar(50) NOT NULL,
    PRIMARY KEY (idTipoMaterial)
);

INSERT INTO TipoMaterial(nombreTipoMaterial) VALUES ('Libro');
INSERT INTO TipoMaterial(nombreTipoMaterial) VALUES ('Revista');
INSERT INTO TipoMaterial(nombreTipoMaterial) VALUES ('Documental');


select * from TipoMaterial;


-- Tabla GeneroMaterial: almacena el genero del tipo de material, ejemplo el libro es aventura, la revista es de moda, etc
CREATE TABLE GeneroMaterial(
    idGeneroMaterial int identity(1,1) NOT NULL,
    nombreGenero varchar(50) NOT NULL,
    PRIMARY KEY (idGeneroMaterial)
);


INSERT INTO GeneroMaterial(nombreGenero) VALUES ('Moda');
INSERT INTO GeneroMaterial(nombreGenero) VALUES ('No ficción');
INSERT INTO GeneroMaterial(nombreGenero) VALUES ('Ficción');
INSERT INTO GeneroMaterial(nombreGenero) VALUES ('Aventura');
INSERT INTO GeneroMaterial(nombreGenero) VALUES ('Clásico');
INSERT INTO GeneroMaterial(nombreGenero) VALUES ('Infantil');
INSERT INTO GeneroMaterial(nombreGenero) VALUES ('Fantasía');
INSERT INTO GeneroMaterial(nombreGenero) VALUES ('Otros');




-- mostrar todos los generos de materiales disponibles en la tabla
select * from GeneroMaterial;


-- Crea la tabla Autor: estos datos se usan para los libros
CREATE TABLE Autor(
    codigoAutor int identity(1,1) NOT NULL,
    nombre varchar(100) NOT NULL,
    apellidos varchar(100) NOT NULL,
    idNacionalidad int NOT NULL,
    biografia varchar(512) NOT NULL,
    primary key (codigoAutor),
    foreign key (idNacionalidad) references Nacionalidad(idNacionalidad)
);


-- Insertar autores en la tabla Autor
INSERT INTO Autor(nombre,apellidos,idNacionalidad,biografia) VALUES('Ana','Frank',5,'Fue una niña alemana judía víctima del holocausto. ')
INSERT INTO Autor(nombre,apellidos,idNacionalidad,biografia) VALUES('Victor', 'Hugo',15,'Victor Hugo fue un poeta, novelista y dramaturgo romántico francés.');
INSERT INTO Autor(nombre,apellidos,idNacionalidad,biografia) VALUES('Homero','',22,'Homero es el nombre dado al autor de los poemas épicos griegos La Ilíada y La Odisea.');
INSERT INTO Autor(nombre,apellidos,idNacionalidad,biografia) VALUES('Antoine','de Saint-Exupéry',15,'Antoine de Saint-Exupéry fue un escritor y aviador francés, autor de El Principito.');
INSERT INTO Autor(nombre,apellidos,idNacionalidad,biografia) VALUES('Juan','Muñoz Martín',14,'Juan Muñoz Martín es un escritor español conocido por la serie de libros infantiles Pirata Garrapata.');
INSERT INTO Autor(nombre,apellidos,idNacionalidad,biografia) VALUES('Gabriel','García Márquez',4,'Gabriel García Márquez fue un escritor, novelista y periodista colombiano, premio Nobel de Literatura.');
INSERT INTO Autor(nombre,apellidos,idNacionalidad,biografia) VALUES('J.K.', 'Rowling',17,'J.K. Rowling es una escritora británica, conocida por ser la autora de la serie de libros de Harry Potter.');
INSERT INTO Autor(nombre,apellidos,idNacionalidad,biografia) VALUES('Miguel','de Cervantes',14,'Miguel de Cervantes fue un novelista, poeta y dramaturgo español, autor de Don Quijote de la Mancha.');
INSERT INTO Autor(nombre,apellidos,idNacionalidad,biografia) VALUES('Orson Scott','Card',7,'Orson Scott Card es un escritor estadounidense de ciencia ficción y fantasía, conocido por su novela El juego de Ender.');
INSERT INTO Autor(nombre,apellidos,idNacionalidad,biografia) VALUES ('Julio','Cortázar',9,'Julio Cortázar fue un escritor y traductor argentino, uno de los autores más innovadores y originales de su tiempo.');
INSERT INTO Autor(nombre,apellidos,idNacionalidad,biografia) VALUES('Fiódor','Dostoievski',23,'Fiódor Dostoievski fue un novelista y filósofo ruso, uno de los más importantes de la literatura universal.');
INSERT INTO Autor(nombre,apellidos,idNacionalidad,biografia) VALUES('Santos','Lopez',5,'Estudiante de Postgrado de base de datos.');
INSERT INTO Autor(nombre,apellidos,idNacionalidad,biografia) VALUES('Ines','Alarcon',5,'Estudiante de Administración de Operaciones.');


select * from autor;

CREATE TABLE Material(
    idMaterial int identity(1,1) NOT NULL,
    isbn VARCHAR(50) NOT NULL,
    titulo varchar(255) NOT NULL,
    edicion varchar(100) NOT NULL,
    codigoAutor int NOT NULL, 
    idGeneroMaterial int NOT NULL, 
    idTipoMaterial INT NOT NULL,
    primary key (idMaterial),
    foreign key (idGeneroMaterial) references GeneroMaterial(idGeneroMaterial),
    foreign key (idTipoMaterial) REFERENCES TipoMaterial(idTipoMaterial),
    foreign key (codigoAutor) REFERENCES Autor(codigoAutor)
);


-- Insertar materiales (Libros, Revistas, Películas) con relaciones a TipoMaterial y Autor

select * from TipoMaterial;

-- Insertar un libro
INSERT INTO Material (isbn,titulo,edicion,codigoAutor,idGeneroMaterial,idTipoMaterial)
VALUES ('978-3-16-148410-0', 'El Alquimista', '1ª Edición',1,1,1); 

-- Insertar una revista
INSERT INTO Material (isbn, titulo, edicion, codigoAutor, idGeneroMaterial, idTipoMaterial)
VALUES ('978-0-15-1000-1', 'Revista de Tecnología', 'Vol. 1, No. 1', 2, 2, 2);  -- Revista, Autor 2, Género: Ciencia Ficción

-- Insertar una película
INSERT INTO Material (isbn, titulo, edicion, codigoAutor, idGeneroMaterial, idTipoMaterial)
VALUES ('N/A', 'La Guerra de las Galaxias', 'Edición Especial', 3, 4, 3);  -- Película, Autor 3, Género: Drama

-- Insertar otro libro
INSERT INTO Material (isbn, titulo, edicion, codigoAutor, idGeneroMaterial, idTipoMaterial)
VALUES ('978-0-7432-7356-5', 'El Código Da Vinci', '2ª Edición', 4, 1, 1);  -- Libro, Autor 4, Género: Ficción

-- Insertar otra revista
INSERT INTO Material (isbn, titulo, edicion, codigoAutor, idGeneroMaterial, idTipoMaterial)
VALUES ('978-1-43-0210-0', 'Revista de Arte', 'Vol. 5, No. 4', 5, 3, 2);  -- Revista, Autor 5, Género: No Ficción

-- Insertar una película más
INSERT INTO Material (isbn, titulo, edicion, codigoAutor, idGeneroMaterial, idTipoMaterial)
VALUES ('N/A', 'Jurassic Park', 'Edición de Coleccionista', 6, 4, 3);  -- Película, Autor 6, Género: Drama

-- Insertar otro libro
INSERT INTO Material (isbn, titulo, edicion, codigoAutor, idGeneroMaterial, idTipoMaterial)
VALUES ('978-0-452-28423-4', '1984', '1ª Edición', 7, 1, 1);  -- Libro, Autor 7, Género: Ficción

-- Insertar una revista más
INSERT INTO Material (isbn, titulo, edicion, codigoAutor, idGeneroMaterial, idTipoMaterial)
VALUES ('978-0-14-312875-4', 'National Geographic', 'Vol. 20, No. 10', 8, 3, 2);  -- Revista, Autor 8, Género: No Ficción


select * from Autor;

-- mostrar isbn,titulo,edicion,genero, nombre y apellido del autor
select isbn,titulo,edicion,nombreGenero AS Genero,nombre AS "Nombre autor",apellidos AS "Apellidos autor" FROM Material 
INNER JOIN GeneroMaterial ON Material.idGeneroMaterial=GeneroMaterial.idGeneroMaterial
INNER JOIN Autor ON Material.codigoAutor=Autor.codigoAutor;





-- mostrar isbn,titulo,edicion,genero, nombre y apellido del autor con el pais
select isbn,titulo,edicion,nombreGenero AS Genero,nombre AS "Nombre autor",apellidos AS "Apellidos autor",pais FROM Material 
INNER JOIN GeneroMaterial ON Material.idGeneroMaterial=GeneroMaterial.idGeneroMaterial
INNER JOIN Autor ON Material.codigoAutor=Autor.codigoAutor
INNER JOIN Nacionalidad ON Autor.idNacionalidad=Nacionalidad.idNacionalidad;

-- count por tipo de genero
select count(*),nombreGenero FROM Material INNER JOIN GeneroMaterial ON Material.idGeneroMaterial=GeneroMaterial.idGeneroMaterial
INNER JOIN Autor ON Material.codigoAutor=Autor.codigoAutor
INNER JOIN Nacionalidad ON Autor.idNacionalidad=Nacionalidad.idNacionalidad GROUP BY nombreGenero;


-- seleccionar todos los autores
select * from Autor;

-- seleccionar autores con su pais y biografia
select nombre,apellidos,pais,biografia from AUTOR 
INNER JOIN Nacionalidad ON Autor.idNacionalidad=Nacionalidad.idNacionalidad;

-- mostrar por pais cuantos autores hay
select count(*) AS cantidad,pais from AUTOR 
INNER JOIN Nacionalidad ON Autor.idNacionalidad=Nacionalidad.idNacionalidad GROUP BY pais;








-- Insertar libros en la tabla Libros
INSERT INTO Libros(isbn,titulo,edicion,codigoAutor,idGeneroLibro) VALUES('ISBN-10: 8497593062','El diario de Ana Frank','En español',1,1);
INSERT INTO Libros(isbn, titulo, edicion, codigoAutor, idGeneroLibro) VALUES('ISBN-13: 978-8434851234', 'Un pirata en la India', 'Edición especial',4, 4);
INSERT INTO Libros(isbn, titulo, edicion, codigoAutor, idGeneroLibro) VALUES('ISBN-13: 978-0156012195', 'El Principito', 'Edición de lujo',3, 4);
INSERT INTO Libros(isbn, titulo, edicion, codigoAutor, idGeneroLibro) VALUES('ISBN-13: 978-0140449112', 'La Ilíada y la Odisea', 'Edición crítica',2, 3);
INSERT INTO Libros(isbn, titulo, edicion, codigoAutor, idGeneroLibro) VALUES('ISBN-13: 978-0451419439', 'Los Miserables', 'Edición conmemorativa',5, 3);
INSERT INTO Libros(isbn,titulo,edicion,codigoAutor,idGeneroLibro) VALUES('ISBN-13: 978-8497593067','Crimen y castigo','Edición de bolsillo',12,2);
INSERT INTO Libros(isbn,titulo,edicion,codigoAutor,idGeneroLibro) VALUES('ISBN-13: 978-8478884456','Harry Potter y la piedra filosofal', 'Edición especial',8,6);
INSERT INTO Libros(isbn,titulo,edicion,codigoAutor,idGeneroLibro) VALUES('ISBN-13: 978-8420412146','Don Quijote de la Mancha', 'Edición conmemorativa',9,4);
INSERT INTO Libros(isbn,titulo,edicion,codigoAutor,idGeneroLibro) VALUES('ISBN-13: 978-8498724240','El juego de Ender','Edición de colección',10,2);
INSERT INTO Libros(isbn,titulo,edicion,codigoAutor,idGeneroLibro) VALUES('ISBN-13: 972-8594724260','La historia de Santos','Edición de colección',12,7);
INSERT INTO Libros(isbn,titulo,edicion,codigoAutor,idGeneroLibro) VALUES('ISBN-13: 765-9544724260','Libro escritor por Ines','Edición personal',13,8);

-- mostrar libros registrados;
select * from libros;

