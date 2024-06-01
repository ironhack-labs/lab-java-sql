-- Customers table
CREATE TABLE Customers (
                           customer_id INT PRIMARY KEY AUTO_INCREMENT,
                           customer_name VARCHAR(255),
                           customer_status VARCHAR(50),
                           total_customer_mileage INT
);

-- Aircrafts table
CREATE TABLE Aircrafts (
                           aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
                           aircraft_name VARCHAR(50),
                           total_seats INT
);

-- Flights table
CREATE TABLE Flights (
                         flight_id INT PRIMARY KEY AUTO_INCREMENT,
                         customer_id INT,
                         aircraft_id INT,
                         flight_number VARCHAR(10),
                         flight_mileage INT,
                         FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
                         FOREIGN KEY (aircraft_id) REFERENCES Aircrafts(aircraft_id)
);


-- 3. In the Airline database write the SQL script to get the total number of flights in the database.

SELECT COUNT(*) AS total_flights
FROM Flights;

-- 4. In the Airline database write the SQL script to get the average flight distance.

SELECT AVG(flight_mileage) AS average_flight_distance
FROM Flights;

-- . In the Airline database write the SQL script to get the average number of seats.

SELECT AVG(total_seats) AS average_seats
FROM Aircrafts;

-- 6. In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.

SELECT c.customer_status, AVG(c.total_customer_mileage) AS average_miles_per_status
FROM Customers c
GROUP BY c.customer_status;

-- 7. In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.

SELECT c.customer_status, MAX(c.total_customer_mileage) AS max_miles_per_status
FROM Customers c
GROUP BY c.customer_status;

-- 8. In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.

SELECT COUNT(*) AS total_boeing_aircraft
FROM Aircrafts
WHERE aircraft_name LIKE '%Boeing%';

-- 9. In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.

SELECT *
FROM Flights
WHERE flight_mileage BETWEEN 300 AND 2000;

-- 10. In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).

SELECT c.customer_status, AVG(f.flight_mileage) AS average_flight_distance
FROM Customers c
JOIN Flights f ON c.customer_id = f.customer_id
GROUP BY c.customer_status;


-- 11. In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).

SELECT a.aircraft_name, COUNT(*) AS bookings
FROM Flights f
JOIN Customers c ON f.customer_id = c.customer_id
JOIN Aircrafts a ON f.aircraft_id = a.aircraft_id
WHERE c.customer_status = 'Gold'
GROUP BY a.aircraft_name
ORDER BY bookings DESC
LIMIT 1;
