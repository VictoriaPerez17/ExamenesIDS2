create database VDFK_Examenes

use VDFK_Examenes

CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY identity(1,1),
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    es_profesor bit NOT NULL
);


CREATE TABLE examenes (
    examen_id INT PRIMARY KEY identity(1,1),
    nombre_examen VARCHAR(100) NOT NULL,
    max_preguntas INT DEFAULT 20
);


CREATE TABLE preguntas (
    pregunta_id INT PRIMARY KEY identity(1,1),
    examen_id INT,
    enunciado TEXT NOT NULL,
    FOREIGN KEY (examen_id) REFERENCES examenes(examen_id)
);


CREATE TABLE respuestas (
    respuesta_id INT PRIMARY KEY identity(1,1),
    usuario_id INT,
    pregunta_id INT,
    respuesta TEXT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (pregunta_id) REFERENCES preguntas(pregunta_id)
);

CREATE TABLE login (
    login_id INT PRIMARY KEY identity(1,1),
    usuario_id INT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);