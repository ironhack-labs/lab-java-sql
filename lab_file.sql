# Create the database blog
CREATE DATABASE blog_db;

# Use the database blog
USE blog_db;

# Create the authors table
CREATE TABLE authors (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(100) NOT NULL
);

# Create the posts table
CREATE TABLE posts (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       author_id INT,
                       title VARCHAR(255) NOT NULL,
                       word_count INT NOT NULL,
                       views INT NOT NULL,
                       FOREIGN KEY (author_id) REFERENCES authors(id)
);

# Insert data into the authors table
INSERT INTO authors (name) VALUES
                               ('Maria Charlotte'),
                               ('Juan Perez'),
                               ('Gemma Alcocer');

# Insert data into the posts table
INSERT INTO posts (author_id, title, word_count, views) VALUES
                                                            ((SELECT id FROM authors WHERE name = 'Maria Charlotte'), 'Best Paint Colors', 814, 14),
                                                            ((SELECT id FROM authors WHERE name = 'Juan Perez'), 'Small Space Decorating Tips', 1146, 221),
                                                            ((SELECT id FROM authors WHERE name = 'Maria Charlotte'), 'Hot Accessories', 986, 105),
                                                            ((SELECT id FROM authors WHERE name = 'Maria Charlotte'), 'Mixing Textures', 765, 22),
                                                            ((SELECT id FROM authors WHERE name = 'Juan Perez'), 'Kitchen Refresh', 1242, 307),
                                                            ((SELECT id FROM authors WHERE name = 'Maria Charlotte'), 'Homemade Art Hacks', 1002, 193),
                                                            ((SELECT id FROM authors WHERE name = 'Gemma Alcocer'), 'Refinishing Wood Floors', 1571, 7542);


# Create the database airline
CREATE DATABASE airline_db;

# Use the database airline
USE airline_db;

# Create the customers table
CREATE TABLE customers (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           name VARCHAR(100) NOT NULL,
                           status VARCHAR(50) NOT NULL
);

# Create the flights table
CREATE TABLE flights (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         flight_number VARCHAR(10) NOT NULL,
                         aircraft VARCHAR(50) NOT NULL,
                         total_seats INT NOT NULL,
                         mileage INT NOT NULL
);

# Create the bookings table
CREATE TABLE bookings (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          customer_id INT,
                          flight_id INT,
                          total_customer_mileage INT NOT NULL,
                          FOREIGN KEY (customer_id) REFERENCES customers(id),
                          FOREIGN KEY (flight_id) REFERENCES flights(id)
);

# Insert data into the customers table
INSERT INTO customers (name, status) VALUES
                                         ('Agustine Riviera', 'Silver'),
                                         ('Alaina Sepulvida', 'None'),
                                         ('Tom Jones', 'Gold'),
                                         ('Sam Rio', 'None'),
                                         ('Jessica James', 'Silver'),
                                         ('Ana Janco', 'Silver'),
                                         ('Jennifer Cortez', 'Gold'),
                                         ('Christian Janco', 'Silver');

# Insert data into the flights table
INSERT INTO flights (flight_number, aircraft, total_seats, mileage) VALUES
                                                                        ('DL143', 'Boeing 747', 400, 135),
                                                                        ('DL122', 'Airbus A330', 236, 4370),
                                                                        ('DL53', 'Boeing 777', 264, 2078),
                                                                        ('DL222', 'Boeing 777', 264, 1765),
                                                                        ('DL37', 'Boeing 747', 400, 531);

# Insert data into the bookings table
INSERT INTO bookings (customer_id, flight_id, total_customer_mileage) VALUES
                                                                          ((SELECT id FROM customers WHERE name = 'Agustine Riviera'), (SELECT id FROM flights WHERE flight_number = 'DL143'), 115235),
                                                                          ((SELECT id FROM customers WHERE name = 'Agustine Riviera'), (SELECT id FROM flights WHERE flight_number = 'DL122'), 115235),
                                                                          ((SELECT id FROM customers WHERE name = 'Alaina Sepulvida'), (SELECT id FROM flights WHERE flight_number = 'DL122'), 6008),
                                                                          ((SELECT id FROM customers WHERE name = 'Tom Jones'), (SELECT id FROM flights WHERE flight_number = 'DL122'), 205767),
                                                                          ((SELECT id FROM customers WHERE name = 'Tom Jones'), (SELECT id FROM flights WHERE flight_number = 'DL53'), 205767),
                                                                          ((SELECT id FROM customers WHERE name = 'Sam Rio'), (SELECT id FROM flights WHERE flight_number = 'DL143'), 2653),
                                                                          ((SELECT id FROM customers WHERE name = 'Tom Jones'), (SELECT id FROM flights WHERE flight_number = 'DL222'), 205767),
                                                                          ((SELECT id FROM customers WHERE name = 'Jessica James'), (SELECT id FROM flights WHERE flight_number = 'DL143'), 127656),
                                                                          ((SELECT id FROM customers WHERE name = 'Ana Janco'), (SELECT id FROM flights WHERE flight_number = 'DL222'), 136773),
                                                                          ((SELECT id FROM customers WHERE name = 'Jennifer Cortez'), (SELECT id FROM flights WHERE flight_number = 'DL222'), 300582),
                                                                          ((SELECT id FROM customers WHERE name = 'Jessica James'), (SELECT id FROM flights WHERE flight_number = 'DL122'), 127656),
                                                                          ((SELECT id FROM customers WHERE name = 'Sam Rio'), (SELECT id FROM flights WHERE flight_number = 'DL37'), 2653),
                                                                          ((SELECT id FROM customers WHERE name = 'Christian Janco'), (SELECT id FROM flights WHERE flight_number = 'DL222'), 14642);



USE airline_db;

# Get the total number of flights
SELECT COUNT(*) AS total_flights FROM flights;

# Get the average flight distance
SELECT AVG(mileage) AS average_flight_distance FROM flights;

# Get the average number of seats
SELECT AVG(total_seats) AS average_number_of_seats FROM flights;

# Get the average number of miles flown by customers grouped by status
SELECT c.status, AVG(b.total_customer_mileage) AS average_miles_flown
FROM customers c
         JOIN bookings b ON c.id = b.customer_id
GROUP BY c.status;

# Get the maximum number of miles flown by customers grouped by status
SELECT c.status, MAX(b.total_customer_mileage) AS max_miles_flown
FROM customers c
         JOIN bookings b ON c.id = b.customer_id
GROUP BY c.status;

# Get the total number of aircraft with a name containing 'Boeing'
SELECT COUNT(*) AS total_boeing_aircraft
FROM flights
WHERE aircraft LIKE '%Boeing%';

# Get the distance between 300 and 2000 miles
SELECT * FROM flights WHERE mileage BETWEEN 300 AND 2000;

# Calculates the average
SELECT c.status, AVG(f.mileage) AS avg_flight_distance
FROM bookings b
         JOIN customers c ON b.customer_id = c.id
         JOIN flights f ON b.flight_id = f.id
GROUP BY c.status;

# Find the most often booked aircraft by gold status members in airline database
SELECT f.aircraft, COUNT(*) AS bookings_count
FROM bookings b
         JOIN customers c ON b.customer_id = c.id
         JOIN flights f ON b.flight_id = f.id
WHERE c.status = 'Gold'
GROUP BY f.aircraft
ORDER BY bookings_count DESC
LIMIT 1;