USE chinook;
SHOW TABLES;
#Top 5 Customers by Spending
SELECT 
    c.FirstName,
    c.LastName,
    SUM(i.Total) AS total_spent
FROM customer c
INNER JOIN invoice i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY total_spent DESC
LIMIT 5;

#Revenue by Country
SELECT 
    c.Country,
    SUM(i.Total) AS total_revenue
FROM customer c
INNER JOIN invoice i
ON c.CustomerId = i.CustomerId
GROUP BY c.Country
ORDER BY total_revenue DESC;

#Customers with No Purchases (LEFT JOIN)
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM customer c
LEFT JOIN invoice i
ON c.CustomerId = i.CustomerId

#Top 5 Artists by Sales (Multi-Table JOIN)
SELECT 
    ar.Name AS artist_name,
    SUM(il.Quantity) AS total_tracks_sold
FROM invoiceline il
INNER JOIN track t ON il.TrackId = t.TrackId
INNER JOIN album al ON t.AlbumId = al.AlbumId
INNER JOIN artist ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY total_tracks_sold DESC
LIMIT 5;

#



