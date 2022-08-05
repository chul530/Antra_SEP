/* 17. Total quantity of stock items sold in 2015, group by country of manufacturing.
*/

select JSON_value(A.CustomFields, '$.CountryOfManufacture') as origin_country, sum(B.Quantity) as sold_qty
from Warehouse.StockItems A join Sales.OrderLines B on B.StockItemID = A.StockItemID 
inner join Sales.Orders C on C.OrderID = B.OrderID
where year(C.OrderDate) = '2015'
group by JSON_value(A.CustomFields, '$.CountryOfManufacture');