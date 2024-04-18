# Introducción



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

## Ver los usuarios existentes
Para ver los usuario existentes se hace una consulta con el select, con el siguiente comando.
```
SELECT * FROM mysql.user;^C

```

## Fuentes 
- [Hostinger](https://www.hostinger.es/tutoriales/como-crear-usuario-mysql)
- [mysql](https://dev.mysql.com/doc/refman/8.3/en/user-names.html)
- [DIGITAL OCEAN](https://www.digitalocean.com/community/tutorials/crear-un-nuevo-usuario-y-otorgarle-permisos-en-mysql-es)