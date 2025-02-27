DROP SCHEMA IF EXISTS airline;
CREATE SCHEMA airline;
USE airline;

--

CREATE TABLE customer_name (
	id INT NOT NULL AUTO_INCREMENT,
	customer_name VARCHAR(255),
	PRIMARY KEY (id)
);

CREATE TABLE customer_status(
	id INT NOT NULL AUTO_INCREMENT,
	customer_status VARCHAR(255),
	PRIMARY KEY (id)
);

CREATE TABLE flight(
	id INT NOT NULL AUTO_INCREMENT,
	flight VARCHAR(255),
	PRIMARY KEY (id)
);

CREATE TABLE aircraft(
	id INT NOT NULL AUTO_INCREMENT,
	aircraft VARCHAR(255),
	PRIMARY KEY (id)
);

CREATE TABLE name_status (
	id INT NOT NULL AUTO_INCREMENT,
	id_name INT NOT NULL,
	id_status INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_name) REFERENCES customer_name(id),
	FOREIGN KEY (id_status) REFERENCES customer_status(id)
);



CREATE TABLE fly(
	id INT NOT NULL AUTO_INCREMENT,
	id_name INT NOT NULL,
	id_flight INT NOT NULL,
	id_aircraft INT NOT NULL,
	total_Aircraft_Seats INT,
	total_Flight_Mileage INT,
	total_Customer_Mileage INT,
	PRIMARY KEY(id),
	FOREIGN KEY (id_name) REFERENCES customer_name(id),
	FOREIGN KEY (id_flight) REFERENCES flight(id),
	FOREIGN KEY (id_aircraft) REFERENCES aircraft(id)
);

-- 

INSERT INTO customer_status (customer_status) VALUES
("None"),
("Silver"),
("Gold");

INSERT INTO customer_name (customer_name) VALUES
("Agustine Riviera"),
("Alaina Sepulvida"),
("Tom Jones"),
("Sam Rio"),
("Jessica James"),
("Ana Janco"),
("Jennifer Cortez"),
("Christian Janco");

INSERT INTO name_status (id_name, id_status) VALUES
(1,2),
(2,1),
(3,3),
(4,1),
(5,2),
(6,2),
(7,3),
(8,2);

INSERT INTO flight (flight) VALUES
("DL143"),
("DL122"),
("DL53"),
("DL222"),
("DL37");

INSERT INTO aircraft (aircraft) VALUES
("Boeing 747"),
("Airbus A330"),
("Boeing 777");

INSERT INTO fly (id_name, id_flight, id_aircraft, 
total_Aircraft_Seats, total_Flight_Mileage, total_Customer_Mileage) VALUES
(1,1,1,400,135,115235),
(1,2,2,236,4370,115235),
(2,2,2,236,4370,6008),
(3,2,2,236,4370,205767),
(3,3,3,264,2078,205767),
(4,1,1,400,135,2653),
(3,4,3,264,1765,205767),
(5,1,1,400,135,127656),
(6,4,3,264,1765,136773),
(7,4,3,264,1765,300582),
(5,2,2,236,4370,127656),
(4,5,1,400,531,2653),
(8,4,3,264,1765,14642);

-- 

SELECT COUNT(id_name) AS number_of_flights FROM fly;
SELECT AVG(total_Flight_Mileage) AS average_flight_distance FROM fly;
SELECT AVG(total_Aircraft_Seats) AS average_number_seats FROM fly;

SELECT DISTINCT AVG(DISTINCT f.total_Customer_Mileage) AS average_number_miles_flown_by_customers 
FROM fly AS f 
JOIN name_status AS n_s ON n_s.id_name = f.id_namefly
GROUP BY n_s.id_status;

SELECT MAX(f.total_Customer_Mileage) AS max_total_customer_mileage
FROM fly AS f
JOIN name_status AS n_s ON n_s.id_name = f.id_name
GROUP BY n_s.id_status;

SELECT COUNT(f.id) AS number_fly_Boeing
FROM fly AS f
JOIN aircraft AS ai ON f.id_aircraft = ai.id
WHERE ai.aircraft LIKE 'Boeing%';

SELECT DISTINCT ff.flight, f.total_Flight_Mileage AS flight_300_2000
FROM fly AS f
JOIN flight AS ff ON ff.id = f.id_flight
WHERE total_Flight_Mileage BETWEEN 300 AND 2000;

-- SELECT n_s.id_status, SUM(f.total_Flight_Mileage)-- AS average_number_miles_flight 
-- FROM fly AS f 
-- JOIN name_status AS n_s ON n_s.id_name = f.id_name
-- GROUP BY n_s.id_status;

SELECT cs.customer_status,(SUM(f.total_Flight_Mileage)) DIV (COUNT(DISTINCT f.id_name))-- AS average_number_miles_flight 
FROM fly AS f 
JOIN name_status AS n_s ON n_s.id_name = f.id_name
JOIN customer_status AS cs ON cs.id = n_s.id_status
GROUP BY n_s.id_status;

-- SELECT * 
-- FROM fly f
-- JOIN name_status ns ON ns.id_name = f.id_name;


SELECT ai.aircraft AS aircraft_most_popular
FROM fly f
JOIN name_status ns ON ns.id_name = f.id_name
JOIN aircraft ai ON f.id_aircraft = ai.id
WHERE ns.id_status = 3
GROUP BY ai.id
ORDER BY COUNT(ai.id) DESC
LIMIT 1;

