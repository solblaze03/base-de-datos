SELECT p1.CodiPeli, p1.Titol as "Pelicula",
p2.CodiPeli ,p2.Titol as "Segunda parte" 
FROM PELICULA as p1 join PELICULA as p2 ON p1.CodiPeli = p2.SegonaPart where p2.SegonaPart is not null;

