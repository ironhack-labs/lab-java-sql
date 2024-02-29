CREATE DATABASE lab_sql;

USE lab_sql;

CREATE TABLE posts(
	  id         INT NOT NULL auto_increment,
	  title      VARCHAR(255) NOT NULL,
	  word_count INT NOT NULL,
	  views      INT NOT NULL,
      author_id	 INT NOT NULL,
      PRIMARY KEY (id)
);
CREATE TABLE authors(
	  id         INT NOT NULL auto_increment,
	  author     VARCHAR(255) NOT NULL,
      PRIMARY KEY (id)
);
CREATE TABLE aircrafts(
	  id                     INT NOT NULL auto_increment,
	  aircraft               VARCHAR(255) NOT NULL,
	  total_aircraft_seats   INT NOT NULL,
	  PRIMARY KEY (id)
);
CREATE TABLE flights(
	  id                     INT NOT NULL auto_increment,
	  flight_number          VARCHAR(255) NOT NULL,
	  flight_mileage         INT NOT NULL,
      aircraft_id            INT NOT NULL,
	  PRIMARY KEY (id),
      FOREIGN KEY (aircraft_id) REFERENCES aircrafts(id)
);
CREATE TABLE customers(
	  id                     INT NOT NULL auto_increment,
	  customer_name          VARCHAR(255) NOT NULL,
	  customer_status        VARCHAR(255) NOT NULL,
      total_customer_mileage INT NOT NULL,
	  PRIMARY KEY (id)
);
CREATE TABLE customers_flights(
	  customer_id INT NOT NULL,
      flight_id   INT NOT NULL,
      FOREIGN KEY (customer_id) REFERENCES customers(id),
      FOREIGN KEY (flight_id) REFERENCES flights(id)
);
