DROP SCHEMA IF EXISTS airline;
CREATE SCHEMA airline;
USE airline;

CREATE TABLE Customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_name VARCHAR(255) NOT NULL,
	customer_status VARCHAR(50),
	total_customer_mileage INT
);

CREATE TABLE Flights (
	flight_id INT AUTO_INCREMENT PRIMARY KEY,
	flight_number INT NOT NULL,
	aircraft VARCHAR(255),
	total_aircraft_seats INT,
	flight_mileage INT
);

CREATE TABLE CustomerFlights (
	customer_flight_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_id INT,
	flight_id INT,
	FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
	FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);



SELECT COUNT(*) AS TotalFlights FROM flights;
SELECT AVG(flight_mileage) AS AvgFlightDistance FROM flights;
SELECT AVG(total_aircraft_seats) AS AvgNumOfSeats FROM flights;

SELECT customer_status, avg(total_customer_mileage) AS AverageMilesFlown
FROM Customers
GROUP BY customer_status;


SELECT customer_status, max(total_customer_mileage) AS MaxMilesFlown
FROM customers
GROUP BY customer_status;


SELECT count(*) AS TotalBoeingAircraft FROM flights
WHERE aircraft LIKE '%Boeing%';


SELECT * FROM flights
WHERE flight_mileage BETWEEN 300 AND 2000;


SELECT c.customer_status, AVG(f.flight_mileage) AS AvgFlightDistance
FROM customerflights cf
JOIN customers c ON cf.customer_id = c.customer_id
JOIN flights f ON cf.flight_id = f.flight_id 
GROUP BY c.customer_status;


SELECT f.aircraft, count(*) AS BookingCount
FROM customerflights cf
JOIN customers c ON cf.customer_id = c.customer_id 
JOIN flights f ON cf.flight_id = f.flight_id 
WHERE c.customer_status = 'Gold'
GROUP BY f.aircraft 
ORDER BY BookingCount DESC 
LIMIT 1;
















