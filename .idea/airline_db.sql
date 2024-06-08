CREATE DATABASE airline_db;

USE airline_db;

CREATE TABLE customers
(
    customer_id     INT PRIMARY KEY,
    customer_name   VARCHAR(50),
    customer_status VARCHAR(50),
    customer_mileage INT
);

CREATE TABLE aircraft
(
    aircraft_id    INT PRIMARY KEY,
    aircraft_name  VARCHAR(50),
    aircraft_seats INT
);

CREATE TABLE flight_info
(
    flight_info_id      INT PRIMARY KEY,
    flight_info_number  INT,
    flight_info_mileage INT,
    aircraft_id         INT,
    FOREIGN KEY (aircraft_id) REFERENCES aircraft (aircraft_id)
);

CREATE TABLE flights
(
    flight_id      INT PRIMARY KEY,
    customer_id    INT,
    flight_info_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (flight_info_id) REFERENCES flight_info (flight_info_id)
);


INSERT INTO customers(customer_id, customer_name, customer_status, customer_mileage)
VALUES (1, 'Augustine Riviera', 'Silver', 115235),
       (2, 'Alaina Sepulvida', 'None', 6008),
       (3, 'Tom Jones', 'Gold', 205767),
       (4, 'Sam Rio', 'None', 2653),
       (5, 'Jessica James', 'Silver', 127656),
       (6, 'Ana Janco', 'Silver', 136773),
       (7, 'Jennifer Cortez', 'Gold', 300582),
       (8, 'Christian Janco', 'Silver', 14642);

INSERT INTO aircraft(aircraft_id, aircraft_name, aircraft_seats)
VALUES (1, 'Boeing 747', 400),
       (2, 'Airbus A330', 236),
       (3, 'Boeing 777', 264);

INSERT INTO flight_info(flight_info_id, flight_info_number, flight_info_mileage, aircraft_id)
VALUES (1, 143, 135, 1),
       (2, 122, 4370, 2),
       (3, 53, 2078, 3),
       (4, 222, 1765, 3),
       (5, 37, 537, 1);

INSERT INTO flights(flight_id, customer_id, flight_info_id)
VALUES (1, 1, 1),
       (2, 1, 2),
       (3, 2, 2),
       (4, 1, 1),
       (5, 3, 2),
       (6, 3, 3),
       (7, 1, 1),
       (8, 4, 1),
       (9, 1, 1),
       (10, 3, 4),
       (11, 5, 1),
       (12, 4, 1),
       (13, 6, 4),
       (14, 7, 4),
       (15, 5, 2),
       (16, 4, 5),
       (17, 8, 4);

SELECT COUNT(*) AS total_flights FROM Flights;

SELECT AVG(flight_info_mileage) AS avg_flight_distance FROM flight_info;

SELECT AVG(aircraft_seats) AS avg_seats FROM aircraft;

SELECT customer_status, AVG(customer_mileage) AS avg_miles
FROM flights
         JOIN Customers ON flights.customer_id = Customers.customer_id
GROUP BY customer_status;

SELECT customer_status, MAX(customer_mileage) AS max_miles
FROM flights
         JOIN Customers ON flights.customer_id = Customers.customer_id
GROUP BY customer_status;

SELECT COUNT(*) AS total_boeing_aircraft
FROM aircraft
WHERE aircraft_name LIKE '%Boeing%';

SELECT f.*
FROM flight_info f
WHERE f.flight_info_mileage BETWEEN 300 AND 2000;

SELECT c.customer_status, AVG(fi.flight_info_mileage) AS avg_flight_distance
FROM customers c
         JOIN flights f ON c.customer_id = f.customer_id
         JOIN flight_info fi ON f.flight_info_id = fi.flight_info_id
GROUP BY c.customer_status;

SELECT a.aircraft_name, COUNT(*) AS num_bookings
FROM customers c
         JOIN flights f ON c.customer_id = f.customer_id
         JOIN flight_info fi ON f.flight_info_id = fi.flight_info_id
         JOIN aircraft a ON fi.aircraft_id = a.aircraft_id
WHERE c.customer_status = 'Gold'
GROUP BY a.aircraft_name
ORDER BY num_bookings DESC
LIMIT 1;