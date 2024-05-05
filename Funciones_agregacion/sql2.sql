-- Muestra las facturas del primer trimestre de este año.
SELECT * FROM Invoice WHERE year(InvoiceDate) like year(now())  and month(InvoiceDate) in (01,02,03);