
-- 1 Normalize the following blog database and write the DDL scripts to create the database tables: 

CREATE DATABASE LAB_3_02_Blog;

use LAB_3_02_Blog;

CREATE TABLE Author (
    author_name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE BlogPost (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    word_count INT NOT NULL,
    views INT NOT NULL,
    author_name VARCHAR(255),
    FOREIGN KEY (author_name) REFERENCES Author(author_name)
);

INSERT INTO Author (author_name) VALUES
    ('Maria Charlotte'),
    ('Juan Perez'),
    ('Gemma Alcocer');


INSERT INTO BlogPost (title, word_count, views, author_name) VALUES
    ('Best Paint Colors', 814, 14, 'Maria Charlotte'),
    ('Small Space Decorating Tips', 1146, 221, 'Juan Perez'),
    ('Hot Accessories', 986, 105, 'Maria Charlotte'),
    ('Mixing Textures', 765, 22, 'Maria Charlotte'),
    ('Kitchen Refresh', 1242, 307, 'Juan Perez'),
    ('Homemade Art Hacks', 1002, 193, 'Maria Charlotte'),
    ('Refinishing Wood Floors', 1571, 7542, 'Gemma Alcocer');
    

-- 2 Normalize the following airline database and write the DDL scripts to create the database tables:
   
CREATE DATABASE LAB_3_02_Airline;

use LAB_3_02_Airline;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    customer_status VARCHAR(50) NOT NULL,
    total_customer_mileage INT
);

CREATE TABLE Aircraft (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    aircraft_type VARCHAR(50) NOT NULL,
    total_seats INT NOT NULL
);

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(10) NOT NULL,
    aircraft_id INT,
    flight_mileage INT NOT NULL,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)
);

CREATE TABLE Operations (
    customer_id INT,
    flight_id INT,
    PRIMARY KEY (customer_id, flight_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

INSERT INTO Customers (customer_name, customer_status, total_customer_mileage) VALUES
    ('Agustine Riviera', 'Silver', 115235),
    ('Alaina Sepulvida', 'None', 6008),
    ('Tom Jones', 'Gold', 205767),
    ('Sam Rio', 'None', 2653),
    ('Jessica James', 'Silver', 127656),
    ('Ana Janco', 'Silver', 136773),
    ('Jennifer Cortez', 'Gold', 300582),
    ('Christian Janco', 'Silver', 14642);
   
INSERT INTO Aircraft (aircraft_type, total_seats) VALUES
    ('Boeing 747', 400),
    ('Airbus A330', 236),
    ('Boeing 777', 264);
   
INSERT INTO Flights (flight_number, aircraft_id, flight_mileage) VALUES
    ('DL143', 1, 135),
    ('DL122', 2, 4370),
    ('DL53', 3, 2078),
    ('DL222', 3, 1765),
    ('DL37', 1, 531);

INSERT INTO Operations (customer_id, flight_id) VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 2),
    (3, 3),
    (4, 1),
    (3, 4),
    (5, 1),
    (6, 4),
    (7, 4),
    (5, 2),
    (4, 5),
    (8, 4);
    
   
   
-- 3 In the Airline database write the SQL script to get the total number of flights in the database.

SELECT COUNT(*) as "Total_Flights" FROM Operations;

-- 4 In the Airline database write the SQL script to get the average flight distance.

select COUNT(*) as "Flights",
 sum(flight_mileage) as "Total_Miles",
 sum(flight_mileage)/COUNT(*) as "Miles_AVG",
 avg(flight_mileage) as "SQL_Miles_AVG"
from Flights;

-- 5 In the Airline database write the SQL script to get the average number of seats.
select 
COUNT(*) as "Flights",
 sum(total_seats) as "Total_Seats",
 sum(total_seats)/COUNT(*) as "Seats_AVG",
 avg(total_seats) as "SQL_Seats_AVG"
from 
	aircraft a ;

-- 6 In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.
select
    customer_status,
    avg(total_customer_mileage) as "AVG_Miles_Flown"
from
    Customers
group by
    customer_status
order by
    customer_status;
   
-- 7 In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
select 
    customer_status,
    max(total_customer_mileage) as "max_Miles_Flown"
from
    Customers
group by
    customer_status
order by
    customer_status;
   
-- 8 In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.
   
select
	count(*) as "Total_Boeing_Airplanes"
from
	aircraft a 
where 
	a.aircraft_type like "%Boeing%"
	
   
-- 9 In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
	
select 
	f.flight_number 
from 
	flights f 
where 
	f.flight_mileage > 300 and f.flight_mileage <2000

-- 10 In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).
select
	c.customer_status, 
	avg(f.flight_mileage) as "booked_mileage"
from
    Customers c
join
	operations o ON c.customer_id = o.customer_id 
join 
	flights f on o.flight_id = f.flight_id 
group by
    c.customer_status
order by
    c.customer_status;
	
-- 11 In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).
   
	select
 	c.customer_status,
 	a.aircraft_type,count(*)
from
    Customers c
join
	operations o ON c.customer_id = o.customer_id 
join 
	flights f on o.flight_id = f.flight_id 
join 
	aircraft a on f.aircraft_id = a.aircraft_id 
where 
	c.customer_status ='Gold'
group by
 	c.customer_status,
 	a.aircraft_type 
order by count(*) desc
limit 1
	