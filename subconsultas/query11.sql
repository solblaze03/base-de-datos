-- Query 11
-- Obtener empleados y el número de clientes a los que sirve cada uno de ellos.
SELECT
    employee.`ReportsTo`,
    `FirstName`,
    `LastName`,
    (
        SELECT count(DISTINCT customer.CustomerId)
        FROM customer
        WHERE
            customer.`SupportRepId` = employee.`EmployeeId`
    ) AS cont
FROM employee;