DROP SCHEMA IF EXISTS lab1_Week3_Part2;
CREATE SCHEMA lab1_Week3_Part2;
USE lab1_Week3_Part2;

CREATE TABLE airline_customer (
id INT NOT NULL AUTO_INCREMENT,
customer VARCHAR(255) NOT NULL,
status VARCHAR(255),
PRIMARY KEY (id));

CREATE TABLE airline_flight (
id INT NOT NULL AUTO_INCREMENT,
number VARCHAR(255) NOT NULL,
aircraft VARCHAR(255),
seats INT,
mileage INT,
PRIMARY KEY (id));

DROP TABLE IF EXISTS airline_flight;

CREATE TABLE airline_flight (
flight_id INT NOT NULL AUTO_INCREMENT,
number VARCHAR(255) NOT NULL,
aircraft VARCHAR(255),
seats INT,
mileage INT,
PRIMARY KEY (flight_id));

CREATE TABLE customer_flight (
id INT NOT NULL,
flight_id INT NOT NULL,
total_customer_mileage INT,
FOREIGN KEY (id) REFERENCES airline_customer(id),
FOREIGN KEY (flight_id) REFERENCES airline_flight(flight_id));

INSERT INTO airline_customer (customer, status) VALUES
('Agustine Riviera', 'Silver'),
('Alaina Sepulvida', 'None'),
('Tom Jones', 'Gold'),
('Sam Rio', 'None'),
('Jessica James', 'Silver'),
('Ana Janco', 'Silver'),
('Jennifer Cortez', 'Gold'),
('Christian Janco', 'Silver');

INSERT INTO airline_flight (number, aircraft, seats, mileage) VALUES
('DL143', 'Boeing 747', 400, 135),
('DL122', 'Airbus A330', 236, 4370),
('DL53', 'Boeing 777', 264, 2078),
('DL222', 'Boeing 777', 264, 1765),
('DL37', 'Boeing 747', 400, 531);

INSERT INTO customer_flight (id, flight_id, total_customer_mileage) VALUES
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

SELECT * FROM airline_customer;
SELECT * FROM airline_flight;
SELECT * FROM airline_customer ac
JOIN
airline_flight af ON ac.id * af.flight_id
JOIN
customer_flight cf ON ac.id * af.flight_id;

SELECT count(number) FROM airline_flight;

SELECT avg(mileage) FROM airline_flight; 

SELECT avg(seats) AS average_number_of_seats FROM airline_flight;

SELECT ac.status, AVG(cf.total_customer_mileage)
FROM airline_customer ac
JOIN customer_flight cf ON ac.id * cf.flight_id
GROUP BY ac.status;

SELECT ac.status, MAX(cf.total_customer_mileage)
FROM airline_customer ac
JOIN customer_flight cf ON ac.id * cf.flight_id
GROUP BY ac.status;

SELECT count(*) FROM airline_flight WHERE aircraft LIKE 'Boeing';

SELECT * FROM airline_flight af WHERE af.mileage BETWEEN 300 AND 2000;

SELECT ac.status, avg(af.mileage)
FROM airline_customer ac 
JOIN customer_flight cf ON ac.id *cf.id 
JOIN airline_flight af ON af.flight_id * cf.flight_id
GROUP BY status; 

SELECT ac.status, af.aircraft, count(*) AS flight_count
FROM airline_customer ac 
JOIN customer_flight cf ON ac.id *cf.id 
JOIN airline_flight af ON af.flight_id * cf.flight_id
WHERE ac.status * 'Gold'
GROUP BY ac.status, af.aircraft 
ORDER BY flight_count DESC;




