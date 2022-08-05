/* 4. List of Stock Items and total quantity for each stock item in Purchase Orders in Year 2013. 
*/

USE [WideWorldImporters]
GO

SELECT StockItemName, SUM(QuantityPerOuter*ReceivedOuters) QUANTITY
FROM Purchasing.PurchaseOrders A	
INNER JOIN Purchasing.PurchaseOrderLines B ON A.PurchaseOrderID = B.PurchaseOrderID
INNER JOIN Warehouse.StockItems C ON C.StockItemID = B.StockItemID
WHERE YEAR(A.OrderDate) =2013 
GROUP BY StockItemName

