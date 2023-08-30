CREATE SCHEMA universidad;

use universidad;

-- CREACION DE TABLAS EN ESTE ORDEN
1-- TABLA 'CARRERAS'
2-- TABLA 'UBICACION'
3-- TABLA 'FACULTAD'
4-- TABLA 'PROFESORES'
5-- TABLA 'MATERIAS'
6-- TABLA 'COMISION'
7-- TABLA ' ESTUDIANTE'
8-- TABLA 'INSCRIPCION'




-- INSERCION DE DATOS EN ESTE ORDEN:
1-- TABLA 'CARRERAS'
2-- TABLA 'UBICACION'
3-- TABLA ' FACULTAD'
4-- TABLA 'PROFESORES'
5-- TABLA ' MATERIAS'
6-- TABLA ' COMISION'
7-- TABLA ' ESTUDIANTE'
8-- TABLA ' INSCRIPCION'






select * from carreras ;

-- primera tabla en crearse
-- cargar datos de esta tabla primero

CREATE TABLE `carreras` (
  `id_carreras` int ,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_carreras`)
  );
  
  
insert into carreras values (1,'abogacia');
insert into carreras values (2,'contador publico');
insert into carreras values (3,'relaciones laborales');
insert into carreras values (4,'ingeniero en sistemas');
insert into carreras values (5,'psicopedagoga');



select * from ubicacion;

-- segunda tabla en crearse
-- cargar datos de esta tabla en segundo lugar

CREATE TABLE `ubicacion` (
  `id_ubicacion` int ,
  `nombre` varchar(45),
  PRIMARY KEY (`id_ubicacion`)
  );
  
  
   
insert into ubicacion values (1,'lomas de zamora');
insert into ubicacion values (2,'zarate');
insert into ubicacion values (3,'alberti');
insert into ubicacion values (4,'quilmes');
insert into ubicacion values (5,'lanus');


select * from facultad;

-- crear esta tabla en tercer lugar
-- cargar datos de esta tabla en tercer lugar

CREATE TABLE `facultad` (
  `id_facultad` int ,
  `id_ubicacion` int ,
  `nombre` varchar(45) ,
  `email` varchar(45) ,
  PRIMARY KEY (`id_facultad`)
  );

  
  ALTER TABLE facultad ADD CONSTRAINT FOREIGN KEY
  (id_ubicacion) references ubicacion (id_ubicacion) ;
  
  
  
insert into facultad values (1,1,'lomas de zamora','facultad_lomas@gmail.com');
insert into facultad values (2,2,'zarate','facultad_zarate@gmail.com');
insert into facultad values (3,3,'alberti','facultad_alberti@gmail.com');
insert into facultad values (4,4,'quilmes','facultad_quilmes@gmail.com');
insert into facultad values (5,5,'lanus','facultad_lanus@gmail.com');



select * from profesores;

-- crear esta tabla en cuarto lugar
-- cargar datos de esta tabla en cuarto lugar

CREATE TABLE `profesores` (
  `id_profesores` int ,
  `id_facultad` int ,
  `id_materia` int ,
  `id_comision` int,
  `nombre` varchar(45) ,
  `titulo` varchar(45) ,
  PRIMARY KEY (`id_profesores`)
  );

ALTER TABLE profesores ADD CONSTRAINT FOREIGN KEY
   (id_facultad) references facultad (id_facultad),
   ADD CONSTRAINT FOREIGN KEY
   (id_materia) references materia (id_materia),
   ADD CONSTRAINT FOREIGN KEY
   (id_comision) references comision (id_comision);
  
  
insert into profesores values (101,1,null,null,'jorge lopez','abogado ');
insert into profesores values (102,2,null,null,'alberto perez','contador ');
insert into profesores values (103,3,null,null,'claudia sanchez','rrhh');
insert into profesores values (104,4,null,null,'natalia gonzales','ingeniera');
insert into profesores values (105,5,null,null,'claudio messi','psicologo');

select * from materia;

-- crear esta tabla en quinto lugar
-- cargar datos de esta tabla en quinto lugar 

CREATE TABLE `materia` (
  `id_materia` int ,
  `nombre` varchar(45),
  PRIMARY KEY (`id_materia`)
  );
    
insert into materia values (11,'derecho romano');
insert into materia values (22,'matematica1');
insert into materia values (33,'derechos humanos');
insert into materia values (44,'igenieria1');
insert into materia values (55,'psicologia1');



CREATE TABLE `comision` (
  `id_comision` int ,
  `numero` int,
  PRIMARY KEY (`id_comision`)
  );

-- crear esta tabla en sexto lugar
-- cargar datos de esta tabla en sexto lugar

insert into comision values (111,111);
insert into comision values (222,222);
insert into comision values (333,333);
insert into comision values (444,444);
insert into comision values (555,555);

select * from estudiante;

-- crear esta tabla en septimo lugar
-- cargar datos de esta tabla en septimo lugar
  alter table estudiante modify nota varchar (20)
  
  CREATE TABLE `estudiante` (
  `id_estudiante` int ,
  `id_comision` int ,
  `id_materia` int,
  `id_facultad` int,
  `nombre` varchar(45) ,
  `dni` varchar(45),
  `email` varchar(45),
materia varchar(45),
  nota int,
  PRIMARY KEY (`id_estudiante`)
  );
  
  
  ALTER TABLE estudiante ADD CONSTRAINT FOREIGN KEY
  (id_comision) references comision (id_comision),
  ADD CONSTRAINT FOREIGN KEY 
  (id_materia) references materia (id_materia),
  ADD CONSTRAINT FOREIGN KEY 
  (id_facultad) references facultad (id_facultad);
  
  
  
insert into estudiante values (40929871,111,11,1,'valentina',40929871,'valentina@gmail.com','derecho romano',4);
insert into estudiante values (40929872,222,22,2,'laureano',40929872,'laureano@gmail.com','matematica1',4);
insert into estudiante values (40929873,333,33,3,'guillermina',40929873,'guillermina@gmail.com','derechos humanos',2);
insert into estudiante values (40929874,444,44,4,'orlando',40929874,'orlando@gmail.com','ingenieria1',8);
insert into estudiante values (40929875,555,55,5,'alejandra',40929875,'alejandra@gmail.com','psicologia',1);


 select * from inscripcion;
 
 -- crear esta tabla en octavo lugar
 -- cargar datos de esta tabla en octavo lugar
 
CREATE TABLE `inscripcion` (
  `id_inscripcion` int ,
  `id_comision`int,
  `id_estudiante` int,
  `id_carrera` int ,
  `fecha` date ,
  `periodo` varchar(45),
  PRIMARY KEY (`id_inscripcion`)
  );
  
    ALTER TABLE inscripcion ADD CONSTRAINT FOREIGN KEY
  (id_comision) references comision (id_comision),
  ADD CONSTRAINT FOREIGN KEY 
  (id_estudiante) references estudiante (id_estudiante),
  ADD CONSTRAINT FOREIGN KEY 
  (id_carrera) references carreras (id_carreras);
  
 
insert into inscripcion values (1010,111,40929871,1,null,'1cte');
insert into inscripcion values (2020,222,40929872,2,null,'2cte');
insert into inscripcion values (3030,333,40929873,3,null,'1cte');
insert into inscripcion values (4040,444,40929874,4,null,'2cte');
insert into inscripcion values (5050,555,40929875,5,null,'1cte');





-- creacion de vistas




-- facultades




CREATE VIEW facultad_nombre AS 
SELECT * FROM facultad;




-- nombre y email de las facultades




CREATE VIEW facultades_NOMBRE_MAIL AS 
(SELECT nombre, email FROM facultad);





-- nombre estudiante



CREATE VIEW nombre_estudiante AS
(SELECT nombre FROM estudiante
	WHERE nombre like upper('%guillermina%')
);





-- creacion de funcion para insertar valores





DELIMITER //

CREATE FUNCTION insertar_inscripcion(
    inscripcion_id INT,
    comision_id INT,
    estudiante_id INT,
    carrera_id INT,
    inscripcion_fecha DATE,
    inscripcion_periodo VARCHAR(45)
)
RETURNS INT
DETERMINISTIC
BEGIN
    INSERT INTO inscripcion (
        id_inscripcion,
        id_comision,
        id_estudiante,
        id_carrera,
        fecha,
        periodo
    )
    VALUES (
        inscripcion_id,
        comision_id,
        estudiante_id,
        carrera_id,
        inscripcion_fecha,
        inscripcion_periodo
    );

    RETURN inscripcion_id;
END;
//

DELIMITER ;

SELECT insertar_inscripcion(1, 123, 456, 789, '2023-08-15', 'primer cuatrimestre');






-- store procedure de ordenamiento




DELIMITER $$
CREATE PROCEDURE `sp_nombres_estduiantes`(IN nombre CHAR(45),IN dni INT)
BEGIN
	IF nombre <> '' THEN
		SET @estudiante_order = concat('ORDER BY ', nombre);
	ELSEif nombre = '0'  THEN
		SET @estudiante_order = '';
	ELSEif dni = 0  THEN
    SET @estudiante_order = concat('WHERE dni = 40000');
	END if;
    
    SET @clausula = concat('SELECT * FROM estudiante ', @estudiante_order);
	PREPARE runSQL FROM @clausula;
	EXECUTE runSQL;
	DEALLOCATE PREPARE runSQL;
    
END
$$


CALL sp_nombres_estudiantes('nombre');






-- sp que traiga los nombres de los estudiantes





delimiter //
 create procedure sp_estudiantes_nombres()
 begin
   select nombre,dni
     from estudiante;
 end //
delimiter ;

call sp_estudiantes_nombres();




-- creacion de trigger inserscion de registros nota 'numerica'---



CREATE TABLE new_notas_estudiantes (
id_estudiante INT PRIMARY KEY,
materia varchar(45),
nota int
);

create trigger notas_estudiantes_numericas
before insert on estudiante
for each row
insert into new_notas_estudiantes (id_estudiante,materia,nota)
values (new.id_estudiante,new.materia,new.nota);

insert into estudiante values (41929122,null,null,null,'luciana',41929122,'luoiana@gmail.com','ingenieria1',4);





-- creacion de trigger donde dice si la nota del alumno es APROBADO O REPROBAD


DELIMITER $$
CREATE TRIGGER trigger_notas_estudiantes
BEFORE INSERT ON estudiante
FOR EACH ROW
BEGIN
  IF NEW.nota < 4 THEN
    set NEW.nota = 'desaprobado';
  ELSEIF NEW.nota > 4 THEN
    set NEW.nota = 'aprobado';
  END IF;
END$$


insert into estudiante values (41929122,null,null,null,'luciana',41929122,'luoiana@gmail.com','ingenieria1',4)
