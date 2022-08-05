/* 13.	List of stock item groups and total quantity purchased, total quantity sold, and the remaining stock quantity (quantity purchased – quantity sold)
*/

SELECT A.StockGroupName, C.QTYPURCHASED, B.QTYSOLD, (C.QTYPURCHASED - B.QTYSOLD) AS REMAININGSTOCK
FROM Warehouse.StockGroups A 

INNER JOIN (
SELECT	C.StockGroupID, SUM(Quantity) AS QTYSOLD
FROM	Sales.Invoices	A	
INNER JOIN Sales.InvoiceLines B	ON A.InvoiceID = B.InvoiceID
INNER JOIN Warehouse.StockItemStockGroups C	ON B.StockItemID = C.StockItemID
INNER JOIN Warehouse.StockGroups D ON C.StockGroupID = D.StockGroupID
GROUP BY C.StockGroupID) B ON A.StockGroupID = B.StockGroupID

INNER JOIN (
SELECT	D.StockGroupID, SUM(QuantityPerOuter*ReceivedOuters) QTYPURCHASED
FROM	Purchasing.PurchaseOrders A	
INNER JOIN Purchasing.PurchaseOrderLines B ON A.PurchaseOrderID = B.PurchaseOrderID
INNER JOIN Warehouse.StockItems C ON B.StockItemID = C.StockItemID
INNER JOIN Warehouse.StockItemStockGroups D	ON B.StockItemID = D.StockItemID
INNER JOIN Warehouse.StockGroups E ON D.StockGroupID = E.StockGroupID
GROUP BY D.StockGroupID) C ON A.StockGroupID = C.StockGroupID
