-- Muestra los álbumes ordenados por el número de canciones que tiene cada uno.
SELECT Album.Title,count(*) FROM Album join Track on Album.AlbumId = Track.AlbumId group by Title order by count(*) desc;