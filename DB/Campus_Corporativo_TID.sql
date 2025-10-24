-- =========================================
-- GRUPO 1
-- =========================================

CREATE DATABASE Campus_Corporativo_TID;

USE Campus_Corporativo_TID;

CREATE TABLE Colaboradores
(
idColaborador INT PRIMARY KEY,
Nombre Varchar (50) NOT NULL,
Apellido Varchar (50) NOT NULL,
Correo Varchar (100) NOT NULL,
Contraseña Varchar (20) NOT NULL,
Fecha_Registro DATE DEFAULT GETDATE()
);

-- =========================================
-- GRUPO 2
-- =========================================
create table Inscripcion
(
    id_Inscripcion int PRIMARY KEY IDENTITY,
    fecha_inscripcion DATE DEFAULT GETDATE(),
    idColaborador INT NOT NULL,
    FOREIGN KEY (idColaborador) REFERENCES Colaboradores(idColaborador),
);

-- =========================================
-- GRUPO 3
-- =========================================


CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY IDENTITY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150) NOT NULL

);

-- ===========================================================
-- TABLA: curso
-- ===========================================================
CREATE TABLE curso 
(
    id_curso INT PRIMARY KEY IDENTITY,
    nombre_curso VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    video_url VARCHAR(200) NOT NULL,
    imagen_url VARCHAR(200) NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    id_Inscripcion INT NOT NULL,
    FOREIGN KEY (id_Inscripcion) REFERENCES Inscripcion(id_Inscripcion)
    
);

-- ===========================================================
-- REGISTROS DE CATEGORÍAS
-- ===========================================================
INSERT INTO categoria (nombre_categoria, descripcion) VALUES
('Tecnología', 'Cursos sobre desarrollo, programación y sistemas'),
('Gestión', 'Cursos sobre liderazgo, administración y finanzas'),
('Innovación', 'Cursos sobre nuevas tecnologías y transformación digital');

-- ===========================================================
-- REGISTROS DE CURSOS
-- ===========================================================
INSERT INTO curso (nombre_curso, descripcion, video_url, imagen_url, id_categoria) VALUES
('Introducción a HTML', 'Aprende las bases del desarrollo web con HTML desde cero.', 'videos/html.mp4', 'img/html.png', 1),
('Diseño con CSS', 'Domina el diseño visual y la maquetación de sitios web modernos.', 'videos/css.mp4', 'img/css.png', 1),
('Gestión Empresarial', 'Desarrolla habilidades de liderazgo y dirección de equipos.', 'videos/gestion.mp4', 'img/gestion.png', 2),
('Planificación Estratégica', 'Aprende a definir y ejecutar estrategias empresariales efectivas.', 'videos/estrategia.mp4', 'img/estrategia.png', 2),
('Blockchain y Transformación Digital', 'Descubre cómo blockchain y la innovación digital transforman las empresas.', 'videos/blockchain.mp4', 'img/blockchain.png', 3),
('Creatividad e Innovación', 'Desarrolla el pensamiento creativo y la innovación en entornos empresariales.', 'videos/creatividad.mp4', 'img/creatividad.png', 3),
('Automatización con IA', 'Conoce las herramientas de inteligencia artificial aplicadas a procesos empresariales.', 'videos/ia.mp4', 'img/ia.png', 3);


-- =========================================
-- GRUPO 4
-- =========================================

-- Tabla curso
CREATE TABLE historial (
    id_historial INT IDENTITY PRIMARY KEY,
    cod_curso INT NOT NULL,
    idColaborador  INT NOT NULL,
    evaluaciones_completadas VARCHAR(10) NOT NULL,
    progreso VARCHAR(10) NOT NULL,
    fecha_ini DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    FOREIGN KEY (cod_curso) REFERENCES curso(id_curso),
    FOREIGN KEY (idColaborador) REFERENCES Colaboradores(idColaborador)
);
-- Tabla certificacion
CREATE TABLE certificacion (
    id_certificado INT IDENTITY PRIMARY KEY,
    cod_curso INT NOT NULL,
    usuario_fk INT NOT NULL,
    fecha_entrega DATE NOT NULL,
    FOREIGN KEY (cod_curso) REFERENCES curso(id_curso),
    FOREIGN KEY (usuario_fk) REFERENCES Colaboradores(idColaborador)
);

-- Tabla hoja de vida (hv)
CREATE TABLE hv (
    id_hv INT IDENTITY PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    educacion VARCHAR(60) NOT NULL,
    id_certificado INT NOT NULL,
    habilidades TEXT NOT NULL,
    exp_laboral TEXT NOT NULL,
    FOREIGN KEY (id_certificado) REFERENCES certificacion(id_certificado)
);


-- Colaboradores
INSERT INTO Colaboradores (Nombre, Apellido, Correo, Contraseña)
VALUES 
('Jhon', 'Angarita', 'jhon.angarita@sena.edu.co', '12345'),
('Laura', 'Pérez', 'laura.perez@sena.edu.co', 'laura123'),
('Carlos', 'Gómez', 'carlos.gomez@sena.edu.co', 'cgomez');

-- cursos
INSERT INTO curso (nombre_curso, descripcion, duracion)
VALUES
('Fundamentos de Programación', 'Introducción a la lógica y conceptos básicos de programación.', '4 semanas'),
('Desarrollo Web', 'Curso sobre HTML, CSS y JavaScript.', '6 semanas'),
('Base de Datos SQL', 'Manejo de bases de datos relacionales con SQL Server.', '5 semanas');

-- historial
INSERT INTO historial (cod_curso, usuario_fk, evaluaciones_completadas, progreso, fecha_ini, fecha_fin)
VALUES
(1, 1, '3/5', '60%', '2025-09-01', '2025-09-25'),
(2, 2, '5/5', '100%', '2025-08-10', '2025-09-15'),
(3, 3, '2/5', '40%', '2025-10-01', NULL);

-- certificados
INSERT INTO certificacion (cod_curso, usuario_fk, fecha_entrega)
VALUES
(2, 2, '2025-09-20'),
(1, 1, '2025-09-30'),
(3, 3, '2025-10-10');

-- Hoja de vida
INSERT INTO hv (nombre, apellidos, fecha_nacimiento, educacion, id_certificado, habilidades, exp_laboral)
VALUES
('Jhon', 'Angarita', '2007-05-12', 'Técnico en ADSO', 2, 'Java, SQL, Git', 'Prácticas en desarrollo de software'),
('Laura', 'Pérez', '2005-09-22', 'Tecnóloga en Sistemas', 1, 'HTML, CSS, JS', 'Desarrolladora freelance'),
('Carlos', 'Gómez', '2004-11-10', 'Ingeniero de Software', 3, 'C#, SQL Server, Python', 'Analista de datos');

-- =========================================
-- GRUPO 5
-- =========================================

CREATE TABLE notificaciones (
    id_notificacion INT PRIMARY KEY,
    mensajes varchar(200) not null,
    fecha DATETIME,
    idColaborador INT FOREIGN KEY REFERENCES Colaboradores(idColaborador));

CREATE TABLE mensajes_directos (
    id_mensaje INT PRIMARY KEY,
    id_receptor INT,
    mensaje TEXT,
    fecha DATETIME,
    idColaborador INT FOREIGN KEY REFERENCES Colaboradores(idColaborador));


