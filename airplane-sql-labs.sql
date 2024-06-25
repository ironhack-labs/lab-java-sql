DROP DATABASE IF EXISTS airline_db;
CREATE DATABASE airline_db;
USE airline_db;

CREATE TABLE customer (
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(255),
    PRIMARY KEY (customer_id)
);

CREATE TABLE flight (
    flight_id INT NOT NULL AUTO_INCREMENT,
    flight_number VARCHAR(255) NOT NULL,
    aircraft VARCHAR(255),
    total_aircraft_seats INT,
    flight_mileage INT,
    PRIMARY KEY (flight_id)
);

CREATE TABLE customer_flight (
    customer_id INT NOT NULL,
    flight_id INT NOT NULL,
    total_customer_mileage INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (flight_id) REFERENCES flight(flight_id)
);

INSERT INTO customer (customer_name, customer_status) VALUES
('Agustine Riviera', 'Silver'),
('Alaina Sepulvida', 'None'),
('Tom Jones', 'Gold'),
('Sam Rio', 'None'),
('Jessica James', 'Silver'),
('Ana Janco', 'Silver'),
('Jennifer Cortez', 'Gold'),
('Christian Janco', 'Silver');

INSERT INTO flight (flight_number, aircraft, total_aircraft_seats, flight_mileage) VALUES
('DL143', 'Boeing 747', 400, 135),
('DL122', 'Airbus A330', 236, 4370),
('DL53', 'Boeing 777', 264, 2078),
('DL222', 'Boeing 777', 264, 1765),
('DL37', 'Boeing 747', 400, 531);

INSERT INTO customer_flight (customer_id, flight_id, total_customer_mileage) VALUES
(1, 1, 115235),
(1, 2, 115235),
(2, 2, 6008),
(3, 2, 205767),
(3, 3, 205767),
(4, 1, 2653),
(5, 1, 127656),
(6, 4, 136773),
(7, 4, 300582),
(8, 4, 14642);

SELECT COUNT(flight_number) AS number_of_flights FROM flight;
SELECT AVG(flight_mileage) AS average_flights_distance from flight; 
SELECT AVG(total_aircraft_seats) as average_number_of_seats from flight;

SELECT c.customer_status, AVG(cf.total_customer_mileage) 
FROM CUSTOMER c 
JOIN customer_flight cf on c.customer_id = cf.customer_id
GROUP BY c.customer_status;

SELECT c.customer_status, MAX(cf.total_customer_mileage) 
from customer c
join customer_flight cf on c.customer_id = cf.customer_id
GROUP BY c.customer_status

SELECT COUNT(*) as how_many_boeings from flight WHERE aircraft LIKE 'Boeing%';

SELECT * FROM flight where flight_mileage BETWEEN 300 AND 2000; 

SELECT c.customer_status, AVG(cf.total_customer_mileage) 
from customer c
join customer_flight cf on c.customer_id = cf.customer_id
GROUP BY c.customer_status;







