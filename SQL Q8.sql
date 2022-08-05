/*8.	List of States and Avg dates for processing (confirmed delivery date ?order date) by month.
*/

SELECT StateProvinceName, MONTH(OrderDate) AS MONTHNO, AVG(DATEDIFF(DAY, OrderDate, ConfirmedDeliveryTime)) AVGDATE
FROM Sales.Invoices	A	
INNER JOIN Sales.InvoiceLines B ON A.InvoiceID = B.InvoiceID
INNER JOIN Sales.Customers C ON A.CustomerID = c.CustomerID
INNER JOIN Application.Cities D ON C.DeliveryCityID = D.CityID
INNER JOIN Application.StateProvinces E ON D.StateProvinceID = E.StateProvinceID
INNER JOIN Sales.Orders	F ON A.OrderID = F.OrderID
GROUP BY StateProvinceName, MONTH(OrderDate)
