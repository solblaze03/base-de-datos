# Reto 2.3: Consultas con subconsultas II
# Introducción
En este reto vamos a usar la base de datos `Chinook` y realizaremos las siguientes consultas donde se requiere hacer subconsultas para obtener el resultado esperado.

[Link Gitlab](https://gitlab.com/solblaze03/base-de-datos/-/tree/main/subconsultas?ref_type=heads)

Autor. Maicol Barragán

##  Consulta 1
En esta consulta listaremos las columnas nombre y la renombramos como canciones superior a la media y los milisegundos que tiene la canción de la tabla `Track`, donde los milisegundos debe ser mayor al promedio ordenados de forma descendente
```sql
-- Obtener las canciones con una duración superior a la media.
SELECT Name AS "Canciones superior a la media", Milliseconds
FROM Track
WHERE
    `Milliseconds` > (
        SELECT AVG(Milliseconds)
        FROM Track
    )
ORDER BY Milliseconds desc;
```

## Consulta 2

```sql
SELECT subc.Country, subc.Email
FROM (
        SELECT *
        FROM Customer
            JOIN Invoice USING (`CustomerId`)
        WHERE
            Email = "emma_jones@hotmail.com"
        ORDER BY Invoice.InvoiceDate desc
        limit 5
    ) as subc;
```
## Consulta 3
Seleccionamos la columna de playlist `PlaylistId` y el `name` de la tabla playlist, lo juntamos con la tabla `PlaylistId` por su id de playlist, haremos una subconsulta donde `TrackId` donde debe tener los registros con la tabla `track` juntado con la tabla genero con su id de genero, debe buscar con la columna `name` de la tabla genero los registros que tengan asignado el genero `reggae`.

```sql
-- Mostrar las listas de reproducción en las que hay canciones de reggae.
SELECT DISTINCT (playlist.`PlaylistId`),
    playlist.name
FROM playlist
    JOIN playlisttrack USING (`PlaylistId`)
WHERE
    playlisttrack.`TrackId` IN (
        SELECT track.`TrackId`
        FROM track
            JOIN genre USING (`GenreId`)
        WHERE
            genre.`Name` = "Reggae"
    );
```
## Consulta 4
En esta consulta seleccionamos todas las tablas con el comodín `*` de la tabla `Customer` donde id del cliente tendrá los registros la tabla `Invoice` donde su total sea mayor a 20. 
 ```sql
SELECT *
from customer
where
    customer.`CustomerId` in (
        SELECT `CustomerId`
        from invoice
        where
            total > 20
    );
 ```
## Consulta 5
En esta consulta seleccionamos las columnas `title` y `ArtistId` de la tabla `album`, donde el `AlbumId` tendrá los registros de la siguiente subconsulta, seleccionamos el `AlbumId` de la tabla `track`, los agrupamos por la columna `AlbumId` que tenga mas de 15 canciones.
```sql
-- Álbumes que tienen más de 15 canciones, junto a su artista.
SELECT title, album.`ArtistId`
FROM album
WHERE
    `AlbumId` IN (
        SELECT `AlbumId`
        FROM track
        GROUP BY
            track.`AlbumId`
        HAVING
            count(*) > 15
    )
```

## Consulta 6
En esta consulta seleccionaremos la columna `Title` de la tabla `album` y el contador de una subconsulta, haremos una subconsulta para saber cuantas canciones tiene cada album, seleccionamos `AlbumId` de la tabla `Track`y una función de agregación para contar los registros, los agrupamos por el `AlbumId` donde su contador sea mayor al promedio, haremos otra subconsulta, seleccionamos con una función de agregación `AVG(cont)` de la tabla subc que es otra subconsulta, seleccionamos otra vez el `Count(*)` y le renombramos a cont, de la tabla `track`, agrupamos por su id de album y la tabla se nombrara promedio, y el select del inicio hasta donde nombramos la tabla promedio tendrá el nombre de `subc` juntando las tablas `album` y `subc` con la columna `AlbumId`.
```sql
-- Obtener los álbumes con un número de canciones superiores a la media.
SELECT Albumid, `Title`, subc.cont
FROM album
    JOIN (
        SELECT `AlbumId`, COUNT(*) AS cont
        FROM track
        GROUP BY
            `AlbumId`
        HAVING
            COUNT(*) > (
                SELECT AVG(cont)
                FROM (
                        SELECT COUNT(*) AS cont
                        FROM track
                        GROUP BY
                            AlbumId
                    ) AS promedio
            )
    ) AS subc USING (`AlbumId`);
```

## Consulta 8
En esta consulta seleccionaremos `GenreId` y `Name` de la tabla `Genre` y `cont` de la subconsulta `lista`, juntaremos la tabla con una subconsulta, en la subconsulta seleccionamos la columna `GenreId`  de la tabla `track` y usamos la función de agregación para contar, agrupamos con la columna `GenreId` y a la consulta la nombramos `lista` y la juntamos con `genre` usando `GenreId`.
```sql
-- Canciones del género con más canciones
SELECT genre.`GenreId`, genre.`Name`, lista.cont
FROM genre
    JOIN (
        SELECT track.`GenreId`, count(*) AS cont
        FROM track
        GROUP BY
            track.`GenreId`
    ) AS lista USING (`GenreId`);
```
## Consulta 9
En esta consulta seleccionamos la columna `PlaylistId` de la tabla playlist y `cont` de la subconsulta `subc`, juntaremos la tabla `playlist` con la subconsulta que seleccionaremos el `playlistId` y la función `count(*)` que la llamaremos `cont` de la tabla `playlisttrack`, la juntamos con la tabla `track` usando (`TrackId`) y la agrupamos con `PlaylistId`, la subconsulta la nombramos `subc` y juntamos con la tabla `playlist` con la columna `PlaylistId`. 
```sql
-- Canciones de la playlist con más canciones
SELECT playlist.`PlaylistId`, subc.cont
FROM playlist
    JOIN (
        SELECT playlisttrack.`PlaylistId`, count(*) AS cont
        FROM playlisttrack
            JOIN track USING (`TrackId`)
        GROUP BY
            playlisttrack.`PlaylistId`
    ) AS subc USING (`PlaylistId`);
```
## Consulta 10
En esta consulta seleccionaremos las columna `customerId` y deberán ser distintas de la tabla `Invoice` y la columna `total` de la subconsulta `suma`, juntamos `Invoice` y con la subconsulta, seleccionamos en la subconsulta la columna `CustomerId` y con la función de agregación de sumar sumamos el total de las facturas y la renombramos a total de la tabla `invoice`, la agrupamos con `CustomerId` y a la subconsulta le nombramos suma y juntamos con la tabla `invoice` usando `CustomerId`.
```sql
-- Muestra los clientes junto con la cantidad total de dinero gastado por cada uno
-- en compras.
SELECT DISTINCT
    customerID,
    suma.total
FROM invoice
    JOIN (
        SELECT `CustomerId`, SUM(invoice.`Total`) AS total
        FROM invoice
        GROUP BY
            invoice.`CustomerId`
    ) AS suma USING (`CustomerId`);
```
## Consulta 11
Seleccionar la columna `ReportsTo` , `FirstName` y `LastName` de la tabla `employee`, y seleccionamos con una subconsulta, seleccionamos con la función `count()` y contara las columnas `CustomerId` que no estén repetidas de la tabla `customer` donde `SupportRepId` debe ser igual a `EmployeeId` y la nombramos cont.

```sql
-- Obtener empleados y el número de clientes a los que sirve cada uno de ellos.
SELECT
    employee.`ReportsTo`,
    `FirstName`,
    `LastName`,
    (
        SELECT count(DISTINCT customer.CustomerId)
        FROM customer
        WHERE
            customer.`SupportRepId` = employee.`EmployeeId`
    ) AS cont
FROM employee;
```
## Consulta 12
En esta consulta seleccionamos las columnas `EmployeeId`, `FirstName`, `LastName` de la tabla `employee` y `total` de la subconsulta `subc` y juntaremos respetando las columnas `employee`, haremos la subconsulta que seleccionara la columna `SupportRepId` de la tabla `customer` y sumaremos los registros `Total` de la tabla `Invoice` con la función `sum()` y lo nombramos total, juntaremos la tabla `customer` con `invoice` usando la columna `CustomerId`,agrupamos con `SupportRepId` de la tabla `Customer` y nombramos como `subc`, juntamos a la subconsulta con la tabla `SupportRepId` donde `EmployeeId` sea igual a `SupportRepId`.
```sql 
-- Ventas totales de cada empleado
SELECT
    `EmployeeId`,
    `FirstName`,
    `LastName`,
    subc.total
FROM employee
    LEFT JOIN (
        SELECT customer.`SupportRepId`, sum(invoice.`Total`) AS total
        FROM customer
            JOIN invoice USING (`CustomerId`)
        GROUP BY
            customer.`SupportRepId`
    ) AS subc ON employee.`EmployeeId` = subc.`SupportRepId`;
```
## Consulta 13
Seleccionamos las columnas `id`, `titulo` y `cont` de la subconsulta `subc`, en la subconsulta seleccionamos las columnas `ArtistId` como `id` , `Title` como `titulo` de la tabla `album` y `count(*)` como `cont` donde contaremos los números de canciones del album, juntamos con la tabla `track` usando la columna `AlbumId` y agrupamos por el `titulo` y `id` , nombramos la subconsulta como `subc`
```sql
-- Álbumes junto al número de canciones en cada uno.
SELECT id, titulo, cont
FROM (
        SELECT album.`ArtistId` AS id, album.`Title` AS titulo, count(*) AS cont
        FROM album
            JOIN track USING (`AlbumId`)
        GROUP BY
            titulo, id
    ) AS subc;
```
## Consulta 14
En esta consulta seleccionaremos las columnas `ArtistId` y `Title` de la tabla `Album` y `artista` de la subconsulta `subc` , la subconsulta seleccionara las columnas artistId, la función `MAX()` que seleccionara el registro máximo de `AlbumId` y lo nombramos `ultimo` de la tabla `album`, juntaremos la tabla `artist` con `album` usando `ArtistId`, agrupamos con `artistid`, la subconsulta la nombramos como subc y la juntamos con album donde `album.artistId` = `subc.artistid` y `album.albumid` sea igual a `subc.ultimo`.
```sql
-- Obtener el nombre del álbum más reciente de cada artista. Pista: los álbumes
-- más antiguos tienen un ID más bajo.
SELECT album.`ArtistId`, album.`Title`, subc.artista
FROM album
    JOIN (
        SELECT artistid, MAX(AlbumId) AS ultimo, artist.`Name` AS artista
        FROM album
            JOIN artist USING (`ArtistId`)
        GROUP BY
            artistid
    ) AS subc ON album.artistid = subc.artistid
    AND album.albumid = subc.ultimo;
```