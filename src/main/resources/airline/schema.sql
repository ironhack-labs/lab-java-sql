CREATE database Airline;

CREATE TABLE customer(
  	id int NOT NULL AUTO_INCREMENT,
  	name varchar(100) NOT NULL,
  	status varchar(10) NOT NULL,
  	total_mileage int NOT NULL,
  	PRIMARY KEY (id)
);

CREATE TABLE aircraft(
    id int NOT NULL AUTO_INCREMENT,
	model varchar(25) NOT NULL UNIQUE,
	seats smallint NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE flight(
	id int NOT NULL AUTO_INCREMENT,
	number varchar(5) NOT NULL,
    aircraft_id int NOT NULL,
    mileage smallint NOT NULL,
	PRIMARY KEY (ID),
    FOREIGN KEY (aircraft_id) REFERENCES aircraft(id),
	UNIQUE KEY (number, aircraft_id)
);

CREATE TABLE ticket(
	id int NOT NULL AUTO_INCREMENT,
    customer_id int NOT NULL,
	flight_id int NOT NULL,
    aircraft_id int NOT NULL,
	PRIMARY KEY (ID),
    FOREIGN KEY (aircraft_id) REFERENCES aircraft(id),
    FOREIGN KEY (flight_id) REFERENCES flight(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);



