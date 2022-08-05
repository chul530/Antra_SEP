/* 10.	List of Customers and their phone number, together with the primary contact person¡¯s name, to whom we did not sell more than 10  mugs (search by name) in the year 2016.
*/

SELECT A.CustomerName, A.PhoneNumber, B.FullName, C.QTY
FROM Sales.Customers A	
INNER JOIN Application.People B	ON A.PrimaryContactPersonID = B.PersonID

INNER JOIN (
SELECT CustomerID, SUM(Quantity) QTY
FROM Sales.Invoices	A	
INNER JOIN Sales.InvoiceLines B ON A.InvoiceID = B.InvoiceID
INNER JOIN Warehouse.StockItems C ON B.StockItemID = C.StockItemID
WHERE StockItemName LIKE '%mug%' AND YEAR(InvoiceDate) = 2016 
GROUP BY CustomerID) C ON C.CustomerID = A.CustomerID
WHERE C.QTY <= 10