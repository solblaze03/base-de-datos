-- Listar las 5 últimas facturas del cliente cuyo email es “emma_jones@hotmail.com”
SELECT subc.Country, subc.Email
FROM (
        SELECT *
        FROM Customer
            JOIN Invoice USING (`CustomerId`)
        WHERE
            Email = "emma_jones@hotmail.com"
        ORDER BY Invoice.InvoiceDate desc
        limit 5
    ) as subc;