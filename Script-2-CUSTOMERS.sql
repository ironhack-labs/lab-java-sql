
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    status VARCHAR(255),
    total_mileage INT
);


CREATE TABLE aircraft (
    aircraft_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    total_seats INT
);


CREATE TABLE flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(255) NOT NULL,
    aircraft_id INT NOT NULL,
    flight_mileage INT,
    FOREIGN KEY (aircraft_id) REFERENCES aircraft(aircraft_id)
);


CREATE TABLE customer_flights (
    customer_id INT NOT NULL,
    flight_id INT NOT NULL,
    PRIMARY KEY (customer_id, flight_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);


INSERT INTO aircraft (type, total_seats) VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);


INSERT INTO customers (name, status, total_mileage) VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);


INSERT INTO flights (flight_number, aircraft_id, flight_mileage) VALUES
('DL143', 1, 135),
('DL122', 2, 4370),
('DL53', 3, 2078),
('DL222', 3, 1765),
('DL37', 1, 531);


INSERT INTO customer_flights (customer_id, flight_id) VALUES
((SELECT customer_id FROM customers WHERE name = 'Agustine Riviera'), (SELECT flight_id FROM flights WHERE flight_number = 'DL143')),
((SELECT customer_id FROM customers WHERE name = 'Agustine Riviera'), (SELECT flight_id FROM flights WHERE flight_number = 'DL122')),
((SELECT customer_id FROM customers WHERE name = 'Alaina Sepulvida'), (SELECT flight_id FROM flights WHERE flight_number = 'DL122')),
((SELECT customer_id FROM customers WHERE name = 'Tom Jones'), (SELECT flight_id FROM flights WHERE flight_number = 'DL122')),


SELECT COUNT(*) AS total_flights FROM flights;	SELECT AVG(flight_mileage) AS average_flight_distance FROM flights;
SELECT AVG(total_seats) AS average_seats FROM aircraft;
SELECT status, AVG(total_mileage) AS average_miles_flown 
    
FROM customers 
GROUP BY status;


SELECT status, MAX(total_mileage) AS max_miles_flown 
FROM customers 
GROUP BY status;

SELECT COUNT(*) AS total_boeing_aircraft 
FROM aircraft 
WHERE type LIKE '%Boeing%';

SELECT * 
FROM flights 
WHERE flight_mileage BETWEEN 300 AND 2000;


SELECT c.status, AVG(f.flight_mileage) AS average_flight_distance
FROM customer_flights cf
JOIN customers c ON cf.customer_id = c.customer_id
JOIN flights f ON cf.flight_id = f.flight_id
GROUP BY c.status;


SELECT a.type, COUNT(*) AS booking_count
FROM customer_flights cf
JOIN customers c ON cf.customer_id = c.customer_id
JOIN flights f ON cf.flight_id = f.flight_id
JOIN aircraft a ON f.aircraft_id = a.aircraft_id
WHERE c.status = 'Gold'
GROUP BY a.type
ORDER BY booking_count DESC
LIMIT 1;
