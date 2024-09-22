#Readme instruction 2
CREATE DATABASE airline;

USE airline;

CREATE TABLE aircrafts (
                           id INT AUTO_INCREMENT PRIMARY KEY ,
                           name VARCHAR(255) NOT NULL,
                           aircraft_seat INT NOT NULL
);

INSERT INTO aircrafts (name, aircraft_seat)
VALUES
    ('Boeing 747',400),
    ('Airbus A330',236),
    ('Boeing 777',262);


CREATE TABLE status_customer (
                                 id INT AUTO_INCREMENT PRIMARY KEY ,
                                 status VARCHAR(255)
);

INSERT INTO status_customer (status)
VALUES
    ('Silver'),
    ('None'),
    ('Gold');

CREATE TABLE customer (
                          id INT AUTO_INCREMENT PRIMARY KEY ,
                          name VARCHAR(255) NOT NULL,
                          status INT NOT NULL ,
                          FOREIGN KEY (status) REFERENCES status_customer(id)
);

INSERT INTO customer (name, status) VALUES
                                        ('Agustine Riviera',1),
                                        ('Alaina Sepulvida', 2),
                                        ('Tom Jones',3),
                                        ('Sam Rio',2),
                                        ('Jessica James',1),
                                        ('Ana Janco',1),
                                        ('Jennifer Cortez',3),
                                        ('Christian Janco',1);

CREATE TABLE flight (
                        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
                        name VARCHAR(255) NOT NULL,
                        mileage_flight INT NOT NULL,
                        aircraft INT NOT NULL ,
                        FOREIGN KEY (aircraft) REFERENCES aircrafts(id)
);

INSERT INTO flight (name, mileage_flight, aircraft)
VALUES
    ('DL143', 135, 1),
    ('DL122', 4370, 2),
    ('DL53', 2078,3),
    ('DL222', 1765,3),
    ('DL37', 531,1);

CREATE TABLE flight_customer (
                                 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
                                 flight INT NOT NULL,
                                 customer INT NOT NULL,
                                 customer_mileage INT NOT NULL,
                                 FOREIGN KEY (flight) REFERENCES flight(id),
                                 FOREIGN KEY (customer) REFERENCES customer(id)
);

INSERT INTO flight_customer (flight, customer, customer_mileage)
VALUES
    (1,1,115235),
    (2,1,115235),
    (2,2,6008),
    (2,3,205767),
    (3,3,205767),
    (4,3,205767),
    (1,4,2653),
    (5,4,2653),
    (1,5,127656),
    (2,5,127656),
    (4,6,136773),
    (4,7,300582),
    (4,8,14642);

