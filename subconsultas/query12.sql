-- Query 12
-- Ventas totales de cada empleado
SELECT `EmployeeId` ,`FirstName`, `LastName`,subc.total   from employee left join 
(SELECT customer.`SupportRepId`,sum(invoice.`Total`) as total from customer join invoice USING (`CustomerId`)  
GROUP BY customer.`SupportRepId`) as subc on employee.`EmployeeId` = subc.`SupportRepId`;  


