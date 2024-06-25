
USE lab;

INSERT INTO author (author_name) VALUES
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

INSERT INTO blog (title, word_count, views) VALUES
('Best Paint Colors', 814, 14),
('Small Space Decorating Tips',1146, 221),
('Hot Accessories', 986, 105),
('Mixing Textures', 765, 22),
('Kitchen Refresh', 1242, 307),
('Homemade Art Hacks', 1002, 193),
('Refinishing Wood Floors', 1571, 7542);

INSERT INTO Customer (customer_name, customer_status, total_customer_mileage)
VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

INSERT INTO Flight (flight_number, aircraft, total_aircraft_seats, flight_mileage)
VALUES
('DL143', 'Boeing 747', 400, 135),
('DL122', 'Airbus A330', 236, 4370),
('DL53', 'Boeing 777', 264, 2078),
('DL222', 'Boeing 777', 264, 1765),
('DL37', 'Boeing 747', 400, 531);

INSERT INTO Booking (customer_id, flight_id)
VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 5),
(5, 1),
(5, 2),
(6, 4),
(7, 4),
(5, 2);

SELECT COUNT(*) AS total_flights
FROM Flight;

SELECT AVG(flight_mileage) AS average_flight_distance
FROM Flight;

SELECT AVG(total_aircraft_seats) AS average_seats
FROM Flight;

SELECT customer_status, AVG(total_customer_mileage) AS av_flown
FROM Customer
GROUP BY customer_status;

SELECT customer_status, MAX(total_customer_mileage) AS max_miles_flown
FROM Customer
GROUP BY customer_status;

SELECT COUNT(*) AS total_boeing
FROM Flight
WHERE aircraft LIKE '%Boeing%';

SELECT *
FROM Flight
WHERE flight_mileage BETWEEN 300 AND 2000;





