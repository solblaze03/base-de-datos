-- Query 10
-- Muestra los clientes junto con la cantidad total de dinero gastado por cada uno
-- en compras.
SELECT DISTINCT customerID,suma.total FROM invoice JOIN (SELECT `CustomerId`,SUM(invoice.`Total`) as total FROM invoice GROUP BY invoice.`CustomerId` ) as suma USING (`CustomerId`);