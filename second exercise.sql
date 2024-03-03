create database lab_sql_2;
Use lab_sql_2;

CREATE TABLE Customer_Status (
	status_id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(10)
);

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255),
    customer_status_id INT,
    total_customer_mileage INT,
    FOREIGN KEY (customer_status_id) REFERENCES Customer_Status(status_id)
);

CREATE TABLE Aircraft (
    aircraft_id INT AUTO_INCREMENT PRIMARY KEY,
    aircraft_name VARCHAR(50),
    total_seats INT
);


CREATE TABLE Flight (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(10),
    aircraft_id INT,
    flight_mileage INT,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)
);



INSERT INTO Customer_Status (status) VALUES
("Gold"),
("Silver"),
("None");

INSERT INTO Customer (customer_name, customer_status_id, total_customer_mileage) VALUES
("Agustine Riviera", 2, 115235),
("Alaina Sepulvida", 3, 6008),
("Tom Jones", 1, 205767),
("Sam Rio", 3, 2653),
("Jessica James", 2, 127656),
("Ana Janco", 2, 136773),
("Jennifer Cortez", 1, 300582),
("Christian Janco", 2, 14642);

INSERT INTO Aircraft (aircraft_name, total_seats) VALUES
("Boeing 747", 400),
("Airbus A330", 236),
("Boeing 777", 264);


INSERT INTO Flight (flight_number, aircraft_id, flight_mileage) VALUES
("DL143", 1, 135),
("DL122", 2, 4370),
("DL53", 3, 2078),
("DL222", 3, 1765),
("DL37", 1, 531);

CREATE TABLE customer_flights (
	id INT NOT NULL AUTO_INCREMENT,
	customer_id INT,
    flight_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
    );
    
INSERT INTO customer_flights (customer_id, flight_id) VALUES
	(1, 1),
    (1, 2),
    (2, 2),
    (3, 2),
    (3, 3),
    (4, 1),
    (3, 4),
    (5, 1),
    (6, 4),
    (7, 4),
    (5, 2),
    (4, 5),
    (8, 4);
    

SELECT
    c.customer_name,
    cs.status,
    f.flight_number,
    a.aircraft_name,
    a.total_seats,
    f.flight_mileage,
    c.total_customer_mileage
FROM
    Customer c
INNER JOIN Customer_Status cs ON c.customer_status_id = cs.status_id
INNER JOIN customer_flights cf ON c.customer_id = cf.customer_id
INNER JOIN Flight f ON cf.flight_id = f.flight_id
INNER JOIN Aircraft a ON f.aircraft_id = a.aircraft_id;

-- In the Airline database write the SQL script to get the total number of flights in the database.
SELECT COUNT(*) FROM Flight;

-- In the Airline database write the SQL script to get the average flight distance.
SELECT AVG(flight_mileage) FROM Flight;

-- In the Airline database write the SQL script to get the average number of seats.
SELECT AVG(total_seats) FROM Aircraft;

-- In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.
SELECT Customer_Status.status, AVG(total_customer_mileage) FROM Customer 
JOIN Customer_Status ON Customer.customer_status_id = Customer_Status.status_id GROUP BY Customer_Status.status;

-- In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
SELECT Customer_Status.status, MAX(total_customer_mileage) FROM Customer 
JOIN Customer_Status ON Customer.customer_status_id = Customer_Status.status_id GROUP BY Customer_Status.status;

-- In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.
SELECT COUNT(*) FROM Aircraft WHERE aircraft_name LIKE '%Boeing%';

-- In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
SELECT * FROM Flight WHERE flight_mileage BETWEEN 300 AND 2000;

-- In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).
SELECT Customer_Status.status, AVG(Flight.flight_mileage) FROM customer_flights 
JOIN Customer ON customer_flights.customer_id = Customer.customer_id
JOIN Customer_Status ON Customer.customer_status_id = Customer_Status.status_id
JOIN Flight  ON customer_flights.flight_id = Flight.flight_id
GROUP BY Customer_Status.status;

-- In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).
SELECT Customer_Status.status, Aircraft.aircraft_name, COUNT(*) FROM customer_flights 
JOIN Customer ON customer_flights.customer_id = Customer.customer_id
JOIN Customer_Status ON Customer.customer_status_id = Customer_Status.status_id
JOIN Flight ON customer_flights.flight_id = Flight.flight_id
JOIN Aircraft  ON Flight.aircraft_id = Aircraft.aircraft_id
WHERE Customer_Status.status = 'Gold'
GROUP BY Aircraft.aircraft_name
ORDER BY COUNT(*) DESC
LIMIT 1;