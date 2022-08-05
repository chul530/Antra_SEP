/*9.	List of StockItems that the company purchased more than sold in the year of 2015.
*/

SELECT StockItemName, QTYPURCHASED, QTYSOLD
FROM Warehouse.StockItems A INNER JOIN (

SELECT StockItemID, SUM(Quantity) AS QTYSOLD
FROM Sales.Invoices	A	INNER JOIN Sales.InvoiceLines B ON A.InvoiceID = B.InvoiceID
WHERE YEAR(InvoiceDate) =2015
GROUP BY StockItemID) B ON A.StockItemID = B.StockItemID
LEFT OUTER JOIN (
SELECT B.StockItemID, SUM(QuantityPerOuter*ReceivedOuters) QTYPURCHASED
FROM Purchasing.PurchaseOrders A	
INNER JOIN Purchasing.PurchaseOrderLines B	ON A.PurchaseOrderID = B.PurchaseOrderID
INNER JOIN Warehouse.StockItems C ON B.StockItemID = C.StockItemID
WHERE YEAR(A.OrderDate) = 2015
GROUP BY B.StockItemID) C ON A.StockItemID = C.StockItemID
WHERE C.QTYPURCHASED > B.QTYSOLD