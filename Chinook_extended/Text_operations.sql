--  List of customer ids with the customer’s full name, and address, along with combining their city and country together. 

SELECT CustomerId, Firstname,Address, UPPER(City || ' ' || Country) AS CITY_COUNTRY
FROM Customers

-- New employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name.

SELECT FirstName,LastName,
  LOWER(SUBSTR(FirstName,1,4) || SUBSTR(LastName,1,2)) AS CONCAT_NAME
  FROM Employees

-- List of employees who have worked for the company for 15 or more years using the current date function.

