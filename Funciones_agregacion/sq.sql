-- Encuentra todos los clientes de Francia.
SELECT * FROM Customer WHERE Country LIKE "France";

-- Muestra las facturas del primer trimestre de este año.
SELECT * FROM Invoice WHERE year(InvoiceDate) like year(now())  and month(InvoiceDate) in (01,02,03);

-- Muestra todas las canciones compuestas por AC/DC.
SELECT * FROM Track WHERE Composer like "AC/DC";


-- Muestra las 10 canciones que más tamaño ocupan.
SELECT * FROM Track order by Bytes desc limit 10;  

-- Muestra el nombre de aquellos países en los que tenemos clientes.
SELECT distinct(Country) as "Paises con clientes" FROM Customer;

-- Muestra todos los géneros musicales.
SELECT Name as "Generos musicales" FROM Genre;

-- Muestra todos los artistas junto a sus álbumes.
SELECT Album.Title as Album , Artist.Name as Artista FROM Album join Artist on Album.ArtistId = Artist.ArtistId;

-- Muestra los nombres de los 15 empleados más jóvenes junto a los nombres de sus supervisores, si los tienen.
-- SELECT * FROM Employee;
SELECT   t2.FirstName as Empleado, t2.BirthDate as menores,
t2.ReportsTo ,t1.FirstName as "Supervisor" ,
t1.EmployeeId as  "Id_supervisor" 
FROM Employee as t1 join Employee as t2 
on t2.ReportsTo = t1.EmployeeId order by t2.BirthDate desc limit 4;

-- Muestra todas las facturas de los clientes berlineses. Deberán mostrarse las columnas: fecha de la factura, nombre completo del cliente, dirección de facturación,código postal, país, importe (en este orden).

SELECT  I.InvoiceDate,C.FirstName,
 I.BillingAddress, C.PostalCode, C.Country,
 I.Total FROM  Invoice as I join Customer as C on I.CustomerId = C.CustomerId where City like "Berlin";
 
 
 

 
-- Muestra las listas de reproducción cuyo nombre comienza por C, junto a todas
-- sus canciones, ordenadas por álbum y por duración

SELECT pl.Name , pl.PlaylistId,plt.PlaylistId as p2, t.TrackId,t.AlbumId, t.Name , t.Milliseconds FROM Playlist as pl join PlaylistTrack as plt 
on pl.PlaylistId = plt.PlaylistId  
join Track as t 
on t.TrackId = plt.TrackId 
where pl.Name like "C%" order by t.Milliseconds asc;

-- Muestra qué clientes han realizado compras por valores superiores a 10€, ordenados por apellido.
SELECT c.LastName, i.Total FROM Customer AS c JOIN Invoice AS i ON c.Customerid = i.Customerid WHERE i.Total > 10 order by c.LastName asc;

-- 
SELECT * FROM InvoiceLine;

 -- Muestra el número total de artistas.
SELECT count(*) FROM Artist;

-- Muestra el número de canciones del álbum “Out Of Time”.
SELECT count(*) FROM Album join Track on Album.AlbumId = Track.AlbumId where Title like "Out of time";

-- Muestra el número de países donde tenemos clientes
SELECT count(distinct Country) as "Paises Clientes" FROM Customer;

SELECT *,count(Track.Name)  FROM Genre join Track;
-- Muestra el número de canciones de cada género (deberá mostrarse el nombre del género).



