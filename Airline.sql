CREATE SCHEMA airline;

CREATE TABLE airline.customers(
    id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(255),
	customer_status VARCHAR(255),
	total_customer_mileage INT,
    PRIMARY KEY (id)
 );

CREATE TABLE airline.airplanes(
    aircraft VARCHAR(255) NOT NULL,
    total_seats INT,
    PRIMARY KEY (aircraft)
 );

 CREATE TABLE airline.flights(
    flight_number VARCHAR(255) NOT NULL,
    flight_mileage INT,
    aircraft_id VARCHAR(255),
    PRIMARY KEY (flight_number),
	FOREIGN KEY (aircraft_id) REFERENCES airline.airplanes(aircraft)
 );

 CREATE TABLE airline.customerFlightAssignment(
	id INT NOT NULL AUTO_INCREMENT,
    flight_number VARCHAR(255),
    customer_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (flight_number) REFERENCES airline.flights(flight_number),
	FOREIGN KEY (customer_id) REFERENCES airline.customers(id)
);


INSERT INTO airline.airplanes(aircraft,total_seats) VALUES
("Boeing 747",400),
("Airbus A330",236),
("Boeing 777",264);


INSERT INTO airline.customers(customer_name,customer_status,total_customer_mileage ) VALUES
("Agustine Riviera","Silver",115235),
("Alaina Sepulvida","None",6008),
("Tom Jones","Gold",205767),
("Sam Rio","None",2653),
("Jessica James","Silver",127656),
("Ana Janco","Silver",136773),
("Jennifer Cortez","Gold",300582),
("Christian Janco","Silver",14642);


INSERT INTO airline.flights(flight_number,flight_mileage,aircraft_id) VALUES
("DL143",135,"Boeing 747"),
("DL122",4370,"Airbus A330"),
("DL53",2078,"Boeing 777"),
("DL37",531,"Boeing 747"),
("DL222",1765,"Boeing 777");

INSERT INTO airline.customerFlightAssignment(flight_number,customer_id) VALUES
("DL143",1),
("DL143",4),
("DL143",5),
("DL122",1),
("DL122",2),
("DL122",3),
("DL122",5),
("DL53",3),
("DL222",3),
("DL222",6),
("DL222",7),
("DL222",8),
("DL37",4);

-- In the Airline database write the SQL script to get the total number of flights in the database.
SELECT COUNT(*) FROM airline.flights;

-- In the Airline database write the SQL script to get the average flight distance.
SELECT AVG(flight_mileage) FROM airline.flights;

-- In the Airline database write the SQL script to get the average number of seats.
SELECT AVG(total_seats) FROM airline.airplanes;

-- In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.
SELECT customers.customer_status, AVG(total_customer_mileage) FROM airline.customers GROUP BY customers.customer_status;

-- In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
SELECT customers.customer_status, MAX(total_customer_mileage) FROM airline.customers GROUP BY customers.customer_status;

-- In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.
SELECT COUNT(*)  FROM airline.airplanes WHERE aircraft LIKE 'Boeing%';

-- In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
SELECT * FROM airline.flights WHERE flight_mileage BETWEEN 300 AND 2000;

-- In the Airline database write the SQL script to find the average flight distance booked
-- grouped by customer status (this should require a join).
SELECT airline.customers.customer_status, AVG(flights.flight_mileage)
FROM airline.customerFlightAssignment
INNER JOIN airline.customers
ON customer_id = airline.customers.id
INNER JOIN airline.flights
ON airline.customerFlightAssignment.flight_number = airline.flights.flight_number
GROUP BY airline.customers.customer_status;

-- In the Airline database write the SQL script to find the most often booked aircraft
-- by gold status members (this should require a join).
SELECT aircraft_id, COUNT(*) AS number_flights
FROM airline.customerFlightAssignment
INNER JOIN airline.customers
ON customer_id = airline.customers.id
INNER JOIN airline.flights
ON airline.customerFlightAssignment.flight_number = airline.flights.flight_number
WHERE airline.customers.customer_status = "Gold"
GROUP BY aircraft_id
ORDER BY number_flights DESC
LIMIT 1;

