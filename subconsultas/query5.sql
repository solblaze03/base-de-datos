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