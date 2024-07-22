SELECT Aircraft, COUNT(*) AS Bookings
FROM Customers
JOIN CustomerFlights ON Customers.CustomerID = CustomerFlights.CustomerID
JOIN Flights ON CustomerFlights.FlightNumber = Flights.FlightNumber
WHERE CustomerStatus = 'Gold'
GROUP BY Aircraft
ORDER BY Bookings DESC
LIMIT 1;
