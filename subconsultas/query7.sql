-- Consulta 7
-- Obtener los álbumes con una duración total superior a la media.
SELECT album.`AlbumId`,album.`Title`,milisegundos.mili
FROM album 
join(
    SELECT `AlbumId`,SUM(`Milliseconds`) as mili 
    FROM track
    GROUP BY `AlbumId`) 
    AS milisegundos USING (`AlbumId`)
     WHERE milisegundos.mili > (SELECT avg(TotalDuration)
    FROM (
        SELECT SUM(Milliseconds) AS TotalDuration
        FROM Track
        GROUP BY AlbumId) as promedio); 

        