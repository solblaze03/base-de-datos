-- Query 12
-- Ventas totales de cada empleado
SELECT
    `EmployeeId`,
    `FirstName`,
    `LastName`,
    subc.total
FROM employee
    LEFT JOIN (
        SELECT customer.`SupportRepId`, sum(invoice.`Total`) AS total
        FROM customer
            JOIN invoice USING (`CustomerId`)
        GROUP BY
            customer.`SupportRepId`
    ) AS subc ON employee.`EmployeeId` = subc.`SupportRepId`;