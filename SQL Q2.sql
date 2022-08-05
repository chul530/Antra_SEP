/* 2. If the customer's primary contact person has the same phone number as the customer¡¯s phone number, list the customer companies. 
*/

USE [WideWorldImporters]
GO

SELECT CustomerName
FROM Sales.Customers	INNER JOIN Application.People ON PrimaryContactPersonID = PersonID
WHERE Sales.Customers.PhoneNumber = Application.People.PhoneNumber
