/* 14.	List of Cities in the US and the stock item that the city got the most deliveries in 2016. If the city did not purchase any stock items in 2016, print ¡°No Sales¡±.
*/

SELECT A.CityName, B.StockItemID, ISNULL(CAST(B.QTY AS varchar),'NOSALES') QTY
FROM Application.Cities	A 
LEFT OUTER JOIN (
SELECT B.StockItemID, D.CityID, SUM(Quantity) QTY
FROM Sales.Invoices	A	
INNER JOIN Sales.InvoiceLines B ON A.InvoiceID = B.InvoiceID
INNER JOIN Sales.Customers C ON A.CustomerID = c.CustomerID
RIGHT OUTER JOIN Application.Cities D ON C.DeliveryCityID = D.CityID
WHERE YEAR(ConfirmedDeliveryTime) = 2016
GROUP BY B.StockItemID, D.CityID) B	ON A.CityID = B.CityID
INNER JOIN	Application.StateProvinces	C ON A.StateProvinceID = C.StateProvinceID
INNER JOIN Application.Countries D ON C.CountryID = D.CountryID
WHERE CountryName = 'United States'