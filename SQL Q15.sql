/* 15.	List any orders that had more than one delivery attempt (located in invoice table).
*/

SELECT	*
FROM	Sales.Orders A INNER JOIN SALES.Invoices B ON A.OrderID = B.OrderID
WHERE	ReturnedDeliveryData LIKE '%receiver not present%'