CREATE DATABASE lab_week_6_db;
USE lab_week_6_db;

CREATE TABLE blogs (
                       id INT PRIMARY KEY,
                       author  VARCHAR(50),
                       title VARCHAR(100),
                       word_count INT,
                       views INT
);

CREATE TABLE airline (
                         id INT PRIMARY KEY,
                         customer_name VARCHAR(50),
                         customer_status VARCHAR(50),
                         flight_number VARCHAR(10),
                         aircraft VARCHAR(25),
                         total_seats INT,
                         flight_mileage INT,
                         total_customer_mileage INT
);

INSERT INTO blogs (id, author, title, word_count, views)
VALUES
    (1, 'Maria Charlotte', 'Best Paint Colors', 814, 14),
    (2, 'Juan Perez', 'Small Space Decorating Tips', 1146, 221),
    (3, 'Maria Charlotte', 'Hot Accessories', 986, 105),
    (4, 'Maria Charlotte', 'Mixing Textures', 765, 22),
    (5, 'Juan Perez', 'Kitchen Refresh', 1242, 307),
    (6, 'Maria Charlotte', 'Homemade Art Hacks', 1002, 193),
    (7, 'Gemma Alcocer', 'Refinishing Wood Floors', 1571, 7542);

INSERT INTO airline (id, customer_name, customer_status, flight_number, aircraft, total_seats, flight_mileage, total_customer_mileage)
VALUES
    (1, 'Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
    (2, 'Agustine Riviera', 'Silver', 'DL122', 'Airbus A330', 236, 4370, 115235),
    (3, 'Alaina Sepulvida', 'None', 'DL122', 'Airbus A330', 236, 4370, 6008),
    (4, 'Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
    (5, 'Tom Jones', 'Gold', 'DL122', 'Airbus A330', 236, 4370, 205767),
    (6, 'Tom Jones', 'Gold', 'DL53', 'Boeing 777', 264, 2078, 205767),
    (7, 'Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
    (8, 'Sam Rio', 'None', 'DL143', 'Boeing 747', 400, 135, 2653),
    (9, 'Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
    (10, 'Tom Jones', 'Gold', 'DL222', 'Boeing 777', 264, 1765, 205767),
    (11, 'Jessica James', 'Silver', 'DL143', 'Boeing 747', 400, 135, 127656),
    (12, 'Sam Rio', 'None', 'DL143', 'Boeing 747', 400, 135, 2653),
    (13, 'Ana Janco', 'Silver', 'DL222', 'Boeing 777', 264, 1765, 136773),
    (14, 'Jennifer Cortez', 'Gold', 'DL222', 'Boeing 777', 264, 1765, 300582),
    (15, 'Jessica James', 'Silver', 'DL122', 'Airbus A330', 236, 4370, 127656),
    (16, 'Sam Rio', 'None', 'DL37', 'Boeing 747', 400, 531, 2653),
    (17, 'Christian Janco', 'Silver', 'DL222', 'Boeing 777', 264, 1765, 14642);

/* Total number of flights */
SELECT COUNT(*) AS total_flights
FROM airline;

/* Average Mileage */
SELECT AVG(flight_mileage) AS avg_flight_distance
FROM airline;

/* Average Number of Seats */
SELECT AVG(total_seats) AS avg_number_of_seats
FROM airline;

/* Average Number of Miles Flown by Customers Grouped by Status */
SELECT customer_status, AVG(total_customer_mileage) AS avg_miles_flown
FROM airline
GROUP BY customer_status;

/* Maximum Number of Miles Flown by Customers Grouped by Status */
SELECT customer_status, MAX(total_customer_mileage) AS max_miles_flown
FROM airline
GROUP BY customer_status;

/* Total Number of Aircraft with a Name Containing Boeing */
SELECT COUNT(aircraft) AS total_boings
FROM airline
WHERE aircraft LIKE 'Boeing%';

/* Find All Flights with a Distance Between 300 and 2000 Miles */
SELECT flight_number, flight_mileage
FROM airline
WHERE flight_mileage BETWEEN 300 AND 2000;

/* Average Flight Distance Booked Grouped by Customer Status */
SELECT customer_status, AVG(flight_mileage) AS avg_flight_distance
FROM airline
GROUP BY customer_status;

/* Most Often Booked Aircraft by Gold Status Members */
SELECT aircraft, COUNT(*) AS booking_count
FROM airline
WHERE customer_status = 'Gold'
GROUP BY aircraft
ORDER BY booking_count DESC
LIMIT 1;