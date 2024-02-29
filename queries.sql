SELECT COUNT(*) FROM airline.flights;
SELECT AVG(FlightMileage) FROM airline.flights;
SELECT AVG(TotalAircraftSeats) FROM airline.aircfratfs;
SELECT AVG(CustomerMileage) FROM airline.customers GROUP BY CustomerStatus;
SELECT MAX(CustomerMileage) FROM airline.customers group by CustomerStatus;
SELECT COUNT(*) FROM Aircrafts WHERE airline.aircraft LIKE "Boeing%";
SELECT * FROM airline.flights WHERE FlightMileage BETWEEN 200 AND 300;
SELECT c.CustomerStatus, AVG(f.FlightMileage) FROM airline.CustomersFlights cf JOIN airline.Flights f ON cf.FlightID = f.ID
JOIN airline.Customers c ON cf.CustomerID = c.ID GROUP BY c.CustomerStatus;
SELECT COUNT(cf.FlightID) FROM airline.CustomersFlights cf JOIN airline.Flights f ON cf.FlightID = f.ID JOIN airline.Customers c ON cf.CustomerID = c.ID
WHERE c.CustomerStatus LIKE "GOLD";
