-- Tracks that have a length of 5,000,000 milliseconds or more.

SELECT TrackId
FROM Tracks
WHERE Milliseconds>=5000000 ;

-- Invoices whose total is between $5 and $15 dollars.
SELECT InvoiceID 
FROM Invoices
WHERE Total BETWEEN 5 AND 15;
