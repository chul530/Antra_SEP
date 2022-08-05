/* 18.	Create a view that shows the total quantity of stock items of each stock group sold (in orders) by year 2013-2017. [Stock Group Name, 2013, 2014, 2015, 2016, 2017]
*/

CREATE VIEW [YEARWISEGROUPSTOCK] AS

SELECT	D.StockGroupName, 
SUM(CASE WHEN YEAR(A.InvoiceDate)=2013 THEN Quantity ELSE 0 END) AS [2013],
SUM(CASE WHEN YEAR(A.InvoiceDate)=2014 THEN Quantity ELSE 0 END) AS [2014],
SUM(CASE WHEN YEAR(A.InvoiceDate)=2015 THEN Quantity ELSE 0 END) AS [2015],
SUM(CASE WHEN YEAR(A.InvoiceDate)=2016 THEN Quantity ELSE 0 END) AS [2016],
SUM(CASE WHEN YEAR(A.InvoiceDate)=2017 THEN Quantity ELSE 0 END) AS [2017]

FROM	Sales.Invoices	A	
INNER JOIN Sales.InvoiceLines B ON A.InvoiceID = B.InvoiceID
INNER JOIN Warehouse.StockItemStockGroups C	ON B.StockItemID = C.StockItemID
INNER JOIN Warehouse.StockGroups D ON C.StockGroupID = D.StockGroupID
GROUP BY D.StockGroupName;