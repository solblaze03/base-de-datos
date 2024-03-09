# Reto 3: Consultas basicas con join.
Autor. Maicol Barragán Pérez.

En este reto trabajaremos con la base de datos de `VIDEOCLUB` y realizaremos cada unas de las consultas pedidas utilizando el join, para eso las tablas deben estar relacionadas a través de la clave foránea.

El código fuente correspondiente a este reto puede consultarse: [Link de gitlab]()

## Consulta 1
En esta consulta listaremos todos los atributos de la tabla `PELICULA` y `GENERE` con el comodin `*` que selecciona todas las columnas, le colocamos alias a `PELICULA` Y `GENERE` con la primer letra de cada tabla, usamos el JOIN combinamos las tablas donde su columna `CodiGenere` sea igual en la tabla `PELICULA` y la tabla `GENERE`
```sql
SELECT * FROM PELICULA as p JOIN GENERE as g ON p.CodiGenere = g.CodiGenere;
```

## Consulta 2
En esta consulta listaremos con el comodin `*` todas la s columnas de `FACTURA` y  `CLIENT` y con el join combinamos las tablas donde tengan el mismo DNI el cliente y la factura y listaremos solo los clientes que tengan el nombre de MARIA.
```sql
SELECT * FROM FACTURA JOIN CLIENT ON FACTURA.DNI = CLIENT.DNI WHERE NOM LIKE "MARIA%";
```
## Consulta 3
En esta consulta listaremos de la tabla `PELICULA` la columna pelicula y de la tabla `ACTOR` el nombre de la pelicula y el nombre del actor principal, le renombramos como actor principal con `AS`, combinamos las dos tablas donde su atributo CodiActor sean iguales. 
```SQL
Select PELICULA.TITOL, ACTOR.NOM AS "ACTOR PRINCIPAL" from PELICULA JOIN ACTOR ON
PELICULA.CodiActor = ACTOR.CodiActor ;
```
## Consulta 4
En esta consulta listaremos el nombre de la pelicula y los actores que participaron, combinaremos la tabla `INTERPRETADA` y tabla `PELICULA`, luego combinaremos la tabla `ACTOR` para listar los nombres de los actores a traves de su codigo de actor.

```sql
SELECT PELICULA.TITOL, ACTOR.NOM FROM PELICULA 
JOIN INTERPRETADA 
ON PELICULA.CodiPeli = INTERPRETADA.CodiPeli 
JOIN ACTOR 
ON INTERPRETADA.CodiActor = ACTOR.CodiActor;
```
## Consulta 5
En esta consulta listaremos las peliculas con sus segundas partes, para eso combinaremos la misma tabla, seleccionaremos el codigo de la peli con el titulo con el alias p1 que representa la pelicula 1, luego hacemos lo mismo con la pelicula2 con el alias p2, pero en el titulo la renombramos segunda parte relacionando con el atributo de peli1 `CodiPeli` sea igual a la peli2 con el atributo `SegonaPart`, luego filtraremos solos los registros donde su segunda parte no sean nulos.
```sql
SELECT p1.CodiPeli, p1.Titol as "Pelicula",
p2.CodiPeli ,p2.Titol as "Segunda parte" 
FROM PELICULA as p1 join PELICULA as p2 ON p1.CodiPeli = p2.SegonaPart where p2.SegonaPart is not null;
```