-- Consulta 3
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