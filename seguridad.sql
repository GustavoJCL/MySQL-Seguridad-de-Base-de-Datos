#Diseñar una base datos:
#Sobre cualquier tema

#A General Hospital consists of a number of specialized wards (such as Maternity, Pediatric,
#Oncology, etc). Each ward hosts a number of patients, who were admitted on the recommendation of
#their own GP and confirmed by a consultant employed by the Hospital. On admission, the personal
#details of every patient are recorded. A separate register is to be held to store the information
#of the tests undertaken and the results of a prescribed treatment. A number of tests may be
#conducted for each patient. Each patient is assigned to one leading consultant but may be examined
#by another doctor, if required. Doctors are specialists in some branch of medicine and may be
#leading consultants for a number of patients, not necessarily from the same ward. 

CREATE DATABASE IF NOT EXISTS practicabd;
USE practicabd;
DROP TABLE IF EXISTS paciente;
CREATE TABLE paciente(
     id_paciente INT AUTO_INCREMENT,
     nombre VARCHAR(30),
     apellido VARCHAR(30),
     DNI VARCHAR(8),
     telefono VARCHAR(9),
PRIMARY KEY(id_paciente));

INSERT INTO paciente(id_paciente, nombre, apellido, DNI, telefono) VALUES (1, 'nombre1', 'apellido1', '23441945', '123456789');
INSERT INTO paciente(id_paciente, nombre, apellido, DNI, telefono) VALUES (2, 'nombre1', 'apellido1', '23441945', '123456789');
INSERT INTO paciente(id_paciente, nombre, apellido, DNI, telefono) VALUES (3, 'nombre1', 'apellido1', '23441945', '123456789');

DROP TABLE IF EXISTS registro;
CREATE TABLE registro(
     id_registro INT AUTO_INCREMENT,
     nombre VARCHAR(30),
     fecha DATE,
     hora TIME,
     resultado varchar(200),
     id_sala INT,
     id_medico INT,
     id_paciente INT,
PRIMARY KEY(id_registro));

INSERT INTO registro(id_registro, nombre, fecha, hora, resultado, id_sala, id_medico, id_paciente) VALUES (1, 'nombre1', '2018-04-29', '10:23:12', 'resultado1', 1, 2, 3);
INSERT INTO registro(id_registro, nombre, fecha, hora, resultado, id_sala, id_medico, id_paciente) VALUES (2, 'nombre1', '2018-04-29', '10:23:12', 'resultado1', 2, 3, 2);
INSERT INTO registro(id_registro, nombre, fecha, hora, resultado, id_sala, id_medico, id_paciente) VALUES (3, 'nombre1', '2018-04-29', '10:23:12', 'resultado1', 1, 1, 2);
DROP TABLE IF EXISTS sala;
CREATE TABLE sala(
     id_sala INT AUTO_INCREMENT,
     nombre VARCHAR(20),
     ubicacion VARCHAR(30),
PRIMARY KEY(id_sala));

INSERT INTO sala(id_sala, nombre, ubicacion) VALUES (1, 'nombre', 'ubicacion');
INSERT INTO sala(id_sala, nombre, ubicacion) VALUES (2, 'nombre', 'ubicacion');
INSERT INTO sala(id_sala, nombre, ubicacion) VALUES (3, 'nombre', 'ubicacion');

DROP TABLE IF EXISTS medico;
CREATE TABLE medico(
     id_medico INT AUTO_INCREMENT,
     nombre VARCHAR(30),
     apellido VARCHAR(30),
     DNI VARCHAR(30),
     especialidad VARCHAR(30),

PRIMARY KEY(id_medico));

INSERT INTO medico(id_medico, nombre, apellido, DNI, especialidad) VALUES (1, 'nombre', 'apellido', '123345678', 'especialidad1');
INSERT INTO medico(id_medico, nombre, apellido, DNI, especialidad) VALUES (2, 'nombre', 'apellido', '123345678', 'especialidad2');
INSERT INTO medico(id_medico, nombre, apellido, DNI, especialidad) VALUES (3, 'nombre', 'apellido', '123345678', 'especialidad3');

#• Implementar los métodos de seguridad
#• Creación de cuenta: control del acceso
DROP USER IF EXISTS 'usuario1'@'localhost';
CREATE USER 'usuario1'@'localhost' IDENTIFIED BY 'arco linux';
DROP USER IF EXISTS 'archLinux'@'localhost';
CREATE USER 'archLinux'@'localhost' IDENTIFIED BY 'arch linux';

#Concesión y revocación de privilegios (control discrecional): En usuarios y tablas, vistas
GRANT UPDATE ON practicabd.registro TO 'usuario1'@'localhost';
GRANT SELECT ON practicabd.registro TO 'usuario1'@'localhost';

GRANT INSERT ON practicabd.paciente TO 'archLinux'@'localhost';
GRANT SELECT ON practicabd.sala TO 'archLinux'@'localhost';

SELECT USER FROM mysql.user;
SHOW GRANTS;

REVOKE INSERT ON practicabd.paciente FROM 'archLinux'@'localhost';
REVOKE UPDATE ON practicabd.registro FROM 'usuario1'@'localhost';

#Asignación del nivel de seguridad (control obligatorio): Crear al menos 2 roles
DROP ROLE 'consultar', 'actualizar';
CREATE ROLE  'actualizar', 'consultar';

GRANT UPDATE ON practicabd.* TO 'actualizar';
GRANT SELECT ON practicabd.* TO 'consultar'



