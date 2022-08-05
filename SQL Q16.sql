/* 16.	List all stock items that are manufactured in China. (Country of Manufacture)
*/

SELECT *
FROM Warehouse.StockItems A 
INNER JOIN Purchasing.Suppliers B ON A.SupplierID = B.SupplierID
INNER JOIN Application.Cities C	ON C.CityID = B.PostalCityID
INNER JOIN Application.StateProvinces D ON C.StateProvinceID = D.StateProvinceID
INNER JOIN Application.Countries E ON D.CountryID = E.CountryID
WHERE CountryName = 'China'