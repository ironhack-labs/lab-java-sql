create database lab_sql2;
use lab_sql2;
# 1 Normalize the following blog database and write the DDL scripts to create the database tables:
create table blog(
	author varchar(100),
    title varchar(100),
    word_count int,
    views int
); 

INSERT INTO blog (author, title, word_count, views) VALUES
('Maria Charlotte', 'Best Paint Colors', 814, 14),
('Juan Perez', 'Small Space Decorating Tips', 1146, 221),
('Maria Charlotte', 'Hot Accessories', 986, 105),
('Maria Charlotte', 'Mixing Textures', 765, 22),
('Juan Perez', 'Kitchen Refresh', 1242, 307),
('Maria Charlotte', 'Homemade Art Hacks', 1002, 193),
('Gemma Alcocer', 'Refinishing Wood Floors', 1571, 7542);


#2 Normalize the following airline database and write the DDL scripts to create the database tables:

create table airline (
	customer_name varchar(100),
    customer_status varchar(100),
    flight_number varchar(5),
    aircraft varchar(50),
    total_aircraft_seats int,
    flight_mileage int,
    total_customer_mileage int
);

INSERT INTO airline (
    customer_name, customer_status, flight_number,
    aircraft, total_aircraft_seats,
    flight_mileage, total_customer_mileage
) VALUES
('Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
('Agustine Riviera', 'Silver', 'DL122', 'Airbus A330', 236, 4370, 115235),
('Alaina Sepulvida', 'None', 'DL122', 'Airbus A330', 236, 4370, 6008),
('Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
('Tom Jones', 'Gold', 'DL122', 'Airbus A330', 236, 4370, 205767),
('Tom Jones', 'Gold', 'DL53', 'Boeing 777', 264, 2078, 205767),
('Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
('Sam Rio', 'None', 'DL143', 'Boeing 747', 400, 135, 2653),
('Agustine Riviera', 'Silver', 'DL143', 'Boeing 747', 400, 135, 115235),
('Tom Jones', 'Gold', 'DL222', 'Boeing 777', 264, 1765, 205767),
('Jessica James', 'Silver', 'DL143', 'Boeing 747', 400, 135, 127656),
('Sam Rio', 'None', 'DL143', 'Boeing 747', 400, 135, 2653),
('Ana Janco', 'Silver', 'DL222', 'Boeing 777', 264, 1765, 136773),
('Jennifer Cortez', 'Gold', 'DL222', 'Boeing 777', 264, 1765, 300582),
('Jessica James', 'Silver', 'DL122', 'Airbus A330', 236, 4370, 127656),
('Sam Rio', 'None', 'DL37', 'Boeing 747', 400, 531, 2653),
('Christian Janco', 'Silver', 'DL222', 'Boeing 777', 264, 1765, 14642);



#3 In the Airline database write the SQL script to get the total number of flights in the database.
select count(*) as total_flights from airline;

#4 In the Airline database write the SQL script to get the average flight distance.

select avg(flight_mileage) as flight_distance from airline;

#5 In the Airline database write the SQL script to get the average number of seats.

select avg(total_aircraft_seats) as avg_numbers_seats from airline;

#6 In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.

select customer_status, avg(total_customer_mileage) as avg_miles from airline group by customer_status;

#7 In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
select customer_status,max(total_customer_mileage) from airline group by customer_status;

#8 In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.
select count(*)
from airline
where aircraft='Boeing 747';

#9 In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
select *
from airline
where flight_mileage between 300 and 2000;

#10 In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).
select customer_status,avg(flight_mileage)
from airline
group by customer_status;

# 11 In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).