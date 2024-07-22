SELECT CustomerStatus, AVG(FlightMileage) AS AverageFlightDistance
FROM Customers
JOIN CustomerFlights ON Customers.CustomerID = CustomerFlights.CustomerID
JOIN Flights ON CustomerFlights.FlightNumber = Flights.FlightNumber
GROUP BY CustomerStatus;
