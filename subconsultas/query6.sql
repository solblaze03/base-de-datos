-- Consulta 6
-- Obtener los álbumes con un número de canciones superiores a la media.

select `Title` from album join (Select `AlbumId`,count(*) from track GROUP BY `AlbumId` HAVING COUNT(*) > 5) as albume USING(`AlbumId`);