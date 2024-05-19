-- Consulta 3
-- Mostrar las listas de reproducción en las que hay canciones de reggae.
SELECT DISTINCT( playlist.`PlaylistId`), playlist.name from playlist JOIN playlisttrack USING (`PlaylistId`) 
WHERE playlisttrack.`TrackId`
in (SELECT track.`TrackId` FROM track JOIN genre USING (`GenreId`) where genre.`Name` = "Reggae" );


