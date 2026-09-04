DROP DATABASE IF EXISTS bd_escolar_unidad2;
CREATE DATABASE bd_escolar_unidad2
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE bd_escolar_unidad2;

CREATE TABLE carreras (
    carrera_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_carrera VARCHAR(100) NOT NULL,
    clave_carrera VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE grupos (
    grupo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_grupo VARCHAR(20) NOT NULL,
    cuatrimestre INT NOT NULL,
    carrera_id INT NOT NULL,
    FOREIGN KEY (carrera_id) REFERENCES carreras(carrera_id)
);

CREATE TABLE periodos (
    periodo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_periodo VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

CREATE TABLE alumnos (
    alumno_id INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    primer_apellido VARCHAR(80) NOT NULL,
    segundo_apellido VARCHAR(80),
    curp VARCHAR(18) UNIQUE,
    fecha_nacimiento DATE,
    correo_institucional VARCHAR(120) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    domicilio VARCHAR(200),
    carrera_id INT NOT NULL,
    grupo_id INT NOT NULL,
    activo TINYINT DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (carrera_id) REFERENCES carreras(carrera_id),
    FOREIGN KEY (grupo_id) REFERENCES grupos(grupo_id)
);

CREATE TABLE docentes (
    docente_id INT AUTO_INCREMENT PRIMARY KEY,
    numero_empleado VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    primer_apellido VARCHAR(80) NOT NULL,
    segundo_apellido VARCHAR(80),
    correo_institucional VARCHAR(120) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    activo TINYINT DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE materias (
    materia_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_materia VARCHAR(100) NOT NULL,
    clave_materia VARCHAR(20) NOT NULL UNIQUE,
    carrera_id INT NOT NULL,
    docente_id INT,
    FOREIGN KEY (carrera_id) REFERENCES carreras(carrera_id),
    FOREIGN KEY (docente_id) REFERENCES docentes(docente_id)
);

CREATE TABLE inscripciones (
    inscripcion_id INT AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT NOT NULL,
    grupo_id INT NOT NULL,
    periodo_id INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    estado ENUM('Inscrito', 'Baja temporal', 'Baja definitiva', 'Egresado') DEFAULT 'Inscrito',
    FOREIGN KEY (alumno_id) REFERENCES alumnos(alumno_id),
    FOREIGN KEY (grupo_id) REFERENCES grupos(grupo_id),
    FOREIGN KEY (periodo_id) REFERENCES periodos(periodo_id)
);

CREATE TABLE calificaciones (
    calificacion_id INT AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT NOT NULL,
    materia_id INT NOT NULL,
    periodo_id INT NOT NULL,
    calificacion DECIMAL(5,2),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (alumno_id) REFERENCES alumnos(alumno_id),
    FOREIGN KEY (materia_id) REFERENCES materias(materia_id),
    FOREIGN KEY (periodo_id) REFERENCES periodos(periodo_id)
);