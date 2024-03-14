# Unidad C0: Recapitulación

Autor. Maicol Barragán Pérez

En esta recapitulación se dará una introducción a las bases de datos, dando a conocer que son las bases de datos, sistema de gestión de base de datos, el modelo cliente-servidor y el lenguaje de programación para el manejo de datos y sus instrucciones.

## Concepto y origen de las bases de datos
¿Qué son las bases de datos? ¿Qué problemas tratan de resolver? Definición de base de datos.

Las bases de datos es un conjunto estructurado que representa entidades y sus interrelaciones. Este conjunto estructurado de datos debe poder ser utilizada de forma compartida por muchos usuarios de distintos tipos.

Las bases de datos pueden tener entidades de distinto tipo y no se limita a una entidad como los ficheros, pueden relacionar los ficheros permitiendo un acceso mas eficiente a la información relacionada, minimizan la redundancia de datos y puede ser compartida por muchos usuarios de distinto tipo.

## Sistemas de gestión de bases de datos
¿Qué es un sistema de gestión de bases de datos (DBMS)? ¿Qué características de acceso a los datos debería proporcionar? Definición de DBMS.

Un sistema de gestión de base de datos permite  administrar y organizar grandes volúmenes de información, permitiendo el almacenamiento eficiente, la recuperación de datos y manipulación de información de manera segura.

Un sistema de gestión de base de datos debe proporcionar:
- Consultas no predefinidas y complejas.
- Flexibilidad e independencia.
- Problemas de la redundancia.
- Integridad de los datos.
- Concurrencia de datos. : En el campo informatico, el termino concurrencia se refiere a la capacidad de los Sistemas de Administración de Base de Datos, de permitir que múltiples procesos sean ejecutados al mismo tiempo, y que tambien puedan interactuar entre sí.
Los procesos concurrentes pueden ser ejecutados realmente de forma simultánea, sólo cuando cada uno es ejecutado en diferentes procesadores. En cambio, la concurrencia es simulada si sólo existe un procesador encargado de ejecutar todos  los procesos, simulando la concurrencia, ocupándose de forma alternada de uno y otro proceso a muy pequeños intervalos de tiempo. De esta manera simula que se están ejecutando a la vez. 
- Seguridad.

### Ejemplos de sistemas de gestión de bases de datos
¿Qué DBMS se usan a día de hoy? ¿Cuáles de ellos son software libre? ¿Cuáles de ellos siguen el modelo cliente-servidor?
* Oracle DB
* IMB Db2
* SQLite
* MariaDB
* SQL Server
* PostgreSQL
* mySQL

Actualmente las bases de datos mas utilizadas son Mysql,postgreSQL, SQLite, Mongodb y SQL server.

Las bases de datos que son software libre son mySQL, SQLite, MariaDB y postgreSQL.

El único que no sigue el modelo cliente servidor es SQLite y se utiliza directamente desde la aplicación cliente.

## Modelo cliente-servidor
¿Por qué es interesante que el DBMS se encuentre en un servidor? ¿Qué ventajas tiene desacoplar al DBMS del cliente? ¿En qué se basa el modelo cliente-servidor?

Tener el DBMS en un servidor tiene las ventajas de acceder en remoto, suelen tener medidas de seguridad mas robustas, tener respaldo y recuperación, facilitar las tareas de mantenimiento, colaboración eficiente y disponibilidad continua.

El modelo cliente servidor es un modelo de comunicación que permite la distribución de tareas dentro de una red de ordenadores



* __Cliente__: Es un dispositivo o programa que solicita servicios o recursos o recursos a un servidor
* __Servidor__: Es un dispositivo o programa que proporciona servicios o recursos a los clientes.
* __Red__: es la infraestructura de comunicación que conecta el cliente y el servidor, puede ser una red local o una red mas extensa.
* __Puerto de escucha__: Es un numero de identificación asignado a un programa en el servidor que permite a los clientes conectarse y comunicarse con él, por ejemplo el 3306 de mysql.
* __Petición__: Es una solicitud que le hace un cliente a un servidor, el servidor procesa la petición y devuelve la respuesta correspondiente.
* __Respuesta__: Es la información devuelta por el servidor al cliente en respuesta a una petición.

## SQL
¿Qué es SQL? ¿Qué tipo de lenguaje es?

