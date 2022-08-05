/* 5. List of stock items that have at least 10 characters in description. 
*/

USE [WideWorldImporters]
GO

SELECT StockItemName
FROM Warehouse.StockItems A		
INNER JOIN Sales.InvoiceLines B ON A.StockItemID = B.StockItemID
INNER JOIN Sales.Invoices C	ON B.InvoiceID = C.InvoiceID
WHERE LEN(Description) >=10