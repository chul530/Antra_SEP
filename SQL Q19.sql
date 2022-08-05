/* 19. Create a view that shows the total quantity of stock items of each stock group sold (in orders) by year 2013-2017. [Year, Stock Group Name1, Stock Group Name2, Stock Group Name3, ¡¦ , Stock Group Name10] 
*/

CREATE VIEW [YEARWISEGROUPSTOCK2] AS

SELECT	YEAR(A.InvoiceDate) AS YEAR,	
SUM(CASE WHEN C.StockGroupID=1 THEN Quantity ELSE 0 END) AS [Novelty Items],
SUM(CASE WHEN C.StockGroupID=2 THEN Quantity ELSE 0 END) AS [Mugs],
SUM(CASE WHEN C.StockGroupID=3 THEN Quantity ELSE 0 END) AS [T-Shirts],
SUM(CASE WHEN C.StockGroupID=4 THEN Quantity ELSE 0 END) AS [Toys],
SUM(CASE WHEN C.StockGroupID=5 THEN Quantity ELSE 0 END) AS [Clothing],
SUM(CASE WHEN C.StockGroupID=6 THEN Quantity ELSE 0 END) AS [Furry Footwear],
SUM(CASE WHEN C.StockGroupID=7 THEN Quantity ELSE 0 END) AS [Computing Novelties],
SUM(CASE WHEN C.StockGroupID=8 THEN Quantity ELSE 0 END) AS [Packaging Materials],
SUM(CASE WHEN C.StockGroupID=9 THEN Quantity ELSE 0 END) AS [USB Novelties]
FROM	Sales.Invoices	A	
INNER JOIN Sales.InvoiceLines B	ON A.InvoiceID = B.InvoiceID
INNER JOIN Warehouse.StockItemStockGroups C	ON B.StockItemID = C.StockItemID
INNER JOIN Warehouse.StockGroups D ON C.StockGroupID = D.StockGroupID
GROUP BY YEAR(A.InvoiceDate);