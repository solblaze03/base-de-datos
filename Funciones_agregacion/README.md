# Consultas con funciones de agregación 
## Introducción
En esta actividad vamos a practicar en la base de datos `Chinook`, usaremos los distintos tipos de funciones de agregación, juntaremos las tablas y como agruparlas.

Autor. Maicol Barragán.

[Link GITLAB](https://gitlab.com/solblaze03/base-de-datos/-/tree/main/Funciones_agregacion?ref_type=heads)

## Consulta 1
En esta consulta seleccionaremos todas las columnas de la tabla `Customer` donde su pais sea Francia
```sql
SELECT * FROM Customer WHERE Country LIKE "France";
```
## Consulta 2
En esta consulta listaremos todas las columnas de la tabla `Invoice` y solo mostrara los registros del primer trimestre, para eso seleccionaremos solo el año con la siguiente función  `YEAR(InvoiceDate)` y debe ser igual al año actual con el `YEAR(NOW())` donde Now() es la fecha en que estamos, luego usaremos la función `MONTH()` que seleccionara el mes del año y con el `in()` elegimos los primeros tres meses. 
```sql
SELECT * FROM Invoice WHERE year(InvoiceDate) like year(now())  and month(InvoiceDate) in (01,02,03);
```

## Consulta 3
Seleccionaremos todas las columnas de la tabla `Track` donde su compositor sea AC/DC
```sql
SELECT * FROM Track WHERE Composer like "AC/DC";
```
## Consulta 4
Seleccionaremos todas las columnas de la tabla `TRACK` y elegimos las 10 que mas espacio ocupan.
```sql
SELECT * FROM Track order by Bytes desc limit 10;  
```
## Consulta 5
Seleccionaremos los paises que tenemos clientes, con la funcion `distinct()` que permite que no haya registros repetidos y lo renombramos con el `AS`, de la tabla `Customer`. 
```sql
SELECT distinct(Country) as "Paises con clientes" FROM Customer;
```
## Consulta 6
Listaremos todos los generos musicales de la tabla genero, seleccionaremos la columna `Name` y la renombramos a Generos Musicales y seleccionamos la tabla `Genre`.
```sql
SELECT Name as "Generos musicales" FROM Genre;
```
## Consulta 7
En esta consulta listaremos todos los artistas juntos a sus álbumes, Elegimos de la tabla `Album` la columna `Title`, La tabla `Artist` elegimos la columna `Name`, Combinamos los datos de las tablas `Album` y `Artist` donde su id de artista sean iguales.
```sql
SELECT Album.Title as Album , Artist.Name as Artista FROM Album join Artist on Album.ArtistId = Artist.ArtistId;
```
## Consulta 8
En esta consulta listaremos a los empleados más jóvenes junto a su supervisor.
Combinamos la tabla `Employee` con la tabla `Employee` donde el trabajador informa al supervisor `t2.ReportsTo = t1.EmployeeId`, con esto seleccionamos una tabla a dos tablas gracias a su alias que son `t1` que sera el supervisor y `t2` que sera el empleado, ordernaremos por su fecha de nacimiento de forma descendente y habra un limite de 5 registros.   
```sql
SELECT   t2.FirstName as Empleado, t2.BirthDate as menores,
t2.ReportsTo ,t1.FirstName as "Supervisor" ,
t1.EmployeeId as  "Id_supervisor" 
FROM Employee as t1 join Employee as t2 
on t2.ReportsTo = t1.EmployeeId order by t2.BirthDate desc limit 5;
```

## Consulta 9
En esta consulta listaremos todos los registros donde se muestran todas las facturas de los brelineses, Juntaremos las tablas `Invoice` que tendra el alias `I` y `Customer` que tendra el alias `C`,Las dos tablas se juntan  donde su id de cliente sean iguales, Solo seleccionamos las columnas con este order:  `I.InvoiceDate`, `C.FirstName`,`I.BillingAddress`, `C.PostalCode`, `C.Country`,`I.Total`, y solo se mostraran los registros donde la ciudad sea Berlín.
```sql
SELECT  I.InvoiceDate,C.FirstName,
 I.BillingAddress, C.PostalCode, C.Country,
 I.Total FROM  Invoice as I join Customer as C on I.CustomerId = C.CustomerId where City like "Berlin";
```
## Consulta 10
En esta consulta se listara las listas de reproduccion que inicien con la letra C juntos a sus canciones ordenadas por álbum y duracion, juntaremos las tablas `Playlist` con alias `pl`,`PlaylistTrack` con alias `plt` y `Track` con alias `t`, se junta primero la tabla `Playlist` a la tabla `PlaylistTrack` donde su id de playlist sean iguales y luego se juntara la tabla `PlaylistTrack` a la tabla `Track` donde su id de Track sean iguales, solo mostraremos los nombres de playlist que inicien con la letra C con el comodin `%` y se ordenara por su duración.
```sql
SELECT pl.Name , pl.PlaylistId,plt.PlaylistId as p2, t.TrackId,t.AlbumId, t.Name , t.Milliseconds FROM Playlist as pl join PlaylistTrack as plt 
on pl.PlaylistId = plt.PlaylistId  
join Track as t 
on t.TrackId = plt.TrackId 
where pl.Name like "C%" order by t.Milliseconds asc;
```
## Consulta 11
En esta consulta listaremos los clientes que hayan hecho compras superiores a 10€ ordenadas por su apellido, juntaremos las tablas `Customer` con su alias `c` y la tabla `Invoice` con su alias `i` donde su id de cliente sean iguales, solo seleccionamos las columnas `LastName` de la tabla `Customer` y `Total` de la tabla `Invoice`, solo se mostraran los que su compra sea mayor a 10€ y ordenamos por su apellido de forma ascendente.
```sql
SELECT c.LastName, i.Total FROM Customer AS c JOIN Invoice AS i ON c.Customerid = i.Customerid WHERE i.Total > 10 order by c.LastName asc;
```
## Consulta 12
En esta consulta listaremos el minimo el maximo y promedio de cada factura,
Usamos tres tipos de funciones, `min()` que selecciona el valor mas bajo registrado, `max()` que selecciona el valor mas alto y `avg()` que devolvera el promedio de todos los datos, orde
```sql
SELECT min(Total),max(Total),avg(Total) FROM Invoice;
```
## Consulta 13
En esta consulta listaremos a todos los artistas que esten registrados en la tabla `Artist`, usaremos la funcion `count(*)` que nos devolvera el numero de registros de la tabla.
```sql
SELECT count(*) FROM Artist;
```
## Consulta 14
En esta consulta listaremos el numero de canciones que tiene el album Out Of Time, Para eso juntaremos las tablas `Album` y `Track` donde el id de album sean iguales, usaremos de nuevo el metodo `count()` que nos devolvera la cantidad de registros y donde su titulo sea igual a Out of time.
```sql
SELECT count(*) as "Total canciones" 
FROM Album join Track on Album.AlbumId = Track.AlbumId where Title like "Out of time";
```
## Consulta 15
En esta consulta listaremos todos el numero de paises donde tenemos clientes, usaremos dos metodos, el count para contar y el distinct para que los registros sean distintos, se usara la tabla `Customer`, el distinct sin el count nos mostrara solo los paises donde hay clientes, con el count contamos la cantidad de paises, 
```sql
SELECT count(distinct Country) as "Paises Clientes" FROM Customer;
```
## Consulta 16
En esta consulta listaremos el nombre del genero con el total de numeros de canciones que tiene, Juntaremos las tablas `Genre` y `Track` donde su id de genero sean iguales, Seleccionamos la columna `Genre.name` y `Count(*)` y agruparemos los registros que tengan los mismos valores gracias al `GROUP BY` y el `count(*)` nos devolvera cuantos registros tiene cada genero de musica.
```sql
SELECT Genre.name as genero, count(*) as canciones FROM Genre join Track on Genre.Genreid = track.GenreId group by Genre.name;
```

## Consulta 17
En esta consulta listaremos los álbumes ordenados por el numero de canciones que tenga cada álbum, juntaremos la tabla `Album` y `Track` donde su id de album sean iguales, seleccionaremos la columnas, `Album.Title ` y `Count()`, las agrupamos con el `Group by` con la columna Title y ordenaremos de forma descendente.
```sql
SELECT Album.Title,count(*) FROM Album JOIN Track ON Album.AlbumId = Track.AlbumId GROUP BY Title ORDER BY count(*) DESC;
```
## Consulta 18
En esta consulta listaremos los generos musicales mas comprados, para eso juntaremos la tabla `Invoiceline` y `Track` donde su id de track sean iguales y de `Track` a `Genre` donde su id de genero sean iguales, Solo seleccionamos las columnas `Genre.name` y `count(*)` y agrupamos con la columna `genre.name` y ordenamos de forma descendente.
```sql
SELECT  genre.name, COUNT(*) FROM
invoiceline JOIN track ON invoiceline.TrackId = track.TrackId
JOIN Genre ON track.GenreId = genre.GenreId
GROUP BY genre.name ORDER BY COUNT(*) DESC; 
```
## Consulta 19
En esta consulta listaremos los 6 álbumes mas comprados, para eso juntaremos las tablas `album` y `track` donde su id de album sean iguales y de `track` a `invoiceline` donde su id de track sean iguales, Seleccionaremos las columnas `Album.title` y `count(*)`, los agrupamos con la columna `album.title`, ordenamos el valor devuelto por el  `count(*)` de forma descendente y solo listaremos los 6 albumes con el `limit`.
```sql
SELECT album.Title , count(*) FROM album join track on album.AlbumId = track.AlbumId join invoiceline on invoiceline.trackid = track.TrackId group by album.title order by count(*) desc limit 6;
```

## Consulta 20
En esta consulta listaremos los paises que tengan como minimo 5 clientes, Seleccionamos las columnas `Country` , `Count(*)`, agrupamos con la columna `Country` que tenga el valor devuelto por el `count(*)` igual o mas de 5 clientes y ordenamos de forma descendente.
```sql
-- Muestra los países en los que tenemos al menos 5 clientes
SELECT Country , count(*) FROM Customer group by Country having count(*) >= 5 order by count(*) desc ;
```