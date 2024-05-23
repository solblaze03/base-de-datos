-- Consulta 6
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