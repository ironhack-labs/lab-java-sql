DROP SCHEMA IF EXISTS airline;
Create SCHEMA airline;
USE airline;

CREATE TABLE customer (
	id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(255),
customer_status VARCHAR(255),
total_customer_mileage INT,
    PRIMARY KEY (id)
);

CREATE TABLE airline (
trip_id VARCHAR(255) Not NULL,
flight_number VARCHAR(255),
aircraft VARCHAR(255),
total_aircraft_seats INT,
flight_mileage INT,
customer_id INT NOT NULL,
PRIMARY KEY (trip_id),
FOREIGN KEY (customer_id) REFERENCES customer(id)
);

INSERT INTO customer (customer_name, customer_status, total_customer_mileage) VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Ana Janco', 'Silver', 136773),
('Christian Janco', 'Silver', 14642),
('Jennifer Cortez', 'Gold', 300582),
('Jessica James', 'Silver', 127656),
('Sam Rio', 'None', 2653),
('Tom Jones', 'Gold', 305767);

INSERT INTO airline (trip_id, flight_number, aircraft, total_aircraft_seats, flight_mileage, customer_id) VALUES
('T1','DL143', 'Boeing747', 400, 135, 1),
('T2','DL122', 'AirbusA330', 236, 4370, 1),
('T3','DL122', 'AirbusA330', 236, 4370, 2),
('T4','DL122', 'Boeing777', 264, 1765, 3),
('T5','DL122', 'Boeing777', 264, 1765, 4),
('T6','DL122', 'Boeing777', 264, 1765, 5),
('T7','DL143', 'Boeing747', 400, 135, 6),
('T8','DL122', 'AirbusA330', 236, 4370, 6),
('T9','DL143', 'Boeing747', 400, 135, 7),
('T10','DL37', 'Boeing747', 400, 531, 7),
('T11','DL122', 'AirbusA330', 236, 4370, 8),
('T12','DL53', 'Boeing777', 264, 2078, 8),
('T13','DL222', 'Boeing777', 264, 1765, 8);

SELECT * FROM customer;
SELECT * FROM airline;
SELECT COUNT(DISTINCT flight_number) AS total_flight_number FROM airline;
SELECT AVG(DISTINCT flight_mileage) AS flight_mileage_ave FROM airline;
SELECT AVG(DISTINCT total_aircraft_seats) AS total_aircraft_seats_ave FROM airline;
SELECT AVG(total_customer_mileage) AS total_c_mileage_ave FROM customer GROUP BY customer_status;
SELECT MAX(total_customer_mileage) AS total_c_mileage_ave FROM customer GROUP BY customer_status;
SELECT COUNT(DISTINCT aircraft) AS total_aircrafts FROM airline WHERE aircraft LIKE '%BOEING%';
SELECT DISTINCT flight_mileage FROM airline WHERE flight_mileage > 300 and flight_mileage < 2000;
SELECT AVG(a.flight_mileage) AS Mileage_Status
FROM airline a 
JOIN customer c ON a.customer_id = c.id GROUP BY c.customer_status;
SELECT MAX(a.aircraft)
FROM airline a 
JOIN customer c ON a.customer_id = c.id ORDER BY c.customer_status;
