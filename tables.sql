-- 01 Authors Table normalization
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);
CREATE TABLE Titles (
    title_id INT AUTO_INCREMENT PRIMARY KEY,
    title_name VARCHAR(255) NOT NULL
);
CREATE TABLE Articles (
    article_id INT AUTO_INCREMENT PRIMARY KEY,
    author_id INT,
    title_id INT,
    word_count INT,
    views INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(50)
);
-- 02 Arline Table normalization
CREATE TABLE Airline (
    customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(50),
    flight_number VARCHAR(10),
    aircraft VARCHAR(50),
    total_aircraft_seats INT,
    flight_mileage INT,
    total_customer_mileage INT
);

CREATE TABLE Flights (
    flight_number VARCHAR(10) PRIMARY KEY,
    aircraft_id INT,
    total_aircraft_seats INT,
    flight_mileage INT,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)
);
CREATE TABLE Aircraft (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    aircraft_type VARCHAR(50) NOT NULL
);
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    flight_number VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (flight_number) REFERENCES Flights(flight_number)
);
-- SQL Queries for Airline Database

-- 03 Total number of flights
SELECT COUNT(*) AS total_flights
FROM Airline;

-- 04 Average flight distance
SELECT AVG(flight_mileage) AS avg_flight_distance
FROM Airline;

-- 05 Average number of seats
SELECT AVG(total_aircraft_seats) AS avg_seats
FROM Airline;

-- 06 Average number of miles flown by customers grouped by status
SELECT customer_status, AVG(total_customer_mileage) AS avg_miles_flown
FROM Airline
GROUP BY customer_status;

-- 07 Maximum number of miles flown by customers grouped by status
SELECT customer_status, MAX(total_customer_mileage) AS max_miles_flown
FROM Airline
GROUP BY customer_status;

-- 08 Total number of aircraft with a name containing Boeing
SELECT COUNT(*) AS total_boeing_aircraft
FROM Airline
WHERE Aircraft LIKE '%Boeing%';

-- 09 Flights with a distance between 300 and 2000 miles
SELECT *
FROM Airline
WHERE flight_mileage BETWEEN 300 AND 2000;

-- 10 0Average flight distance booked grouped by customer status (using join)
SELECT a.customer_status, AVG(b.flight_mileage) AS avg_flight_distance
FROM Airline a
JOIN Flights b ON a.flight_number = b.flight_number
GROUP BY a.customer_status;

-- 11 Most often booked aircraft by gold status members (using join)
SELECT a.aircraft, COUNT(*) AS booking_count
FROM Airline a
JOIN Flights b ON a.flight_number = b.flight_number
WHERE a.customer_status = 'Gold'
GROUP BY a.aircraft
ORDER BY booking_count DESC
LIMIT 1;