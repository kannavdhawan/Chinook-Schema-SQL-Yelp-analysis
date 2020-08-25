-- Tracks that have a length of 5,000,000 milliseconds or more.
SELECT TrackId
FROM Tracks
WHERE Milliseconds>=5000000 
;

-- Invoices whose total is between $5 and $15 dollars.
SELECT InvoiceID 
FROM Invoices
WHERE Total BETWEEN 5 AND 15
;

-- customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
SELECT *
FROM Customers
WHERE State IN ('RJ','DF','AB', 'BC', 'CA', 'WA', 'NY')
;

-- Invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
SELECT * 
FROM Invoices 
WHERE (CustomerID=56 OR CustomerID=58) AND Total BETWEEN 1.00 AND 5.00

--  Tracks whose name starts with 'All'.
SELECT TrackID 
FROM Tracks
WHERE Name LIKE 'All%';

-- Customer emails that start with "J" and are from gmail.com.
SELECT * 
FROM Customers 
WHERE Email LIKE 'J%@gmail.com'
