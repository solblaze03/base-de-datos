-- Listar las 5 últimas facturas del cliente cuyo email es “emma_jones@hotmail.com”
SELECT * FROM Customer
JOIN Invoice
ON Invoice.CustomerId = Customer.CustomerId
WHERE Email = "emma_jones@hotmail.com"
ORDER BY Invoice.InvoiceDate
desc limit 5;

SELECT Country , count(*) FROM Customer group by Country having count(*) >= 5 order by count(*) desc ; 

SELECT * from `Customer`;