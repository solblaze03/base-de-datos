CREATE DATABASE IF NOT EXISTS examen_ev2;

USE examen_ev2;

CREATE TABLE IF NOT EXISTS RESPUESTA (
    IdRespuesta VARCHAR(5) PRIMARY KEY,
    Respuesta VARCHAR(1024)
);

CREATE TABLE IF NOT EXISTS PREGUNTA (
    IdPregunta INT AUTO_INCREMENT PRIMARY KEY,
    Enunciado VARCHAR(1024),
    IdRespuesta VARCHAR(5),
    FOREIGN KEY (IdRespuesta) REFERENCES RESPUESTA(IdRespuesta)
);

INSERT INTO PREGUNTA (Enunciado) VALUES
('Una base de datos es…'),
('El Lenguaje de manipulación de datos permite:'),
('¿Qué representa el puerto de escucha en el modelo cliente-servidor?'),
('Cuando hablamos de integridad de los datos nos referimos a…'),
('¿Cuál de los siguientes sistemas de gestión de bases de datos es software libre?'),
('¿Qué es SQL?'),
('¿Por qué es interesante que el DBMS se encuentre en un servidor?'),
('¿Qué juego de instrucciones de SQL se utiliza para insertar, borrar, modificar y consultar datos?'),
('¿Qué es una base de datos relacional?'),
('¿Cuál de los siguientes elementos no conforma la estructura de datos en una base de datos relacional?'),
('¿Cuál es una característica de los DBMS?'),
('¿Qué ventaja tiene una base de datos relacional?'),
('Expón al menos tres argumentos para convencer a un directivo de una empresa, de la conveniencia de que su empresa, que utiliza desde hace años un sistema de ficheros, cambie su enfoque hacia una base de datos.'),
('¿Qué quiere decir que un sistema de bases de datos permita concurrencia?'),
('¿En qué consiste la función de seguridad (autenticación, encriptación, control de acceso…) de un SGBD?'),
('Explica los roles del cliente y del servidor en realación a un DBMS que siga el modelo cliente-servidor.');

INSERT INTO RESPUESTA (IdRespuesta, Respuesta) VALUES
('1.a', 'un conjunto de datos estructurados que pertenecen a un mismo contexto y pueden estar relacionados entre sí.'),
('1.b', 'una aplicación software que permite interactuar con los datos, con tareas como la definición, creación, mantenimiento y control de acceso a los datos.'),
('1.c', 'un entorno para la programación de consultas SQL.'),
('1.d', 'un sistema de almacenamiento de datos que permite realizar consultas de forma eficiente.'),
('2.a', 'Definir la estructura de datos'),
('2.b', 'Definir las relaciones entre los datos'),
('2.c', 'Crear las reglas que han de cumplir los datos'),
('2.d', 'Ninguna de las anteriores.'),
('3.a', 'El hardware utilizado para la comunicación entre el cliente y el servidor.'),
('3.b', 'El protocolo de comunicación utilizado para transmitir datos.'),
('3.c', 'El punto de acceso en el servidor donde se reciben las solicitudes del cliente.'),
('3.d', 'El software instalado en el cliente para acceder a la base de datos.'),
('4.a', 'La capacidad de realizar copias de seguridad periódicas de la base de datos.'),
('4.b', 'La garantía de que la información en la base de datos es precisa, consistente y no está comprometida.'),
('4.c', 'La capacidad de manejar múltiples usuarios accediendo simultáneamente a la base de datos.'),
('4.d', 'La funcionalidad que permite cifrar los datos sensibles almacenados en la base de datos.'),
('5.a', 'Oracle DB'),
('5.b', 'SQL Server'),
('5.c', 'PostgreSQL'),
('5.d', 'Ninguna de las anteriores.'),
('6.a', 'Un lenguaje de programación de bajo nivel.'),
('6.b', 'Un protocolo de comunicación entre servidores.'),
('6.c', 'Un lenguaje de consulta para manipular datos almacenados en una base de datos.'),
('6.d', 'Un sistema operativo para bases de datos.'),
('7.a', 'Porque así se reduce la velocidad de acceso a la base de datos.'),
('7.b', 'Porque permite trabajar con la base de datos desde cualquier lugar.'),
('7.c', 'Porque limita el acceso a la base de datos.'),
('7.d', 'Todas las anteriores.'),
('8.a', 'DDL'),
('8.b', 'DML'),
('8.c', 'DCL'),
('8.d', 'TCL'),
('9.a', 'Aquella que solo permite consultar datos de una tabla.'),
('9.b', 'Aquella que permite relacionar datos de diferentes tablas.'),
('9.c', 'Aquella que no permite almacenar información en tablas.'),
('9.d', 'Aquella que contiene al menos una relación N:M (muchos a muchos).'),
('10.a', 'Relación'),
('10.b', 'Columna'),
('10.c', 'Función'),
('10.d', 'Atributo'),
('11.a', 'Limitar el acceso a los datos.'),
('11.b', 'Facilitar la integridad y persistencia de los datos.'),
('11.c', 'Restringir la eficiencia de las búsquedas.'),
('11.d', 'Ninguna de las anteriores.'),
('12.a', 'Puede almacenar poca información pero de forma muy segura.'),
('12.b', 'Puede almacenar mucha información y relacionarla eficientemente.'),
('12.c', 'Permite definir esquemas dinámicos y flexibles.'),
('12.d', 'Permite manejar grandes volúmenes de datos distribuyendo la carga de trabajo entre múltiples servidores.');

