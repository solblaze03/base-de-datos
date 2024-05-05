-- Encuentra los géneros musicales más populares (los más comprados).
SELECT  genre.name, COUNT(*) FROM
invoiceline JOIN track ON invoiceline.TrackId = track.TrackId
JOIN Genre ON track.GenreId = genre.GenreId
GROUP BY genre.name ORDER BY COUNT(*) DESC; 