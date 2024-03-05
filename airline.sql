CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(50)
);

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(50) NOT NULL,
    aircraft VARCHAR(50) NOT NULL,
    total_aircraft_seats INT NOT NULL,
    flight_mileage INT NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Aircraft (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    aircraft_name VARCHAR(50) NOT NULL
);

-- Insert customers
INSERT INTO Customers (customer_name, customer_status) VALUES
    ('Agustine Riviera', 'Silver'),
    ('Alaina Sepulvida', 'None'),
    ('Tom Jones', 'Gold'),
    ('Sam Rio', 'None'),
    ('Jessica James', 'Silver'),
    ('Ana Janco', 'Silver'),
    ('Jennifer Cortez', 'Gold'),
    ('Christian Janco', 'Silver');

-- Insert aircraft
INSERT INTO Aircraft (aircraft_name) VALUES
    ('Boeing 747'),
    ('Airbus A330'),
    ('Boeing 777');

-- Insert flights
INSERT INTO Flights (flight_number, aircraft, total_aircraft_seats, flight_mileage, customer_id) VALUES
    ('DL143', 'Boeing 747', 400, 135, 1),
    ('DL122', 'Airbus A330', 236, 4370, 1),
    ('DL122', 'Airbus A330', 236, 4370, 2),
    ('DL143', 'Boeing 747', 400, 135, 1),
    ('DL122', 'Airbus A330', 236, 4370, 3),
    ('DL53', 'Boeing 777', 264, 2078, 3),
    ('DL143', 'Boeing 747', 400, 135, 1),
    ('DL143', 'Boeing 747', 400, 135, 4),
    ('DL143', 'Boeing 747', 400, 135, 1),
    ('DL222', 'Boeing 777', 264, 1765, 5),
    ('DL143', 'Boeing 747', 400, 135, 6),
    ('DL222', 'Boeing 777', 264, 1765, 7),
    ('DL222', 'Boeing 777', 264, 1765, 8),
    ('DL122', 'Airbus A330', 236, 4370, 5),
    ('DL37', 'Boeing 747', 400, 531, 4),
    ('DL222', 'Boeing 777', 264, 1765, 9);

SELECT COUNT(*) AS total_flights
FROM Flights;

SELECT AVG(flight_mileage) AS average_flight_distance
FROM Flights;

SELECT AVG(total_aircraft_seats) AS average_seats
FROM Flights;

SELECT customer_status, AVG(flight_mileage) AS average_miles
FROM Customers
JOIN Flights ON Customers.customer_id = Flights.customer_id
GROUP BY customer_status;

SELECT COUNT(*) AS total_boeing_aircraft
FROM Aircraft
WHERE aircraft_name LIKE '%Boeing%';

SELECT *
FROM Flights
WHERE flight_mileage BETWEEN 300 AND 2000;

SELECT C.customer_status, AVG(F.flight_mileage) AS avg_distance_booked
FROM Customers C
JOIN Flights F ON C.customer_id = F.customer_id
GROUP BY C.customer_status;

SELECT A.aircraft_name, COUNT(F.flight_id) AS bookings_count
FROM Aircraft A
JOIN Flights F ON A.aircraft_id = F.aircraft_id
JOIN Customers C ON F.customer_id = C.customer_id
WHERE C.customer_status = 'Gold'
GROUP BY A.aircraft_name
ORDER BY bookings_count DESC
LIMIT 1;
