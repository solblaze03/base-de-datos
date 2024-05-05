SELECT  I.InvoiceDate,C.FirstName,
 I.BillingAddress, C.PostalCode, C.Country,
 I.Total FROM  Invoice as I join Customer as C on I.CustomerId = C.CustomerId where City like "Berlin";