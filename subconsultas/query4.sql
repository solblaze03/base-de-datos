--Obtener la información de los clientes que han realizado compras
-- superiores a
-- 20€
SELECT *
from customer
where
    customer.`CustomerId` in (
        SELECT `CustomerId`
        from invoice
        where
            total > 20
    );