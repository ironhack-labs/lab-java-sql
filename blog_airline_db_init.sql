CREATE DATABASE blog_details_db;
USE blog_details_db;

CREATE TABLE author(
                       author_id VARCHAR(6),
                       name VARCHAR(50),
                       PRIMARY KEY (author_id)
);

CREATE TABLE blog(
                     id INT,
                     author_id VARCHAR(6),
                     title VARCHAR(50),
                     word_count INT,
                     views INT,
                     PRIMARY KEY (id),
                     FOREIGN KEY (author_id) REFERENCES author(author_id)
);



INSERT INTO author (author_id, name) VALUES
                                         ('MC', 'Maria Charlotte'),
                                         ('JP', 'Juan Perez'),
                                         ('GA', 'Gemma Alcocer');

INSERT INTO blog (id, author_id, title, word_count, views) VALUES
                                                               ('1', 'MC', 'Best Paint Colors', '814', '14'),
                                                               ('2', 'JP','Small Space Decorating Tips', '1146', '221'),
                                                               ('3', 'MC', 'Hot Accessories', '986', '105'),
                                                               ('4', 'MC', 'Mixing Textures', '765', '22'),
                                                               ('5', 'JP', 'Kitchen Refresh	', '1242', '307'),
                                                               ('6', 'MC', 'Homemade Art Hacks', '1002', '193'),
                                                               ('7', 'GA', 'Refinishing Wood Floors', '1571', '7542');

/*----------------------------------------------------------------------*/

CREATE DATABASE airline_db;
USE airline_db;

CREATE TABLE customer(
                         id VARCHAR(2),
                         name VARCHAR(50),
                         status VARCHAR(10),
                         mileage LONG,
                         PRIMARY KEY (id)
);

CREATE TABLE aircraft(
                         id VARCHAR(30),
                         flight_number VARCHAR(5),
                         total_seats LONG,
                         flight_mileage LONG,
                         PRIMARY KEY (id)
);

CREATE TABLE airlines
(
    id          INT AUTO_INCREMENT,
    customer_id VARCHAR(2),
    aircraft_id VARCHAR(30),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (aircraft_id) REFERENCES aircraft (id)
);

INSERT INTO customer (id, name, status, mileage) VALUES
                                                     ('AR', 'Agustine Riviera', 'Silver', '115235'),
                                                     ('AS', 'Alaina Sepulvida', 'None', '6008'),
                                                     ('TJ', 'Tom Jones', 'Gold', '205767'),
                                                     ('SR', 'Sam Rio', 'None', '2653'),
                                                     ('JJ', 'Jessica James', 'Silver', '127656'),
                                                     ('AJ', 'Ana Janco', 'Silver', '136773'),
                                                     ('JC', 'Jennifer Cortez', 'Gold', '300582'),
                                                     ('CJ', 'Christian Janco', 'Silver', '14642');

INSERT INTO aircraft (id, flight_number, total_seats, flight_mileage) VALUES
                                                                          ('Boeing 747', 'DL143', '400', '135'),
                                                                          ('Boeing 777', 'DL53', '264', '2078'),
                                                                          ('Airbus A330', 'DL122', '236', '4370');

INSERT INTO airlines (customer_id, aircraft_id) VALUES
                                                    ('AR', 'Boeing 747'),
                                                    ('AR', 'Airbus A330'),
                                                    ('AS', 'Boeing 747'),
                                                    ('TJ', 'Airbus A330'),
                                                    ('TJ', 'Boeing 777'),
                                                    ('SR', 'Boeing 747'),
                                                    ('JJ', 'Boeing 747'),
                                                    ('JJ', 'Airbus A330'),
                                                    ('AJ', 'Boeing 777'),
                                                    ('JC', 'Boeing 777'),
                                                    ('CJ', 'Boeing 777');

/* 3. SQL script to get the total number of flights in the database.*/
SELECT COUNT(aircraft.flight_number) FROM aircraft;

/* 4. SQL script to get the average flight distance.*/
SELECT AVG(aircraft.flight_mileage) FROM aircraft;

/* 5. SQL script to get the average number of seats.*/
SELECT AVG(aircraft.total_seats) FROM aircraft;

/* 6. SQL script to get the average number of miles flown by customers grouped by status.*/
SELECT status, AVG(customer.mileage) FROM customer GROUP BY status;

/* 7.  SQL script to get the maximum number of miles flown by customers grouped by status.*/
SELECT status, MAX(customer.mileage) FROM customer GROUP BY status;

/* 8. SQL script to get the total number of aircraft with a name containing Boeing.*/
SELECT COUNT(aircraft.flight_number) FROM aircraft WHERE id LIKE 'Boeing%';

/* 9. SQL script to find all flights with a distance between 300 and 2000 miles.*/
SELECT aircraft.id FROM aircraft WHERE flight_mileage BETWEEN 100 AND 2000;

/* 10. SQL script to find the average flight distance booked grouped by customer status.*/
SELECT AVG(aircraft.flight_mileage)
FROM aircraft
         INNER JOIN customer
                    ON aircraft.id = customer.id
GROUP BY status;

/* 1SQL script to find the most often booked aircraft by gold status members */
SELECT MAX(COUNT(aircraft_id))
FROM airlines
         INNER JOIN customer
                    ON aircraft.id = customer.id
GROUP BY status;