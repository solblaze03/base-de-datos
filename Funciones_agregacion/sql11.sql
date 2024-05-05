-- Muestra qué clientes han realizado compras por valores superiores a 10€, ordenados por apellido.
SELECT c.LastName, i.Total FROM Customer AS c JOIN Invoice AS i ON c.Customerid = i.Customerid WHERE i.Total > 10 order by c.LastName asc;