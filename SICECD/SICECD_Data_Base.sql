/*
Creación de usuario y base de datos
*/
CREATE USER "SICECD" WITH
	LOGIN
	NOSUPERUSER
	NOCREATEDB
	NOCREATEROLE
	INHERIT
	NOREPLICATION
	CONNECTION LIMIT -1
	PASSWORD '5Fda!vc%fsPZ0@';

CREATE DATABASE "SICECD"
    WITH 
    OWNER = "SICECD"
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    CONNECTION LIMIT = -1;

/*
Borrado de tablas
*/
DROP TABLE IF EXISTS Log_sys CASCADE;
DROP TABLE IF EXISTS Log_evento_sys CASCADE;
DROP TABLE IF EXISTS Usuario_sys CASCADE;
DROP TABLE IF EXISTS Estatus_usuario_sys CASCADE;
DROP TABLE IF EXISTS Perfil_sys CASCADE;
DROP TABLE IF EXISTS Grado_profesor CASCADE;
DROP TABLE IF EXISTS Turno CASCADE;
DROP TABLE IF EXISTS Genero CASCADE;
DROP TABLE IF EXISTS Estado CASCADE;
DROP TABLE IF EXISTS Inscripcion CASCADE;
DROP TABLE IF EXISTS Grupo CASCADE;
DROP TABLE IF EXISTS Curso CASCADE;
DROP TABLE IF EXISTS Profesor CASCADE;
DROP TABLE IF EXISTS Tipo_curso CASCADE;
DROP TABLE IF EXISTS url_ws CASCADE;
DROP TABLE IF EXISTS url_ws_curso CASCADE;
DROP TABLE IF EXISTS url_ws_inscripcion CASCADE;
DROP TABLE IF EXISTS url_ws_profesor CASCADE;
DROP TABLE IF EXISTS certificado CASCADE;
DROP TABLE IF EXISTS curso_grupos CASCADE;
DROP TABLE IF EXISTS estado_profesores CASCADE;
DROP TABLE IF EXISTS grupo_inscripciones CASCADE;
DROP TABLE IF EXISTS test_class CASCADE;

/*
Llenado de tablas catalogo
*/
INSERT INTO public.perfil_sys(nombre) VALUES ('Administrador');
INSERT INTO public.perfil_sys(nombre) VALUES ('Consultas');

INSERT INTO public.estatus_usuario_sys(nombre) VALUES ('Activo');
INSERT INTO public.estatus_usuario_sys(nombre) VALUES ('Inactivo');

INSERT INTO public.tipo_curso(nombre) VALUES ('Curso');
INSERT INTO public.tipo_curso(nombre) VALUES ('Diplomado');
INSERT INTO public.tipo_curso(nombre) VALUES ('Especialidad');
insert into public.tipo_curso(nombre) values('Maestria');
insert into public.tipo_curso(nombre) values('Doctorado');

INSERT INTO public.turno(nombre) VALUES ('Matutino');
INSERT INTO public.turno(nombre) VALUES ('Vepertino');
INSERT INTO public.turno(nombre) VALUES ('Completo');
INSERT INTO public.turno(nombre) VALUES('Sin definir');

INSERT INTO public.grado_profesor(nombre) VALUES ('Lic.');
INSERT INTO public.grado_profesor(nombre) VALUES ('Esp.');
INSERT INTO public.grado_profesor(nombre) VALUES ('Mtr.');
INSERT INTO public.grado_profesor(nombre) VALUES ('Doc.');
INSERT INTO public.grado_profesor(nombre) VALUES ('Sin definir');

INSERT INTO public.genero(genero) VALUES ('Masculino');
INSERT INTO public.genero(genero) VALUES ('Femenino');
INSERT INTO public.genero(genero) VALUES('Sin definir');

INSERT INTO public.estado(nombre) VALUES ('Aguascalientes');
INSERT INTO public.estado(nombre) VALUES ('Baja California');
INSERT INTO public.estado(nombre) VALUES ('Baja California Sur');
INSERT INTO public.estado(nombre) VALUES ('Campeche');
INSERT INTO public.estado(nombre) VALUES ('Ciudad de México');
INSERT INTO public.estado(nombre) VALUES ('Coahuila');
INSERT INTO public.estado(nombre) VALUES ('Colima');
INSERT INTO public.estado(nombre) VALUES ('Chiapas');
INSERT INTO public.estado(nombre) VALUES ('Chihuahua');
INSERT INTO public.estado(nombre) VALUES ('Durango');
INSERT INTO public.estado(nombre) VALUES ('Estado de México');
INSERT INTO public.estado(nombre) VALUES ('Guanajuato');
INSERT INTO public.estado(nombre) VALUES ('Guerrero');
INSERT INTO public.estado(nombre) VALUES ('Hidalgo');
INSERT INTO public.estado(nombre) VALUES ('Jalisco');
INSERT INTO public.estado(nombre) VALUES ('Michoacán');
INSERT INTO public.estado(nombre) VALUES ('Morelos');
INSERT INTO public.estado(nombre) VALUES ('Nayarit');
INSERT INTO public.estado(nombre) VALUES ('Nuevo León');
INSERT INTO public.estado(nombre) VALUES ('Oaxaca');
INSERT INTO public.estado(nombre) VALUES ('Puebla');
INSERT INTO public.estado(nombre) VALUES ('Querétaro');
INSERT INTO public.estado(nombre) VALUES ('Quintana Roo');
INSERT INTO public.estado(nombre) VALUES ('San Luis Potosí');
INSERT INTO public.estado(nombre) VALUES ('Sinaloa');
INSERT INTO public.estado(nombre) VALUES ('Sonora');
INSERT INTO public.estado(nombre) VALUES ('Tabasco');
INSERT INTO public.estado(nombre) VALUES ('Tamaulipas');
INSERT INTO public.estado(nombre) VALUES ('Tlaxcala');
INSERT INTO public.estado(nombre) VALUES ('Veracruz');
INSERT INTO public.estado(nombre) VALUES ('Yucatán');
INSERT INTO public.estado(nombre) VALUES ('Zacatecas');
INSERT INTO public.estado(nombre) VALUES ('Sin definir');
COMMIT;

INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('WLIN00', 'Login exitoso');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('WLIN01', 'Login fallido');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('WLOT00', 'Logout');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('ECNU00', 'Consulta a WS de constancias (nuevas, nunca antes traidas)');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('ECAC00', 'Consulta a WS de constancias (actualiza)');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('REPR00', 'Registrar un participante');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('REPR01', 'Registrar un asesor');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('RECU00', 'Registrar un curso');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('REGR00', 'Registrar un grupo');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('REIN00', 'Registrar un inscripción');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('MOPR00', 'Modificar un participante');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('MOPR01', 'Modificar un asesor');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('MOCU00', 'Modificar un curso');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('MOGR00', 'Modificar un grupo');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('MOIN00', 'Modificar una inscripción');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('CNPR00', 'Consultar profesores');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('CNIN00', 'Consultar inscripciones');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('CNCU00', 'Consultar cursos');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('CNGR00', 'Consultar grupos');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('EXPR00', 'Exportar una consulta de profesores');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('EXIN00', 'Exportar una consulta de inscripciones');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('EXCU00', 'Exportar una consulta de cursos');
INSERT INTO Log_evento_sys (pk_id_log_evento_sys, nombre) VALUES ('EXGR00', 'Exportar una consulta de grupos');
COMMIT;

/*
Datos de prueba
*/
INSERT INTO public.usuario_sys(rfc, password, correo, nombre,  apellido_paterno, apellido_materno, confirmacion, codigo, confirmacioncorreo,codigo_correo,correocambio,codigorecupera, confirmarecupera, fk_id_estatus_usuario_sys, fk_id_perfil_sys) 
VALUES ('AAAA801201SN9', '$2a$10$.PYYPU6zW9cN/lLRbiM3VePaDcKNjfp4tNMcCPJ3/G51dlg9N8jhG', 'francisco3122151@gmail.com','franki', 'mcs', 'panki', 'false',123,'false',789,'',101,'false',1, 1);--123456789
COMMIT;

INSERT INTO public.usuario_sys(rfc, nombre, apellido_paterno, password, correo, fk_id_estatus_usuario_sys, fk_id_perfil_sys)
VALUES ('BBBB801201SN9', 'Usuario', 'Root', '$2a$10$8n2o/aSS96.kisZBBMzdM.BwOryAWdFwFlsjIWFvIkObYJ8Na/2O2', 'benitez@unam.mx', 1, 2);--1234567890
COMMIT;

INSERT INTO public.profesor(nombre, apellido_paterno, apellido_materno, rfc, correo, fk_id_estado, id_genero, fk_id_turno, fk_id_grado_profesor) VALUES ('Raul', 'Lopez', 'Diaz', 'LODR800505MMM', 'raul@unam.mx', 1, 1, 1, 1);
INSERT INTO public.profesor(nombre, apellido_paterno, apellido_materno, rfc, correo, fk_id_estado, id_genero, fk_id_turno, fk_id_grado_profesor) VALUES ('Maria', 'Martinez', 'Ordaz', 'MAOM800505MMM', 'maria@unam.mx', 1, 1, 1, 1);
INSERT INTO public.profesor(nombre, apellido_paterno, apellido_materno, rfc, correo, fk_id_estado, id_genero, fk_id_turno, fk_id_grado_profesor) VALUES ('Irma', 'Villa', 'Salinas', 'VISI800505MMM', 'irma@unam.mx', 1, 1, 1, 1);
INSERT INTO public.profesor(nombre, apellido_paterno, apellido_materno, rfc, correo, fk_id_estado, id_genero, fk_id_turno, fk_id_grado_profesor) VALUES ('Gerardo', 'Gutierrez', 'Pliego', 'GUPG800505MMM', 'gerardo@unam.mx', 1, 1, 1, 1);
COMMIT;

