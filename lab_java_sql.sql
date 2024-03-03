CREATE DATABASE IF NOT EXISTS lab_java_sql;

-- Switch to the new database
USE lab_java_sql;

-- Create Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(50) NOT NULL
);

-- Create Flights Table
CREATE TABLE IF NOT EXISTS Flights (
    flight_number VARCHAR(10) PRIMARY KEY,
    aircraft_type VARCHAR(50) NOT NULL,
    total_aircraft_seats INT NOT NULL,
    flight_mileage INT NOT NULL
);

SELECT COUNT(*) AS total_flights
FROM Flights;




-- Create CustomerFlights Table
CREATE TABLE IF NOT EXISTS CustomerFlights (
    customer_flight_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    flight_number VARCHAR(10),
    total_customer_mileage INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (flight_number) REFERENCES Flights(flight_number)
);

-- Insert Data into Customers Table
INSERT INTO Customers (customer_name, customer_status) VALUES
('Agustine Riviera', 'Silver'),
('Alaina Sepulvida', 'None'),
('Tom Jones', 'Gold'),
('Sam Rio', 'None'),
('Jessica James', 'Silver'),
('Ana Janco', 'Silver'),
('Jennifer Cortez', 'Gold'),
('Christian Janco', 'Silver');

INSERT IGNORE INTO Flights (flight_number, aircraft_type, total_aircraft_seats, flight_mileage) VALUES
('DL143', 'Boeing 747', 400, 135),
('DL122', 'Airbus A330', 236, 4370),
('DL53', 'Boeing 777', 264, 2078),
('DL222', 'Boeing 777', 264, 1765),
('DL37', 'Boeing 747', 400, 531);

SELECT AVG(flight_mileage) AS average_flight_distance
FROM Flights;

SELECT AVG(total_aircraft_seats) AS average_seats
FROM Flights;


-- Insert Data into CustomerFlights Table
INSERT IGNORE INTO CustomerFlights (customer_id, flight_number, total_customer_mileage) VALUES
(1, 'DL143', 115235),
(1, 'DL122', 115235),
(2, 'DL122', 6008),
(1, 'DL143', 115235),
(3, 'DL122', 205767),
(3, 'DL53', 205767),
(1, 'DL143', 115235),
(4, 'DL143', 2653),
(1, 'DL143', 115235),
(3, 'DL222', 205767),
(5, 'DL143', 127656),
(4, 'DL143', 2653),
(6, 'DL222', 136773),
(7, 'DL222', 300582),
(5, 'DL122', 127656),
(4, 'DL37', 2653),
(6, 'DL222', 14642);

SELECT customer_status, AVG(total_customer_mileage) AS average_miles
FROM CustomerFlights CF
JOIN Customers C ON CF.customer_id = C.customer_id
GROUP BY customer_status;

SELECT customer_status, MAX(total_customer_mileage) AS max_miles
FROM CustomerFlights CF
JOIN Customers C ON CF.customer_id = C.customer_id
GROUP BY customer_status;

SELECT COUNT(*) AS total_boeing_aircraft
FROM Flights
WHERE aircraft_type LIKE '%Boeing%';

SELECT *
FROM Flights
WHERE flight_mileage BETWEEN 300 AND 2000;

SELECT C.customer_status, AVG(F.flight_mileage) AS average_flight_distance
FROM CustomerFlights CF
JOIN Customers C ON CF.customer_id = C.customer_id
JOIN Flights F ON CF.flight_number = F.flight_number
GROUP BY C.customer_status;

SELECT C.customer_status, F.aircraft_type, COUNT(*) AS bookings_count
FROM CustomerFlights CF
JOIN Customers C ON CF.customer_id = C.customer_id
JOIN Flights F ON CF.flight_number = F.flight_number
WHERE C.customer_status = 'Gold'
GROUP BY C.customer_status, F.aircraft_type
ORDER BY bookings_count DESC
LIMIT 1;

