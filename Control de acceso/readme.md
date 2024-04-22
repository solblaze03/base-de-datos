# DCL Control de acceso
## Introducción
En esta actividad daremos a conocer lo mas importante sobre el DCL, vamos aprender como gestionar los usuarios y sus permisos como poder crear usuarios y asignarles privilegios,modificarlos eliminarlos, poder crear roles, asignar roles a un usuario y asignarles privilegios, como se autentican los usuarios, los tipos de privilegios, etc.

Autor. Maicol Barragán.

- [Link gitlab](https://gitlab.com/solblaze03/base-de-datos/-/tree/main/Control%20de%20acceso?ref_type=heads)

## Ingresar a mysql en la terminal.
Para ingresar a mysql en la terminal se introduce este comando, `-u` es el usuario, `p` es la contraseña que te pedira luego para poder ingresar , `-h` es el host del usuario, -P es el puerto del usuario, por defecto es 3306. 
```sql
mysql -u root -p -h localhost -P 3306
```
## Crear usuario
Para crear un usuario en mysql se ingresara el siguiente comando.
```sql
CREATE USER 'Newuser'@'localhost' IDENTIFIED BY 'PASS123'
```
Para crearlo se usa CREATE USER y colocamos en las comillas 'el usuario' @ 'host' y IDENTIFIED BY 'contraseña del usuario'.
Si queremos cambiar la contraseña se usara el siguiente comando
```sql
ALTER USER 'Newuser'@'localhost' IDENTIFIED BY 'new_password';
```
## Renombrar usuario
Se usa el siguiente comando para poder modificar el usuario 
```sql
RENAME USER 'Newuser'@'localhost' TO 'CHANGEUSER'@'localhost'
Se cambia el nombre del usuario con `RENAME USER` y colocamos nuestro usuario con el host y luego colocamos el nuevo, separados con el `TO`.
```
## Eliminar usuarios
Para eliminar un usuario se usa el siguiente comando.
```sql
DROP USER 'CHANGEUSER'@'localhost'
```
Simplemente usaremos DROP USER, nuestro usuario y el host para eliminar nuestro usuario.

## Como se autentican los usuarios
En mysql desde la terminal debes colocar tu usuario y te obligara a introducir la contraseña de forma que nadie pueda leerla.
En mysql workbench cuando inicies la sesión tambien te obligara a iniciar la sesión con una contraseña.

## Ver los usuarios existentes
Para ver los usuario existentes se hace una consulta con el select, con el siguiente comando.
```sql
SELECT * FROM mysql.user;
```

## Que permisos puede tener un usuario

Un usuario puede tener muchos privilegios ya sea para todas las bases de datos. unas en especificas, incluso en tablas en concretas, Podremos tener permisos de escritura , lectura, permisos de ejecucion o permisos admininstrativos, vamos hablar de los priviliegios mas destacados.
* ALL PRIVILEGES: Podremos Habilitarles el acceso total a la base de datos, si no se selecciona la base de datos tendra acceso total a todo el sistema.
* CREATE: Permitira crear tablas o bases de datos.
* DROP: Permite eliminar base de datos o tablas.
* Delete: Permite eliminar registros.
* Insert: Permite insertar registros.
* SELECT: Nos permitira leer registros de la base de datos.
* UPDATE: Permite actualizar registros de la base de datos.
* GRANT OPTION: Permite ortogar o eliminar privilegios a otros usuarios.
Podremos observar nuestros privilegios con el siguiente comando.
```sql
show grants for 'root'@'localhost';
```
podremos ver un ejemplo en este link [permisos](arch.txt)

Si queremos gestionar los usuarios necesitaremos los permisos de CREATE USER, GRANT OPTION para poder ortogarle permisos a otros usuarios y ALL PRIVILEGES para tener todos los permisos de la base de datos.
## Agrupación de usuarios
Los usuarios se pueden agrupar por roles, tambien se le puede asignar unos permisos o quitarlos.
A los usuarios se le pueden asignar roles, le ortogara los privilegios que esten asociados al rol.
Para crear roles o eliminarlos es:
```sql
-- Para crearlo
CREATE ROLE
-- Para eliminarlo.
DROP ROLE
``` 
Para asignar privilegios o quitarlos a los roles:
```sql
-- Asigna privilegios
GRANT
-- Quita privilegios
REVOKE
-- Mostrar asignaciones roles.
SHOW GRANTS
```
Para asignar un roles a un usuario se usa el siguiente comando.
```sql
GRANT nombre_role to 'user'@'host';
```
Para ver el usuario se halla asignado al rol se usa este comando.
```sql
SHOW GRANTS FOR 'user'@'localhost';
```
Para eliminar un role a un usuario se usa el siguiente comando.
```sql
REVOKE nombre_role from 'user'@'host';
```
## Comandos para gestionar los usuarios y sus permisos.
Vamos a usar por ejemplo la base de datos chinook, vamos a hacer un usuario admin que podra tener control total en la base de datos.
Crearemos el usuario admin, que podra tener todos los privilegios, Para asignarle todos los usuarios usaremos el siguiente comando.
```sql
CREATE USER 'admin'@'localhost';
GRANT ALL PRIVILEGES ON empresaa.* TO 'admin'@'localhost';
```
Con `GRANT` asignaremos los permisos ya sea un `create`, `select` o `DROP` por ejemplo, luego seleccionamos la base de datos con un punto y elegimos el nombre de la tabla o con el comodin `*` para seleccionarlas todas.

Tambien podremos crear un role y asignar los empleados o si escogemos solo uno. vamos a crear un role que tenga permisos en una tabla en concreto.
```sql
-- crear usuario trabajador
CREATE USER 'trabajador1'@'localhost';
-- crear role
 CREATE ROLE trabajadores;
-- asignar trabajador al rol.
GRANT trabajadores to 'trabajador1'@'localhost';
-- asignar permisos al rol 
GRANT SELECT,UPDATE,INSERT ON chinook.Track TO trabajadores;
```
Aqui le hemos dado permisos al role de select,update y insert sobre la base de datos en la tabla `Track`, Asi el trabajador solo podra hacer consultas, actualizar datos y insertarlos en esa tabla en concreta como puede seleccionar la base de datos completa o todo el sistema completo.
Si queremos bloquear un usuario usaremos el siguiente comando.
```sql
ALTER USER 'trabajador1'@'localhost' account lock;
```
Con este comando bloquearemos un usuario, usaremos lock para bloquear o unlock para desbloquear un usuario.
Podremos ver si el usuario esta bloqueado con el siguiente comando
```sql
SHOW CREATE USER 'root'@'localhost';
```




## Fuentes 
- [Hostinger](https://www.hostinger.es/tutoriales/como-crear-usuario-mysql)
- [mysql](https://dev.mysql.com/doc/refman/8.3/en/user-names.html)
- [DIGITAL OCEAN](https://www.digitalocean.com/community/tutorials/crear-un-nuevo-usuario-y-otorgarle-permisos-en-mysql-es) readme -> [7](#que-permisos-puede-tener-un-usuario-usuario)
- [roles mysql](https://dev.mysql.com/doc/refman/8.0/en/roles.html) readme -> [8](#agrupación-de-usuarios)
- [bloquear usuarios](https://dev.mysql.com/doc/refman/8.0/en/account-locking.html) readme -> [8](#comandos-para-gestionar-los-usuarios-y-sus-permisos)