CREATE DATABASE airline_db;

USE airline_db;

CREATE TABLE customer (
                          id INTEGER PRIMARY KEY,
                          customer_name VARCHAR(50),
                          customer_status VARCHAR(10),
                          total_customer_mileage INTEGER
);

INSERT INTO customer (id, customer_name, customer_status, total_customer_mileage)
VALUES (1, 'Agustine Riviera', 'Silver', 115235),
       (2, 'Alaina Sepulvida', 'None', 6008),
       (3, 'Tom Jones', 'Gold', 205767),
       (4, 'Sam Rio', 'None', 2653),
       (5, 'Jessica James', 'Silver', 127656),
       (6, 'Ana Janco', 'Silver', 136773),
       (7, 'Jennifer Cortez', 'Gold', 300582),
       (8, 'Christian Janco', 'Silver', 14642);

CREATE TABLE aircraft (
                          id INTEGER PRIMARY KEY,
                          aircraft VARCHAR(50),
                          total_aircraft_seats INTEGER
);

INSERT INTO aircraft (id, aircraft, total_aircraft_seats)
VALUES (1, 'Airbus A330', 236),
       (2, 'Boeing 747', 400),
       (3, 'Boeing 777', 264);

CREATE TABLE flight (
                        id INTEGER PRIMARY KEY,
                        flight_number VARCHAR(10),
                        flight_mileage INTEGER,
                        aircraft_id INTEGER,
                        FOREIGN KEY (aircraft_id) REFERENCES aircraft(id)
);

INSERT INTO flight (id, flight_number, flight_mileage, aircraft_id)
VALUES (1, 'DL122', 4370, 1),
       (2, 'DL143', 135, 2),
       (3, 'DL222', 1765, 3),
       (4, 'DL37', 531, 2),
       (5, 'DL53', 2078, 3);

CREATE TABLE ticket (
                        id INTEGER PRIMARY KEY,
                        customer_id INTEGER,
                        FOREIGN KEY (customer_id) REFERENCES customer(id),
                        flight_id INTEGER,
                        FOREIGN KEY (flight_id) REFERENCES flight(id)
);

INSERT INTO ticket (id, customer_id, flight_id)
VALUES (1, 1, 2),
       (2, 1, 1),
       (3, 2, 1),
       (4, 3, 1),
       (5, 3, 5),
       (6, 4, 2),
       (7, 3, 3),
       (8, 5, 2),
       (9, 6, 3),
       (10, 7, 3),
       (11, 5, 1),
       (12, 4, 4),
       (13, 8, 3);


# 3. In the Airline database write the SQL script to get the total number of flights in the database.
SELECT COUNT(*) FROM flight;

# 4. In the Airline database write the SQL script to get the average flight distance.
SELECT AVG(flight_mileage) FROM flight;

# 5. In the Airline database write the SQL script to get the average number of seats.
SELECT AVG(total_aircraft_seats) FROM aircraft;

# 6. In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.
SELECT customer_status, AVG(total_customer_mileage)
FROM customer
GROUP BY customer_status;

# 7. In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
SELECT customer_status, MAX(total_customer_mileage)
FROM customer
GROUP BY customer_status;

# 8. In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.
SELECT COUNT(*)
FROM aircraft
WHERE aircraft LIKE '%Boeing%';

# 9. In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
SELECT *
FROM flight
WHERE flight_mileage BETWEEN 300 AND 2000;

# 10. In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).
SELECT customer.customer_status, AVG(flight.flight_mileage)
FROM ticket
JOIN flight ON ticket.flight_id = flight.id
JOIN customer ON ticket.customer_id = customer.id
GROUP BY customer.customer_status;

# 11. In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).
SELECT aircraft, COUNT(*) book_count
FROM ticket
JOIN customer ON ticket.customer_id = customer.id
JOIN flight ON ticket.flight_id = flight.id
JOIN aircraft ON flight.aircraft_id = aircraft.id
WHERE customer_status = 'Gold'
GROUP BY aircraft
ORDER BY book_count DESC
LIMIT 1;