USE airline_db;

-- get the total number of flights
SELECT COUNT(*) AS TotalFlights FROM Flights;

-- get the average flight distance
SELECT AVG(aircraft_mileage) AS AverageDistance FROM Flights;

-- get the average number of seats
SELECT AVG(aircraft_seats) AS AverageSeats FROM Aircrafts;

-- get the average number of miles flown by customers grouped by status
SELECT customer_status, AVG(customer_mileage) FROM Customers GROUP BY customer_status;

-- get the maximum number of miles flown by customers grouped by status
SELECT customer_status, MAX(customer_mileage) FROM Customers GROUP BY customer_status;

-- get the total number of aircraft with a name containing Boeing
SELECT COUNT(*) FROM Aircrafts WHERE aircraft_name LIKE "%Boeing%";

-- find all flights with a distance between 300 and 2000 miles
SELECT * FROM Flights WHERE aircraft_mileage BETWEEN 300 AND 2000;

-- find the average flight distance booked grouped by customer status
SELECT Customers.customer_status, AVG(Flights.aircraft_mileage) AS AverageDistance FROM Customers
INNER JOIN Aircrafts ON Customers.id = Aircrafts.customer
INNER JOIN Flights ON Aircrafts.flight = Flights.id
GROUP BY Customers.customer_status;

-- find the most often booked aircraft by gold status members
SELECT Flights.aircraft_name, COUNT(Aircrafts.flight) AS BookingFrequency
FROM Customers
INNER JOIN Aircrafts ON Customers.id = Aircrafts.customer
INNER JOIN Flights ON Aircrafts.flight = Flights.id
WHERE Customers.customer_status = "gold"
GROUP BY Flights.aircraft_name
ORDER BY BookingFrequency DESC
LIMIT 1;