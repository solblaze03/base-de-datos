-- -- Query 14
-- Obtener el nombre del álbum más reciente de cada artista. Pista: los álbumes
-- más antiguos tienen un ID más bajo.
SELECT album.`ArtistId`, album.`Title`,subc.artista
FROM album
JOIN (
    SELECT artistid, MAX(AlbumId) AS ultimo,artist.`Name` as artista
    FROM album join artist  USING(`ArtistId`)
    GROUP BY artistid
) as subc  ON album.artistid = subc.artistid AND album.albumid = subc.ultimo;