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