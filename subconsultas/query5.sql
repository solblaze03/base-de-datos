-- Álbumes que tienen más de 15 canciones, junto a su artista.

SELECT title,album.`ArtistId` from album WHERE `AlbumId` IN(select `AlbumId` from track GROUP BY track.`AlbumId` having count(*) > 15)

