/* 3. List of customers to whom we made a sale prior to 2016 but no sale since 2016-01-01.
*/

USE [WideWorldImporters]
GO

SELECT CustomerName 
FROM Sales.Invoices A INNER JOIN Sales.Customers B ON A.CustomerID = B.CustomerID
WHERE InvoiceDate < '2016-01-01' AND A.CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Sales.Invoices C WHERE C.InvoiceDate >= '2016-01-01')