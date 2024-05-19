-- Consulta 13
-- Álbumes junto al número de canciones en cada uno.

SELECT id ,titulo, cont  from (SELECT album.`ArtistId` as id, album.`Title` as titulo , count(*) as cont from album JOIN track USING(`AlbumId`) GROUP BY titulo,id) as subc;