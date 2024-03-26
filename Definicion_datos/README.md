# Introducción



## Creacion Base de datos
Con este comando Creamos la base de datos `Reservas` y con el comando `use` nos centraremos en la base de datos que queramos, en este caso `Reservas`.
```sql
CREATE DATABASE Reservas;
USE `Reservas`;
```
## Creación tablas
Con el comando `CREATE TABLE` crearemos la tabla con el nombre `Pasajeros` y en la tabla le asignamos unos atributos.
- `id_pasajero` sera un numero entero no nulo, al insertar no debe contener un numero nulo y se auto incrementara cada vez que insertemos un registro, tambien sera la clave primaria de nuestra tabla con el que identificaremos al pasajero.
- `num_pasaporte` sera varchar que va contener una longitud de 9 caracteres, debe requerido al insertar y sera unico, no habra repetidos.
- `nombre` sera varchar con una longitud de caracteres de 50, para adaptarse a diferentes nombres que existan, y sera necesario al insertarlo. 
```sql
CREATE TABLE `Pasajeros` (
`id_pasajero` int NOT NULL AUTO_INCREMENT UNIQUE,
`num_pasaporte` varchar(9) NOT NULL UNIQUE,
`nombre` varchar(50) NOT NULL,
PRIMARY KEY (`id_pasajero`),
); 
```


```sql
CREATE TABLE `Vuelos` (
`id_vuelo` int(8) NOT NULL AUTO_INCREMENT,
`origen` varchar(25) NOT NULL,
`destino` varchar(25) NOT NULL,
`fecha` date NOT NULL,
`capacidad` int NOT NULL,
PRIMARY KEY (`id_vuelo`)
);
```

```sql
CREATE TABLE `Vuelos_Pasajeros` (
`id_vuelo` int NOT NULL,
`id_pasajero` int NOT NULL,
`num_asiento` int NOT NULL,
`id_vuelospasajeros` int unsigned NOT NULL,
PRIMARY KEY (`id_vuelospasajeros`),
UNIQUE KEY `num_asiento_UNIQUE` (`num_asiento`),
KEY `id_vuelo` (`id_vuelo`),
KEY `id_pasajero` (`id_pasajero`),
CONSTRAINT `Vuelos_Pasajeros_ibfk_1` FOREIGN KEY (`id_vuelo`) REFERENCES `Vuelos` (`id_vuelo`),
CONSTRAINT `Vuelos_Pasajeros_ibfk_2` FOREIGN KEY (`id_pasajero`) REFERENCES `Pasajeros` (`id_pasajero`)
);
```



