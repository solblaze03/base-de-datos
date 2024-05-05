-- Muestra el número de países donde tenemos clientes
SELECT count(distinct Country) as "Paises Clientes" FROM Customer;