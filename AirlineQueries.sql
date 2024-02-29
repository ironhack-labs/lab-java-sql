SELECT COUNT(*) 
FROM Flights;

SELECT AVG(Mileage) 
FROM Flights;

SELECT AVG(Seats) 
FROM Aircrafts;

SELECT Status, AVG(TotalMileage) 
FROM Customers 
GROUP BY Status;

SELECT Status, MAX(TotalMileage) 
FROM Customers
GROUP BY Status;


SELECT COUNT(*) 
FROM Aircrafts
WHERE NAME LIKE '%Boeing%';


SELECT ID, FlightNumber, Mileage
FROM Flights
WHERE Mileage BETWEEN 300 AND 2000;


SELECT Customers.Status, AVG(Flights.Mileage)
FROM Tickets
INNER JOIN Customers ON Tickets.CustomerID = Customers.ID
INNER JOIN Flights ON Tickets.FlightID = Flights.ID
GROUP BY Customers.Status;

SELECT Aircrafts.Name, COUNT(*) AS Count
FROM Aircrafts
INNER JOIN Flights ON Aircrafts.ID = Flights.AircraftID
INNER JOIN Tickets ON Flights.ID = Tickets.FlightID
INNER JOIN Customers ON Tickets.CustomerID = Customers.ID
WHERE Customers.Status = 'Gold'
GROUP BY Aircrafts.Name
ORDER BY Count DESC
LIMIT 1;