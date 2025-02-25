CREATE SCHEMA airline_db;
USE airline_db;

-- DDL

CREATE TABLE customers (
	customer_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR (255),
	status VARCHAR (50),
	total_mileage INT,
	PRIMARY KEY (customer_id)    
);

CREATE TABLE aircraft (
	aircraft VARCHAR (100) NOT NULL,
	total_seats INT,
	PRIMARY KEY (aircraft)
);

CREATE TABLE flights (
	flight_number VARCHAR (100) NOT NULL,
	aircraft VARCHAR (100) NOT NULL,
	flight_mileage INT,
	PRIMARY KEY (flight_number),
	FOREIGN KEY (aircraft) REFERENCES aircraft(aircraft)
);

CREATE TABLE customers_flights (
	id INT NOT NULL AUTO_INCREMENT,
	customer_id INT NOT NULL,
	flight_number VARCHAR (100) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (flight_number) REFERENCES flights(flight_number)
);

-- INSERTS

INSERT INTO customers (name, status, total_mileage) VALUES 
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

INSERT INTO aircraft (aircraft, total_seats) VALUES
("Boeing 747", 400),
("Airbus A330", 236),
("Boeing 777", 264);

INSERT INTO flights (flight_number, aircraft, flight_mileage) VALUES
("DL143", "Boeing 747", 135),
("DL122", "Airbus A330", 4370),
("DL53", "Boeing 777", 2078),
("DL222", "Boeing 777", 1765),
("DL37", "Boeing 747", 531);

INSERT INTO customers_flights (customer_id, flight_number) VALUES
(1, "DL143"),
(1, "DL122"),
(2, "DL122"),
(3, "DL122"),
(3, "DL53"),
(4, "DL143"),
(3, "DL222"),
(5, "DL143"),
(6, "DL222"),
(7, "DL222"),
(5, "DL122"),
(4, "DL37"),
(8, "DL222");


-- SQL SCRIPTS

-- 3. Get the total number of flights in the database

SELECT COUNT(*) AS total_flights FROM flights; -- TOTAL TYPES OF FLIGHTS
 
SELECT COUNT(*) AS total_flights FROM customers_flights; -- TOTAL CUSTOMERS FLIGHTS

-- 4. Get the average flight distance

SELECT AVG(flight_mileage) AS average_flight_distance FROM flights;

-- 5. Get the average number of seats

SELECT AVG(total_seats) AS average_number_seats FROM aircraft;

-- 6. Get the average number of miles flown by customers grouped by status

SELECT AVG(total_mileage) AS average_miles_customer, status 
FROM customers 
GROUP BY status;

-- 7. Get the maximum number of miles flown by customers grouped by status

SELECT MAX(total_mileage) AS max_miles_customer, status 
FROM customers 
GROUP BY status;

-- 8. Get the total number of aircraft with a name containing Boeing

SELECT COUNT(*) AS total_boeing_aircraft 
FROM aircraft 
WHERE aircraft LIKE '%Boeing%';

-- 9. Find all flights with a distance between 300 and 2000 miles

SELECT * 
FROM flights 
WHERE flight_mileage BETWEEN 300 AND 2000;

-- 10. Find the average flight distance booked grouped by customer status (this should require a join)

SELECT AVG(f.flight_mileage) AS average_distance, c.status
FROM customers_flights cf 	
	LEFT JOIN flights f ON cf.flight_number = f.flight_number
	LEFT JOIN customers c ON cf.customer_id = c.customer_id
GROUP BY status;

-- 11. Find the most often booked aircraft by gold status members (this should require a join)

SELECT f.aircraft, COUNT(*) AS flight_count, c.status
FROM customers_flights cf
	LEFT JOIN flights f ON cf.flight_number = f.flight_number
	LEFT JOIN customers c ON cf.customer_id = c.customer_id
WHERE c.status = 'Gold'
GROUP BY f.aircraft
ORDER BY flight_count DESC
LIMIT 1;

