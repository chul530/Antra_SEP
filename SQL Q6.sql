/* 6. List of stock items that are not sold to the state of Alabama and Georgia in 2014.
*/

USE [WideWorldImporters]
GO

SELECT StockItemName
FROM Warehouse.StockItems
WHERE StockItemID NOT IN (
SELECT DISTINCT StockItemID
FROM Sales.Invoices	A	
INNER JOIN Sales.InvoiceLines B	ON A.InvoiceID = B.InvoiceID
INNER JOIN Sales.Customers C ON A.CustomerID = c.CustomerID
INNER JOIN Application.Cities D	ON C.DeliveryCityID = D.CityID
INNER JOIN Application.StateProvinces E ON D.StateProvinceID = E.StateProvinceID
WHERE YEAR(InvoiceDate) =2014 AND E.StateProvinceName IN ('Alabama','Georgia')
)
