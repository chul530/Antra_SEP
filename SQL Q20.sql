/* 20.	Create a function, input: order id; return: total of that order. List invoices and use that function to attach the order total to the other fields of invoices. 
*/

CREATE FUNCTION ORDERTOTAL (@ORDERID INT)
RETURNS INT
AS
BEGIN
DECLARE @OUTPUT INT

SELECT @OUTPUT = SUM((Quantity * UnitPrice) + (((Quantity * UnitPrice)/100) * TaxRate))
FROM Sales.Orders A INNER JOIN Sales.OrderLines B ON A.OrderID = B.OrderID 
WHERE A.OrderID = @ORDERID
GROUP BY A.OrderID

RETURN @OUTPUT
END
