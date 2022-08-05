/* 1. List of Persons¡¯ full name, all their fax and phone numbers, as well as the phone number and fax of the company they are working for (if any). 
*/

SELECT FullName, FaxNumber, PhoneNumber
FROM Application.People
 WHERE PhoneNumber is not null and FaxNumber IS NOT NULL