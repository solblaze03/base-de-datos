-- Consulta 13
-- Álbumes junto al número de canciones en cada uno.

SELECT id, titulo, cont
FROM (
        SELECT album.`ArtistId` AS id, album.`Title` AS titulo, count(*) AS cont
        FROM album
            JOIN track USING (`AlbumId`)
        GROUP BY
            titulo, id
    ) AS subc;