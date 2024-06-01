CREATE DATABASE Authors;
USE Authors;

#Create Authors Table

CREATE TABLE Authors(
                        author_id VARCHAR(5)  PRIMARY KEY,
                        author_name VARCHAR(100)
);

#Create Articles Table
CREATE TABLE Articles(
                         article_id INT  PRIMARY KEY,
                         author_id VARCHAR(5),
                         title VARCHAR(100),
                         word_count INT,
                         views INT,
                         FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

INSERT INTO Authors (author_id, author_name)
VALUES ('A1','Maria Charlotte'),
       ('A2','Juan Perez'),
       ('A3','Gemma Alcocer');


INSERT INTO Articles(article_id, author_id, title, word_count, views)
VALUES (1,'A1','Best Paint Colors',814,14),
       (2,'A2' ,'Small Space Decorating Tips', 1146, 221),
       (3,'A1' ,'Hot Accessories', 986, 105),
       (4,'A1' ,'Mixing Textures', 765, 22),
       (5,'A2' ,'Kitchen Refresh', 1242, 307),
       (6,'A1' ,'Homemade Art Hacks', 1002, 193),
       (7,'A3' ,'Refinishing Wood Floors', 1571, 7542);

CREATE DATABASE flight_agency_db;

USE flight_agency_db;

CREATE TABLE customer(
                         customer_ID VARCHAR(5) PRIMARY KEY,
                         customer_name VARCHAR(100),
                         customer_status VARCHAR(20),
                         customer_mileage INT
);
CREATE TABLE aircraft(
                         aircraft_id INT PRIMARY KEY,
                         aircraft_name VARCHAR(20),
                         total_seats INT
);
CREATE TABLE flight(
                       flight_number VARCHAR(10) PRIMARY KEY,
                       aircraft_id INT,
                       flight_mileage INT,
                       FOREIGN KEY (aircraft_id) REFERENCES aircraft(aircraft_id)
);
CREATE TABLE passenger_list(
                               flight_id VARCHAR(10),
                               FOREIGN KEY (flight_id)REFERENCES flight(flight_number),
                               customer_id VARCHAR(5),
                               FOREIGN KEY (customer_id)REFERENCES customer(customer_ID)
);

INSERT INTO customer(customer_ID, customer_name, customer_status, customer_mileage)
VALUES('C1','Agustine Riviera','Silver',115235),
      ('C2','Alaina Sepulvida','None',6008),
      ('C3','Tom Jones','Gold',205767),
      ('C4','Sam Rio','None',2653),
      ('C5','Jessica James','Silver',127656),
      ('C6','Ana Janco','Silver',136773),
      ('C7','Jennifer Cortez','Gold',300582),
      ('C8','Christian Janco','Silver',14642);
INSERT INTO aircraft(aircraft_id, aircraft_name, total_seats)
VALUES (1,'Boeing 747',400),
       (2,'Airbus A330',236),
       (3,'Boeing 777',264);
INSERT INTO flight(flight_number, aircraft_id, flight_mileage)
VALUES('DL143',1,135),
      ('DL122',2,4370),
      ('DL222',3,1765),
      ('DL37',1,531),
      ('DL53',3,2078);
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