SQL (Structured Query Language) es un lenguaje de programación que se utiliza para el manejo de bases de datos relacionales.
Es una herramienta para poder acceder, manipular y consultar la información de una base de datos.

![imagen instrucciones sql](img.jpg)
### Instrucciones de SQL
#### DDL
DDL (Lenguaje de definición de datos) permite crear y modificar la estructura de una base de datos.
- Create: Para crear objetos en la base de datos
- Alter : Altera la estructura de la base de datos
- Drop: Elimina los objetos de la base de datos
- Truncate: Elimina todos los registros de una tabla
- Comment: Agregar comentarios al _Diccionario de datos.
- Rename: Cambiar  el nombre de un objeto
#### DML
DML (Lenguaje de manipulación de datos), es una lenguaje que permite gestionar y manipular datos en una base de datos relacional.
- Select: Recuperar datos de la base de datos.
- Insert: Insertar datos en la tabla.
- Update: Actualizaciones de datos existentes en una tabla.
- Delete: Elimina todos los registros de una tabla.
#### DCL
DCL (Lenguaje de control de datos), este lenguaje proporciona una serie de comandos SQL que permite al administrador controlar el acceso a datos contenidos en la base de datos.
- Grant: Permite dar permisos a uno o varios usuarios
- Revoke: Permite eliminar permisos que previamente se han concedido con GRANT.
#### TCL
TCL (Lenguaje de control de transacciones) , este lenguaje proporciona instrucciones para iniciar, confirmar y deshacer transacciones, asegurando la consistencia y la integridad de datos.
- Commit: Guarda el trabajo realizado.
- Savepoint: Identifica un punto de una transacción.
- Rollback: Restaurar la base de datos a la original.
- Set Transaction: Cambia las opciones de la transacción como nivel de aislamiento y que segmento de cancelación utiliza.
## Bases de datos relacionales
¿Qué es una base de datos relacional? ¿Qué ventajas tiene? ¿Qué elementos la conforman?

Una base de datos relacional organiza los datos en filas y columnas, que en conjunto forman una tabla. Los datos normalmente se estructuran en varias tablas que se pueden unir a través de unas clave principal o una clave externa.

Las ventajas que tiene son:
1. Evita la duplicidad de registros
2. Garantiza la integridad referencial.
3. Elimina la duplicaciones de registros


Esta representada por entidades, atributos y relaciones.

* __Relación (tabla)__: Las relaciones se guardan en formato tabla, se almacena junto a las entidades.
* __Atributo/Campo (columna)__: Corresponde a una columna de la tabla, los atributos son las propiedades que definen una relación

* __Registro/Tupla (fila)__: Es un registro individual dentro de una tabla y contiene un conjunto especifico de valores para cada atributo.

## Fuentes

- [Introduccion base de datos - Rafael Camps Paré](https://www.uoc.edu/pdf/masters/oficiales/img/913.pdf)
- [Centro de formación tecnica para la industria](https://www.cursosaula21.com/que-es-sql/)
- [TecnoBits - Sebastian Vidal](https://tecnobits.com/que-es-un-sistema-de-gestion-de-bases-de-datos-sgbd/)
- [Ciberninjas - Pablo Álvarez](https://ciberninjas.com/software-bases-datos-codigo-abierto/)
- [Learn SQL - Kamila Ostrowska](https://learnsql.es/blog/las-bases-de-datos-mas-populares-en-2023/#:~:text=Comparaci%C3%B3n%20de%20las%205%20principales%20bases%20de%20datos,Microsoft%20SQL%20Server%20...%205%205.%20MongoDB%20)
- [mtro Frenando Arciniega](https://fernandoarciniega.com/sentencias-sql-ddl-dml-dcl-y-tcl/#:~:text=SENTENCIAS%20SQL%20%28DDL%2C%20DML%2C%20DCL%20Y%20TCL%29%20En,uno%20de%20ellos%20y%20en%20qu%C3%A9%20se%20diferencian%3A)
- [Sistemas](https://sistemas.com/red-cliente-servidor.php)
- [IONOS](https://www.ionos.mx/digitalguide/servidores/know-how/modelo-cliente-servidor/)
- [IBM](https://www.ibm.com/mx-es/topics/relational-databases)
