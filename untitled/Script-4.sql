DROP SCHEMA IF EXISTS airlinedb;
CREATE SCHEMA airlinedb;
USE airlinedb;

-- Airline Database DDL Statements
CREATE TABLE airlinedb.Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    status VARCHAR(50)
);

CREATE TABLE airlinedb.Aircraft (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    aircraft_name VARCHAR(100) NOT NULL,
    total_seats INT
);

CREATE TABLE airlinedb.Flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(50) NOT NULL,
    aircraft_id INT,
    mileage INT,
    FOREIGN KEY (aircraft_id) REFERENCES airlinedb.Aircraft(aircraft_id)
);

CREATE TABLE airlinedb.CustomerFlights (
    customer_flight_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    flight_id INT,
    total_customer_mileage INT,
    FOREIGN KEY (customer_id) REFERENCES airlinedb.Customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES airlinedb.Flights(flight_id)
);

-- Create the airline table with correct foreign key reference
CREATE TABLE airlinedb.airline (
    Customer_Id INT,
    Flight_Number VARCHAR(255),
    Aircraft VARCHAR(255),
    Total_Aircraft_Seats INT,
    Flight_Mileage INT,
    FOREIGN KEY (Customer_Id) REFERENCES airlinedb.Customers(customer_id)
);

-- Insert sample data into Customers
INSERT INTO airlinedb.Customers (name, status) VALUES
('John Doe', 'Gold'),
('Jane Smith', 'Silver'),
('Robert Johnson', 'Bronze'),
('Emily Davis', 'Gold'),
('Michael Brown', 'Silver'),
('Sarah Wilson', 'Bronze'),
('David Lee', 'Gold'),
('Laura Martin', 'Silver');

-- Insert sample data into Aircraft
INSERT INTO airlinedb.Aircraft (aircraft_name, total_seats) VALUES
('Boeing 737', 200),
('Airbus A320', 180),
('Boeing 777', 350);

-- Insert sample data into Flights
INSERT INTO airlinedb.Flights (flight_number, aircraft_id, mileage) VALUES
('AA123', 1, 1500),
('UA456', 2, 1200),
('DL789', 3, 2200);

-- Insert sample data into CustomerFlights
INSERT INTO airlinedb.CustomerFlights (customer_id, flight_id, total_customer_mileage) VALUES
(1, 1, 1500),
(2, 2, 1200),
(3, 3, 2200),
(1, 2, 1200);

-- Insert sample data into airline table
INSERT INTO airlinedb.airline (Customer_Id, Flight_Number, Aircraft, Total_Aircraft_Seats, Flight_Mileage) VALUES
(1, 'DL143', 'Boeing 747', 400, 135),
(1, 'DL122', 'Airbus A330', 236, 4370),
(2, 'DL122', 'Airbus A330', 236, 4370),
(3, 'DL122', 'Airbus A330', 236, 4370),
(3, 'DL53', 'Boeing 777', 264, 2078),
(4, 'DL143', 'Boeing 747', 400, 135),
(3, 'DL222', 'Boeing 777', 264, 1765),
(5, 'DL143', 'Boeing 747', 400, 135),
(4, 'DL37', 'Boeing 747', 400, 531),
(6, 'DL222', 'Boeing 777', 264, 1765),
(7, 'DL222', 'Boeing 777', 264, 1765),
(5, 'DL122', 'Airbus A330', 236, 4370),
(4, 'DL143', 'Boeing 747', 400, 135),
(8, 'DL222', 'Boeing 777', 264, 1765);

-- SQL Queries for the Airline Database

-- 1. Total number of flights
SELECT COUNT(*) AS total_flights FROM airlinedb.Flights;

-- 2. Average flight distance
SELECT AVG(mileage) AS average_distance FROM airlinedb.Flights;

-- 3. Average number of seats
SELECT AVG(total_seats) AS average_seats FROM airlinedb.Aircraft;

-- 4. Average miles flown by customers grouped by status
SELECT c.status, AVG(cf.total_customer_mileage) AS average_miles
FROM airlinedb.Customers c
JOIN airlinedb.CustomerFlights cf ON c.customer_id = cf.customer_id
GROUP BY c.status;

-- 5. Maximum miles flown by customers grouped by status
SELECT c.status, MAX(cf.total_customer_mileage) AS max_miles
FROM airlinedb.Customers c
JOIN airlinedb.CustomerFlights cf ON c.customer_id = cf.customer_id
GROUP BY c.status;

-- 6. Total number of aircraft with a name containing 'Boeing'
SELECT COUNT(*) AS total_boeing_aircraft FROM airlinedb.Aircraft
WHERE aircraft_name LIKE '%Boeing%';

-- 7. Flights with a distance between 300 and 2000 miles
SELECT * FROM airlinedb.Flights
WHERE mileage BETWEEN 300 AND 2000;

-- 8. Average flight distance booked grouped by customer status
SELECT c.status, AVG(f.mileage) AS average_distance
FROM airlinedb.Customers c
JOIN airlinedb.CustomerFlights cf ON c.customer_id = cf.customer_id
JOIN airlinedb.Flights f ON cf.flight_id = f.flight_id
GROUP BY c.status;

-- 9. Most often booked aircraft by gold status members
SELECT a.aircraft_name, COUNT(*) AS booking_count
FROM airlinedb.Customers c
JOIN airlinedb.CustomerFlights cf ON c.customer_id = cf.customer_id
JOIN airlinedb.Flights f ON cf.flight_id = f.flight_id
JOIN airlinedb.Aircraft a ON f.aircraft_id = a.aircraft_id
WHERE c.status = 'Gold'
GROUP BY a.aircraft_name
ORDER BY booking_count DESC
LIMIT 1;
