-- Muestra las listas de reproducción cuyo nombre comienza por C, junto a todas
-- sus canciones, ordenadas por álbum y por duración

SELECT pl.Name , pl.PlaylistId,plt.PlaylistId as p2, t.TrackId,t.AlbumId, t.Name , t.Milliseconds FROM Playlist as pl join PlaylistTrack as plt 
on pl.PlaylistId = plt.PlaylistId  
join Track as t 
on t.TrackId = plt.TrackId 
where pl.Name like "C%" order by t.Milliseconds asc;