INSERT INTO public.curso(clave, nombre, fk_id_tipo_curso, horas) VALUES ('A001', 'Biologia 1', 1, 40);
INSERT INTO public.curso(clave, nombre, fk_id_tipo_curso, horas) VALUES ('A002', 'Biologia 2', 1, 40);
INSERT INTO public.curso(clave, nombre, fk_id_tipo_curso, horas) VALUES ('A003', 'Biologia 3', 1, 40);
INSERT INTO public.curso(clave, nombre, fk_id_tipo_curso, horas) VALUES ('A004', 'Biologia 4', 1, 40);
INSERT INTO public.curso(clave, nombre, fk_id_tipo_curso, horas) VALUES ('B001', 'Matematicas 1', 1, 40);
INSERT INTO public.curso(clave, nombre, fk_id_tipo_curso, horas) VALUES ('B002', 'Matematicas 2', 1, 40);
INSERT INTO public.curso(clave, nombre, fk_id_tipo_curso, horas) VALUES ('B003', 'Matematicas 3', 1, 40);
COMMIT;

INSERT INTO public.grupo(fk_id_curso, clave, fecha_inicio, fecha_fin, fk_id_profesor) VALUES (1, '001', TIMESTAMP '2019-01-05 00:00:00', TIMESTAMP '2019-05-05 00:00:00', 1);
INSERT INTO public.grupo(fk_id_curso, clave, fecha_inicio, fecha_fin, fk_id_profesor) VALUES (1, '002', TIMESTAMP '2019-01-05 00:00:00', TIMESTAMP '2019-05-05 00:00:00', 2);
INSERT INTO public.grupo(fk_id_curso, clave, fecha_inicio, fecha_fin, fk_id_profesor) VALUES (5, '001', TIMESTAMP '2019-01-05 00:00:00', TIMESTAMP '2019-05-05 00:00:00', 3);
COMMIT;

INSERT INTO public.inscripcion(aprobado, calif, fk_id_grupo, fk_id_profesor) VALUES (true, 6, 1, 1);
INSERT INTO public.inscripcion(aprobado, calif, fk_id_grupo, fk_id_profesor) VALUES (true, 9, 1, 2);
INSERT INTO public.inscripcion(aprobado, calif, fk_id_grupo, fk_id_profesor) VALUES (false, 5, 2, 3);
INSERT INTO public.inscripcion(aprobado, calif, fk_id_grupo, fk_id_profesor) VALUES (true, 9, 1, 4);
COMMIT;



INSERT INTO public.profesor (nombre, apellido_paterno, apellido_materno, rfc, correo, fk_id_estado, id_genero, fk_id_turno, fk_id_grado_profesor) VALUES ('Lourdes', 'Diaz', 'Diaz', 'LBDI800505MMM', 'matyap59@hotmail.com', 1, 1, 1, 1);
INSERT INTO public.profesor (nombre, apellido_paterno, apellido_materno, rfc, correo, fk_id_estado, id_genero, fk_id_turno, fk_id_grado_profesor) VALUES ('Maria', 'Diaz', 'Diaz', 'MBDI800505MMM', 'mahalymf@hotmail.com', 1, 1, 1, 1);
INSERT INTO public.profesor (nombre, apellido_paterno, apellido_materno, rfc, correo, fk_id_estado, id_genero, fk_id_turno, fk_id_grado_profesor) VALUES ('Ramiro', 'Diaz', 'Diaz', 'RBDI800505MMM', 'murcielagoblue@yahoo.com.mx', 1, 1, 1, 1);
INSERT INTO public.grupo(fk_id_curso, clave, fecha_inicio, fecha_fin) VALUES (8, '003', TIMESTAMP '2019-01-05 00:00:00', TIMESTAMP '2019-05-05 00:00:00');
INSERT INTO public.inscripcion(fk_id_grupo, fk_id_profesor) VALUES (4, 6);
INSERT INTO public.inscripcion(fk_id_grupo, fk_id_profesor) VALUES (4, 7);
INSERT INTO public.inscripcion(fk_id_grupo, fk_id_profesor) VALUES (4, 8);
COMMIT;

/*
Cambio de propietario
*/
ALTER TABLE public.curso OWNER to "SICECD";
ALTER TABLE public.estado OWNER to "SICECD";
ALTER TABLE public.estatus_usuario_sys OWNER to "SICECD";
ALTER TABLE public.genero OWNER to "SICECD";
ALTER TABLE public.grado_profesor OWNER to "SICECD";
ALTER TABLE public.grupo OWNER to "SICECD";
ALTER TABLE public.inscripcion OWNER to "SICECD";
ALTER TABLE public.log_evento_sys OWNER to "SICECD";
ALTER TABLE public.log_sys OWNER to "SICECD";
ALTER TABLE public.perfil_sys OWNER to "SICECD";
ALTER TABLE public.profesor OWNER to "SICECD";
ALTER TABLE public.tipo_curso OWNER to "SICECD";
ALTER TABLE public.turno OWNER to "SICECD";
ALTER TABLE public.usuario_sys OWNER to "SICECD";
ALTER TABLE Url_ws OWNER to "SICECD";
