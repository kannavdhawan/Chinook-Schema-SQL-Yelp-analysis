-- Albums does the artist Led Zeppelin have.

SELECT COUNT(*) AS NAME_COUNT
FROM artists INNER JOIN albums
ON artists.ArtistId=albums.ArtistId
WHERE artists.Name='Led Zeppelin'

-- List of album titles and the unit prices for the artist "Audioslave".

SELECT UnitPrice,Title
FROM tracks INNER JOIN albums
ON tracks.AlbumId=albums.AlbumID
WHERE tracks.AlbumId IN (SELECT 
      AlbumId
  FROM albums
  WHERE ArtistId IN(SELECT 
      ArtistId 
  FROM artists
  WHERE Name ='Audioslave'))

-- First and last name of any customer who does not have an invoice.

SELECT FirstName, LastName 
FROM customers
WHERE CustomerId NOT IN(SELECT 
        CustomerId
        FROM invoices)

-- Total price for each album.

SELECT Title,SUM(tracks.UnitPrice)
FROM albums INNER JOIN tracks
ON albums.AlbumId=tracks.AlbumId
GROUP BY tracks.AlbumId

-- Cartesian join to the invoice and invoice items table.

SELECT COUNT(*) 
FROM invoices CROSS JOIN invoice_items

-- names of all the tracks for the album "Californication".

SELECT Name
FROM Tracks
WHERE AlbumId IN(SELECT 
      AlbumId 
      FROM Albums
      WHERE Title='Californication')

--  Total number of invoices for each customer along with the customer's full name, city and email.

SELECT FirstName, 
      LastName,
      City,
      Email,
      COUNT(InvoiceId)
FROM Customers INNER JOIN Invoices
ON Customers.CustomerId=Invoices.CustomerId
GROUP BY Invoices.CustomerId

-- Retrieving track name, album, artistID, and trackID for all the albums.

SELECT Name AS TRACK_NAME,
       Title AS ALBUM_NAME,
       ArtistId,
       TrackId
FROM Albums LEFT JOIN Tracks
-- We can flip albums and tracks and still get the same result.
ON Albums.AlbumId=Tracks.AlbumId

-- Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT e.LastName AS EMPLOYEE, m.LastName AS MANAGER
FROM Employees e INNER JOIN Employees m
ON e.EmployeeId=m.ReportsTo

-- Name and ID of the artists who do not have albums.

SELECT ArtistId,
       Name 
FROM Artists
WHERE ArtistId NOT IN( SELECT ArtistId
    FROM Albums)

-- UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

SELECT FirstName,LastName
FROM Employees
UNION 
SELECT FirstName,LastName
From Customers
ORDER BY LastName DESC

-- Any customers who have a different city listed in their billing city versus their customer city.

SELECT Customers.CustomerId 
FROM Customers INNER JOIN Invoices
ON Customers.CustomerId=Invoices.CustomerId
WHERE Customers.City<>Invoices.BillingCity