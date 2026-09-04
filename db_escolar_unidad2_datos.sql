USE bd_escolar_unidad2;

INSERT INTO carreras (nombre_carrera, clave_carrera) VALUES
('Ingeniería en Tecnologías de la Información', 'ITI'),
('Licenciatura en Administración', 'LAD'),
('Ingeniería en Manufactura', 'IMA');

INSERT INTO grupos (nombre_grupo, cuatrimestre, carrera_id) VALUES
('ITI-3A', 3, 1),
('ITI-4A', 4, 1),
('LAD-2B', 2, 2),
('IMA-5A', 5, 3);

INSERT INTO periodos (nombre_periodo, fecha_inicio, fecha_fin) VALUES
('Enero-Abril 2026', '2026-01-08', '2026-04-25'),
('Mayo-Agosto 2026', '2026-05-06', '2026-08-22');

INSERT INTO alumnos (
    matricula, nombre, primer_apellido, segundo_apellido, curp,
    fecha_nacimiento, correo_institucional, telefono, domicilio,
    carrera_id, grupo_id
) VALUES
('2403150001', 'Ana', 'López', 'Martínez', 'LOMA060315MDGPRNA1', '2006-03-15', 'ana.lopez@universidad.edu.mx', '6181234567', 'Col. Centro, Durango', 1, 1),
('2403150002', 'Carlos', 'Ramírez', 'Soto', 'RASC060721HDGMTRB2', '2006-07-21', 'carlos.ramirez@universidad.edu.mx', '6187654321', 'Fracc. Real del Mezquital, Durango', 1, 1),
('2403150003', 'María', 'Torres', 'Núñez', 'TONM051112MDGRXR03', '2005-11-12', 'maria.torres@universidad.edu.mx', '6185552211', 'Col. Jardines, Durango', 2, 3),
('2403150004', 'Jorge', 'Hernández', 'Pérez', 'HEPJ050508HDGRRR04', '2005-05-08', 'jorge.hernandez@universidad.edu.mx', '6187778899', 'Col. Guadalupe, Durango', 3, 4);

INSERT INTO docentes (
    numero_empleado, nombre, primer_apellido, segundo_apellido,
    correo_institucional, telefono
) VALUES
('D001', 'Laura', 'García', 'Medina', 'laura.garcia@universidad.edu.mx', '6181112233'),
('D002', 'Miguel', 'Flores', 'Reyes', 'miguel.flores@universidad.edu.mx', '6182223344'),
('D003', 'Patricia', 'Vargas', 'Luna', 'patricia.vargas@universidad.edu.mx', '6183334455');

INSERT INTO materias (nombre_materia, clave_materia, carrera_id, docente_id) VALUES
('Base de Datos', 'BD-301', 1, 1),
('Protección de Datos', 'PD-401', 1, 2),
('Administración General', 'ADM-201', 2, 3),
('Procesos de Manufactura', 'MAN-501', 3, 1);

INSERT INTO inscripciones (alumno_id, grupo_id, periodo_id, fecha_inscripcion, estado) VALUES
(1, 1, 1, '2026-01-08', 'Inscrito'),
(2, 1, 1, '2026-01-08', 'Inscrito'),
(3, 3, 1, '2026-01-09', 'Inscrito'),
(4, 4, 1, '2026-01-10', 'Inscrito');

INSERT INTO calificaciones (alumno_id, materia_id, periodo_id, calificacion) VALUES
(1, 1, 1, 92.50),
(1, 2, 1, 88.00),
(2, 1, 1, 79.00),
(2, 2, 1, 85.50),
(3, 3, 1, 91.00),
(4, 4, 1, 87.50);