-- Query 11
-- Obtener empleados y el número de clientes a los que sirve cada uno de ellos.
Select employee.`ReportsTo`,`FirstName`,`LastName` , (SELECT count(DISTINCT customer.CustomerId) from customer where customer.`SupportRepId` = employee.`EmployeeId`) as cont from employee;  

