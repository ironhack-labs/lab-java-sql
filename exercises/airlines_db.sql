CREATE DATABASE IF NOT EXISTS exercise2;

CREATE TABLE IF NOT EXISTS exercise2.airlines(
	customer_name VARCHAR(250),
    customer_status VARCHAR(250),
    flight_number VARCHAR(250),
    aircraft VARCHAR(250),
    total_aircraft_seats INT,
    flight_mileage INT,
    total_customer_mileage INT
);

INSERT INTO exercise2.airlines(
								customer_name, customer_status, flight_number, aircraft, 
								total_aircraft_seats, flight_mileage, total_customer_mileage) 
VALUES
	('Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
	('Agustine Riviera', 'Silver', 'DL122', 'Airbus A330', 236, 4370, 115235),
	('Alaina Sepulvida', 'None', 'DL122', 'Airbus A330', 236, 4370, 6008),
	('Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
	('Tom Jones', 'Gold', 'DL122', 'Airbus A330', 236, 4370, 205767),
	('Tom Jones', 'Gold', 'DL53', 'Boeing 777', 264, 2078, 205767),
	('Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
	('Sam Rio', 'None', 'DL143', 'Boeing 747', 400, 135, 2653),
	('Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
	('Tom Jones', 'Gold', 'DL222', 'Boeing 777', 264, 1765, 205767),
	('Jessica James', 'Silver', 'DL143', 'Boeing 747', 400, 135, 127656),
	('Sam Rio', 'None', 'DL143', 'Boeing 747', 400, 135, 2653),
	('Ana Janco', 'Silver', 'DL222', 'Boeing 777', 264, 1765, 136773),
	('Jennifer Cortez', 'Gold', 'DL222', 'Boeing 777', 264, 1765, 300582),
	('Jessica James', 'Silver', 'DL122', 'Airbus A330', 236, 4370, 127656),
	('Sam Rio', 'None', 'DL37', 'Boeing 747', 400, 531, 2653),
	('Christian Janco', 'Silver', 'DL222', 'Boeing 777', 264, 1765, 14642);

-- customer table for normalization
CREATE TABLE IF NOT EXISTS exercise2.customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
    customer VARCHAR(250),
    customer_status VARCHAR(250) ,
    customer_mileage INT,
    
    FOREIGN KEY (customer) REFERENCES exercise2.airlines(customer_name );
    
INSERT INTO exercise2.customers(customer, customer_status, customer_mileage)
SELECT DISTINCT customer_name, customer_status, total_customer_mileage
FROM exercise2.airlines;


CREATE TABLE IF NOT EXISTS exercise2.airlines_norm(
	id INT auto_increment PRIMARY KEY,
    customer_id INT,
	customer_name VARCHAR(250),
    customer_status VARCHAR(250),
    flight_number VARCHAR(250),
    aircraft VARCHAR(250),
    total_aircraft_seats INT,
    flight_mileage INT,
    total_customer_mileage INT
);

INSERT INTO exercise2.airlines_norm(
							customer_id, customer_name, customer_status, flight_number,
							aircraft, total_aircraft_seats, flight_mileage, total_customer_mileage)
                            
	SELECT b.id AS customer_id, a.*
	FROM (SELECT DISTINCT * 
		FROM exercise2.airlines) AS a
	INNER JOIN exercise2.customers AS b
	ON a.customer_name = b.customer;
    
SELECT * FROM exercise2.airlines_norm;
-- Total numbers in the DB
SELECT COUNT(*)
FROM exercise2.airlines_norm;

-- Average flight distance
SELECT AVG(flight_mileage) AS average_flight_distance
FROM exercise2.airlines_norm;

-- Average number of seats
SELECT AVG(total_aircraft_seats) AS average_seats
FROM exercise2.airlines_norm;

-- Average mileage per customer
SELECT  customer_status, AVG(total_customer_mileage) AS average_mileage
FROM exercise2.airlines_norm
GROUP BY customer_status
ORDER BY customer_status;

-- max mileage per customer
SELECT  customer_status, MAX(total_customer_mileage) AS max_mileage
FROM exercise2.airlines_norm
GROUP BY customer_status
ORDER BY customer_status;

-- Boeing
SELECT COUNT(*)
FROM exercise2.airlines_norm
WHERE aircraft LIKE '%Boeing%';

-- flights between 300 and 2000 miles
SELECT *
FROM exercise2.airlines_norm
WHERE flight_mileage BETWEEN 300 AND 2000
ORDER BY flight_mileage;

-- Grouped by custoemr
SELECT customer_name, AVG(total_customer_mileage) AS average_mileage
FROM exercise2.airlines_norm
GROUP BY customer_name
ORDER BY customer_name;

-- Grouped by often 


