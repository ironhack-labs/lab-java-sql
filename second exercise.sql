create database lab_sql_2;
Use lab_sql_2;


CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255),
    customer_status VARCHAR(255),
    total_customer_mileage INT
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


INSERT INTO Customer (customer_name, customer_status, total_customer_mileage) VALUES
("Agustine Riviera", "Silver", 115235),
("Alaina Sepulvida", "None", 6008),
("Tom Jones", "Gold", 205767),
("Sam Rio", "None", 2653),
("Jessica James", "Silver", 127656),
("Ana Janco", "Silver", 136773),
("Jennifer Cortez", "Gold", 300582),
("Christian Janco", "Silver", 14642);

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
    c.customer_status,
    c.total_customer_mileage,
    a.aircraft_name,
    a.total_seats,
    f.flight_number,
    f.flight_mileage
FROM 
    customer_flights cf
JOIN 
    Customer c ON cf.customer_id = c.customer_id
JOIN 
    Flight f ON cf.flight_id = f.flight_id
JOIN 
    Aircraft a ON f.aircraft_id = a.aircraft_id;

-- In the Airline database write the SQL script to get the total number of flights in the database.
SELECT COUNT(*) FROM Flight;

-- In the Airline database write the SQL script to get the average flight distance.
SELECT AVG(flight_mileage) FROM Flight;

-- In the Airline database write the SQL script to get the average number of seats.
SELECT AVG(total_seats) FROM Aircraft;

-- In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.
SELECT customer_status,AVG(total_customer_mileage) AS average_miles_flown FROM Customer GROUP BY customer_status;

-- In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
SELECT customer_status, MAX(total_customer_mileage) AS max_miles_flown FROM Customer GROUP BY customer_status;

-- In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.
SELECT COUNT(*) FROM Aircraft WHERE aircraft_name LIKE '%Boeing%';

-- In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
SELECT * FROM Flight WHERE flight_mileage BETWEEN 300 AND 2000;

-- In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).
SELECT customer_status, AVG(flight_mileage) 
FROM customer_flights CF
JOIN Customer C ON CF.customer_id = C.customer_id
JOIN Flight F ON CF.flight_id = F.flight_id
GROUP BY C.customer_status;

-- In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).
SELECT a.aircraft_name, COUNT(*) AS bookings_count
FROM Customer c
JOIN customer_flights cf ON c.customer_id = cf.customer_id
JOIN Flight f ON cf.flight_id = f.flight_id
JOIN Aircraft a ON f.aircraft_id = a.aircraft_id
WHERE c.customer_status = 'Gold'
GROUP BY a.aircraft_name
ORDER BY COUNT(*) DESC
LIMIT 1;