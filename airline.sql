DROP SCHEMA IF EXISTS lab;
CREATE SCHEMA lab;
USE lab;

-- DDL 
CREATE TABLE customer(
	id INT NOT NULL AUTO_INCREMENT,
	customer_name VARCHAR(255),
	customer_status VARCHAR(20),
	total_customer_mileage INT,
	PRIMARY KEY(id)
);

CREATE TABLE aircraft(
	id INT NOT NULL AUTO_INCREMENT,
	aircraft_name VARCHAR(255),
	total_aircraft_seats INT,
	PRIMARY KEY(id)
);

CREATE TABLE flight(
	id INT NOT NULL AUTO_INCREMENT,
	flight_number VARCHAR(255),
	aircraft_id INT,
	flight_mileage INT,
	PRIMARY KEY(id),
	FOREIGN KEY(aircraft_id) REFERENCES aircraft(id)
);

CREATE TABLE fact(
	id INT NOT NULL AUTO_INCREMENT,
	customer_id INT,
	flight_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY (customer_id) REFERENCES customer(id),
	FOREIGN KEY (flight_id) REFERENCES flight(id)
);

-- DML

INSERT INTO aircraft (aircraft_name, total_aircraft_seats) VALUES 
('Boeing 747', 400),
('Boeing 777', 264),
('Airbus A330', 236);

INSERT INTO flight (flight_number,aircraft_id,flight_mileage) VALUES
('DL143',1,135),
('DL122',3,4370),
('DL53',2,2078),
('DL222',2,1765),
('DL37',1,531);

INSERT INTO customer (customer_name,customer_status,total_customer_mileage) VALUES
('Agustine Riviera','Silver',115235),
('Alaina Sepluvida','None', 6008),
('Tom Jones','Gold', 205767),
('Sam Rio','None', 2653),
('Jessica James','Silver', 136773),
('Ana Janco','Silver', 136773),
('Jennifer Cortez','Gold', 300582),
('Christian Janco','Silver',14642);

INSERT INTO fact (customer_id, flight_id) VALUES
(1,1),
(1,2),
(2,2),
(3,2),
(3,3),
(4,1),
(3,4),
(5,1),
(6,4),
(7,4),
(5,2),
(4,5),
(8,4);

-- QUERIES

SELECT COUNT(*) FROM flight;
SELECT AVG(flight_mileage) FROM flight;
SELECT AVG(total_aircraft_seats) FROM aircraft;
SELECT AVG(total_customer_mileage),customer_status FROM customer GROUP BY customer_status;
SELECT MAX(total_customer_mileage),customer_status FROM customer GROUP BY customer_status;
SELECT COUNT(*) FROM aircraft WHERE aircraft_name LIKE'%boeing%';
SELECT * FROM flight WHERE flight_mileage BETWEEN 300 AND 2000;
SELECT AVG(f.flight_mileage),c.customer_status FROM flight f JOIN
fact t ON f.id=t.flight_id JOIN customer c ON
t.customer_id=c.id GROUP BY c.customer_status;
SELECT a.aircraft_name,COUNT(t.id) AS count FROM fact t JOIN flight f ON t.flight_id=f.id
JOIN aircraft a ON f.aircraft_id=a.id JOIN customer c ON t.customer_id=c.id WHERE c.customer_status = "GOLD"
GROUP BY a.aircraft_name ORDER BY count DESC LIMIT 1;


