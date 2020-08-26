--  List of customer ids with the customer’s full name, and address, along with combining their city and country together. 

SELECT CustomerId, Firstname,Address, UPPER(City || ' ' || Country) AS CITY_COUNTRY
FROM Customers

-- New employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name.

SELECT FirstName,LastName,
  LOWER(SUBSTR(FirstName,1,4) || SUBSTR(LastName,1,2)) AS CONCAT_NAME
  FROM Employees

-- List of employees who have worked for the company for 15 or more years using the current date function.

SELECT LastName,FirstName,HireDate, date('now')-HireDate AS EMP_SINCE
FROM Employees
WHERE EMP_SINCE >= 15
ORDER BY LastName ASC

-- Profiling the Customers table

-- PRAGMA table_info(Customers) 
SELECT COUNT(*)
FROM Customers
WHERE Address IS NULL

--  Cities with the most customers and rank in descending order.

SELECT City, COUNT(*)
FROM Customers
GROUP BY CITY
HAVING COUNT(*)=2
ORDER BY City DESC

--  new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.

SELECT  FirstName || LastName || InvoiceId AS NEW_INVOICE_ID
FROM Invoices I INNER JOIN Customers C
ON I.CustomerId=C.CustomerId
WHERE NEW_INVOICE_ID LIKE 'AstridGruber%'

