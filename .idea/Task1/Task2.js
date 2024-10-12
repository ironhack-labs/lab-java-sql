CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(50),
    total_mileage INT
);

CREATE TABLE Aircraft (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    aircraft_type VARCHAR(255) NOT NULL,
    total_seats INT
);

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(10) NOT NULL,
    aircraft_id INT,
    flight_mileage INT,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    flight_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

INSERT INTO Aircraft (aircraft_type, total_seats)
VALUES
('Boeing 747', 400),
    ('Airbus A330', 236),
    ('Boeing 777', 264);


INSERT INTO Flights (flight_number, aircraft_id, flight_mileage)
VALUES
('DL143', 1, 135),
    ('DL122', 2, 4370),
    ('DL53', 3, 2078),
    ('DL222', 3, 1765),
    ('DL37', 1, 531);


INSERT INTO Customers (customer_name, customer_status, total_mileage)
VALUES
('Agustine Riviera', 'Silver', 115235),
    ('Alaina Sepulvida', 'None', 6008),
    ('Tom Jones', 'Gold', 205767),
    ('Sam Rio', 'None', 2653),
    ('Jessica James', 'Silver', 127656),
    ('Ana Janco', 'Silver', 136773),
    ('Jennifer Cortez', 'Gold', 300582),
    ('Christian Janco', 'Silver', 14642);


INSERT INTO Bookings (customer_id, flight_id)
VALUES
(1, 1), -- Agustine Riviera -> DL143
(1, 2), -- Agustine Riviera -> DL122
(2, 2), -- Alaina Sepulvida -> DL122
(3, 2), -- Tom Jones -> DL122
(3, 3), -- Tom Jones -> DL53
(4, 1), -- Sam Rio -> DL143
(5, 1), -- Jessica James -> DL143
(6, 4), -- Ana Janco -> DL222
(7, 4), -- Jennifer Cortez -> DL222
(8, 4); -- Christian Janco -> DL222

SELECT COUNT(*) AS total_flights
FROM Flights;

SELECT AVG(flight_mileage) AS average_flight_distance
FROM Flights;

SELECT AVG(total_seats) AS average_seats
FROM Aircraft;

SELECT customer_status, AVG(total_mileage) AS average_miles_flown
FROM Customers
GROUP BY customer_status;

SELECT customer_status, MAX(total_mileage) AS max_miles_flown
FROM Customers
GROUP BY customer_status;

SELECT COUNT(*) AS total_boeing_aircraft
FROM Aircraft
WHERE aircraft_type LIKE '%Boeing%';

SELECT flight_number, flight_mileage
FROM Flights
WHERE flight_mileage BETWEEN 300 AND 2000;

SELECT c.customer_status, AVG(f.flight_mileage) AS average_flight_distance
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Flights f ON b.flight_id = f.flight_id
GROUP BY c.customer_status;

SELECT a.aircraft_type, COUNT(*) AS booking_count
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Flights f ON b.flight_id = f.flight_id
JOIN Aircraft a ON f.aircraft_id = a.aircraft_id
WHERE c.customer_status = 'Gold'
GROUP BY a.aircraft_type
ORDER BY booking_count DESC
LIMIT 1;