/* 12.	List all the Order Detail (Stock Item name, delivery address, delivery state, city, country, customer name, customer contact person name, customer phone, quantity) for the date of 2014-07-01. Info should be relevant to that date.
*/

SELECT StockItemName, (DeliveryAddressLine1 + '' + DeliveryAddressLine2) AS DELIVERYADDRESS, StateProvinceName, CityName, CountryName, CustomerName, FullName AS CONTACTPERSONNAME, D.PhoneNumber, Quantity
FROM Sales.Orders A 
INNER JOIN Sales.OrderLines B ON A.OrderID = B.OrderID
INNER JOIN Warehouse.StockItems C ON B.StockItemID = C.StockItemID
INNER JOIN Sales.Customers D ON A.CustomerID = D.CustomerID
INNER JOIN Application.Cities E	ON D.DeliveryCityID = E.CityID
INNER JOIN Application.StateProvinces F ON E.StateProvinceID = F.StateProvinceID
INNER JOIN Application.Countries G ON F.CountryID = G.CountryID
INNER JOIN Application.People H	ON A.ContactPersonID = H.PersonID
WHERE OrderDate = '2014-07-01'