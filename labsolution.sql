CREATE DATABASE blog_db;

CREATE DATABASE airline_db;


-- Blog Database
USE blog_db;

-- Create the authors table
CREATE TABLE authors (
                         author_id INT PRIMARY KEY AUTO_INCREMENT,
                         author_name VARCHAR(255) NOT NULL
);

-- Create the blog_posts table
CREATE TABLE blog_posts (
                            post_id INT PRIMARY KEY AUTO_INCREMENT,
                            title VARCHAR(255) NOT NULL,
                            word_count INT NOT NULL,
                            views INT NOT NULL,

                            author_id INT,
                            FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Airline Database

USE airline_db;

CREATE TABLE customers (
                           customer_id INT PRIMARY KEY AUTO_INCREMENT,
                           customer_name VARCHAR(255) NOT NULL,
                           customer_status VARCHAR(50) NOT NULL
);

-- Create the flights table
CREATE TABLE flights (
                         flight_id INT PRIMARY KEY AUTO_INCREMENT,
                         flight_number VARCHAR(50) NOT NULL,
                         aircraft VARCHAR(50) NOT NULL,
                         total_aircraft_seats INT,
                         flight_mileage INT,
                         total_customer_mileage INT,
                         customer_id INT,
                         FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, customer_name, customer_status)

VALUES(1,'Augustine Raviera','Silver'),
      (2,'Alaina Supulvida','None'),
      (3,'Tom Jones','Gold'),
      (4,'Sam Rio','None'),
      (5,'Jessica James','Silver'),
      (6,'Ana Janco','Silver'),
      (7,'Jennifer Cortez','Silver'),
      (8,'Christian Janco','Silver')
;

INSERT INTO flights(flight_id, flight_number, aircraft, total_aircraft_seats, flight_mileage, total_customer_mileage)

VALUES (1,'DL143','Boeing 747',400,135,115235),
       (2,'DL122','Airbus A330',236,4370,115235),
       (3,'DL122',	'Airbus A330',236,4370,6008),
       (5,'DL53','Boeing 777',264,2078,205767),
       (4,'DL122','Airbus A330',236,4370,205767),
       (6,'DL143','Boeing 747',400,135,2653),
       (7,'DL222','Boeing 777',264,1765,205767),
       (8,'DL143','Boeing 747',	400,135,127656),
       (9,'DL222','Boeing 777',	264,1765,136773),
       (10,'DL222','Boeing 777',264,1765,300582),
       (11,'DL122','Airbus A330',236,4370,127656),
       (12,'DL37','Boeing 747',400,531,2653),
       (13,'DL222','Boeing 777',264,1765,14642);








SELECT COUNT(*) AS total_flights
FROM flights;

SELECT AVG(flight_mileage) AS average_distance
FROM flights;

SELECT AVG(total_aircraft_seats) AS average_seats
FROM flights;

SELECT customer_status, AVG(total_customer_mileage) AS average_miles
FROM flights
         JOIN customers ON flights.customer_id = customers.customer_id
GROUP BY customer_status;

SELECT customer_status, MAX(total_customer_mileage) AS max_miles
FROM flights
         JOIN customers ON flights.customer_id = customers.customer_id
GROUP BY customer_status;

SELECT COUNT(*) AS boeing_aircraft_count
FROM flights
WHERE aircraft LIKE '%Boeing%';

SELECT *
FROM flights
WHERE flight_mileage BETWEEN 300 AND 2000;

SELECT c.customer_status, AVG(f.flight_mileage) AS avg_distance_booked
FROM flights f
         JOIN customers c ON f.customer_id = c.customer_id
GROUP BY c.customer_status;

SELECT f.aircraft, COUNT(f.flight_number) AS booking_count
FROM flights f
         JOIN customers c ON f.customer_id = c.customer_id
WHERE c.customer_status = 'Gold'
GROUP BY f.aircraft
ORDER BY booking_count DESC
    LIMIT 1;



