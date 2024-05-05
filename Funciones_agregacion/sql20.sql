-- Muestra los países en los que tenemos al menos 5 clientes.
SELECT Country , count(*) FROM Customer group by Country having count(*) >= 5 order by count(*) desc ;