-- Consulta 8
-- Canciones del género con más canciones
SELECT genre.`GenreId`, genre.`Name`, lista.cont
FROM genre
    JOIN (
        SELECT track.`GenreId`, count(*) AS cont
        FROM track
        GROUP BY
            track.`GenreId`
    ) AS lista USING (`GenreId`);