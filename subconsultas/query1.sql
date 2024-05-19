-- Consulta 1 Obtener las canciones con una duración superior a la media.
SELECT Name AS "Canciones superior a la media",Milliseconds FROM Track WHERE `Milliseconds` > (SELECT AVG(Milliseconds) FROM Track) ORDER BY Milliseconds desc;
