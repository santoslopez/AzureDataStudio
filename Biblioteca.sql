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


