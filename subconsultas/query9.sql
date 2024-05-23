-- Query 9
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