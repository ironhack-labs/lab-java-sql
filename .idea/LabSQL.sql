CREATE DATABASE authors_db;
USE authors_db;

CREATE TABLE authors(
                        author_id VARCHAR(3) PRIMARY KEY ,
                        name VARCHAR(50)
);
CREATE TABLE articles(
                         article_id INT PRIMARY KEY ,
                         author_id VARCHAR(3),
                         title VARCHAR(100),
                         word_count INT,
                         views INT,
                         FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
INSERT INTO authors(author_id, name)
VALUES  ('A1','Maria Charlotte'),
        ('A2', 'Juan Perez'),
        ('A3', 'Gemma Alcocer');

INSERT INTO articles(article_id, author_id, title, word_count, views)
VALUES (1,'A1', 'Best Paint Colors', 814, 14),
       (2, 'A2','Small Space Decorating Tips', 1146, 221),
       (3,'A1','Hot Accessories', 986, 105),
       (4, 'A1','Mixing Textures', 765, 22),
       (5, 'A2','Kitchen Refresh', 1242, 307),
       (6, 'A1','Homemade Art Hacks', 1002, 193),
       (7, 'A3','Refinishing Wood Floors', 1571, 7542);

CREATE DATABASE flight_agency_db;
USE flight_agency_db;

CREATE TABLE customer(
                         customer_id VARCHAR(3) PRIMARY KEY ,
                         customer_name VARCHAR(100),
                         customer_status VARCHAR(20),
                         customer_mileage INT
);
CREATE TABLE aircraft(
                         aircraft_id INT PRIMARY KEY ,
                         aircraft_name VARCHAR(20),
                         total_seats INT
);
CREATE table flight(
                       flight_number VARCHAR(10) PRIMARY KEY ,
                       aircraft_id INT,
                       flight_mileage INT,
                       FOREIGN KEY (aircraft_id) REFERENCES aircraft(aircraft_id)
);
CREATE TABLE passenger_list(
                               flight_Id VARCHAR(10),
                               FOREIGN KEY (flight_Id) REFERENCES flight(flight_number),
                               customer_id VARCHAR(3),
                               FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO customer (customer_id, customer_name, customer_status,customer_mileage)
VALUES ('C1', 'Agustine Riviera', 'Silver',115235),
       ('C2', 'Alaina Sepulvida', 'None',6008),
       ('C3', 'Tom Jones', 'Gold',205767),
       ('C4', 'Sam Rio', 'None', 2653),
       ('C5', 'Jessica James', 'Silver',127656),
       ('C6', 'Ana Janco', 'Silver',136773),
       ('C7', 'Jennifer Cortez', 'Gold',300582),
       ('C8', 'Christian Janco', 'Silver',14642);
INSERT INTO aircraft (aircraft_id, aircraft_name, total_seats)
VALUES (1, 'Boeing 747',400),
       (2, 'Airbus A330',236),
       (3, 'Boeing 777',264);
INSERT INTO flight ( flight_number, aircraft_id, flight_mileage)
VALUES ('DL143', 1 , 135),
       ( 'DL122', 2 , 4370),
       ( 'DL53', 3 , 2078),
       ( 'DL222', 3 , 1765),
       ( 'DL37', 1 , 531);

INSERT INTO passenger_list(flight_Id, customer_id)
VALUES ('DL143', 'C4'),
       ('DL143', 'C5'),
       ('DL122', 'C1'),
       ('DL122', 'C2'),
       ('DL122', 'C3'),
       ('DL122', 'C5'),
       ('DL53', 'C3'),
       ('DL222', 'C3'),
       ('DL222', 'C6'),
       ('DL222', 'C7'),
       ('DL222', 'C8'),
       ('DL37', 'C4');
#Instead of Airline I used flight_agency for my Database name
#In the Airline database write the SQL script to get the total number of flights in the database.
SELECT COUNT(*)FROM flight;

#In the Airline database write the SQL script to get the average flight distance
SELECT  AVG(flight.flight_mileage) FROM flight;

#In the Airline database write the SQL script to get the average number of seats.
SELECT AVG(aircraft.total_seats) FROM aircraft;

#In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.
SELECT AVG(customer.customer_mileage) FROM customer GROUP BY customer_status;

#In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
SELECT MAX(customer.customer_mileage) FROM customer GROUP BY customer_status;

#In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.
SELECT COUNT(aircraft.aircraft_name)  FROM aircraft WHERE aircraft_name LIKE 'Boeing%';

#In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
SELECT flight.flight_mileage FROM flight
WHERE flight_mileage BETWEEN 300 AND 2000;

#In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).
SELECT c.customer_status, AVG(f.flight_mileage) AS avg_flight_distance
FROM customer c
         JOIN aircraft ON c.customer_id = c.customer_id
         JOIN flight f ON aircraft.aircraft_id = f.aircraft_id
GROUP BY c.customer_status;

#In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).
SELECT a.aircraft_name, COUNT(p.flight_id) AS booking_count
FROM aircraft a
         JOIN passenger_list p ON a.aircraft_id = p.flight_id
         JOIN customer c ON p.customer_id = c.customer_status
WHERE c.customer_status = 'Gold'
GROUP BY a.aircraft_name
ORDER BY booking_count DESC
LIMIT 1;