-- Consulta 8
-- Canciones del género con más canciones
select genre.`GenreId`,genre.`Name`,lista.cont from genre JOIN (SELECT track.`GenreId`,count(*) as cont FROM track GROUP BY track.`GenreId`) as lista USING (`GenreId`)  ;