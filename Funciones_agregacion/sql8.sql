-- Muestra los nombres de los 15 empleados más jóvenes junto a los nombres de sus supervisores, si los tienen.
-- SELECT * FROM Employee;
SELECT   t2.FirstName as Empleado, t2.BirthDate as menores,
t2.ReportsTo ,t1.FirstName as "Supervisor" ,
t1.EmployeeId as  "Id_supervisor" 
FROM Employee as t1 join Employee as t2 
on t2.ReportsTo = t1.EmployeeId order by t2.BirthDate desc limit 5;