-- Muestra todos los artistas junto a sus álbumes.
SELECT Album.Title as Album , Artist.Name as Artista FROM Album join Artist on Album.ArtistId = Artist.ArtistId;