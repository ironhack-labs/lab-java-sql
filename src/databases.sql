/*1. Normalize the following blog database and write the DDL scripts to create the database tables:*/
create schema if not exists library;
use library;

create table authors (
	id int auto_increment primary key,
    name varchar(255) not null
);

create table books (
	id int auto_increment primary key,
    title varchar(255),
    word_count int not null,
    views int not null,
    author_id int,
    foreign key (author_id) references authors(id)
);

insert into authors (name) values
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

insert into books (title, word_count, views, author_id) values
('Best Paint Colors', 814, 14, 1),
('Small Space Decorating Tips', 1146, 221, 2),
('Hot Accessories', 986, 105, 1),
('Mixing Textures', 765, 22, 1),
('Kitchen Refresh', 1242, 307, 2),
('Homemade Art Hacks', 1002, 193, 1),
('Refinishing Wood Floors', 1571, 7542, 3);



/*2. Normalize the following airline database and write the DDL scripts to create the database tables:*/
create schema if not exists airline;
use airline;

create table customers(
	id int auto_increment primary key,
    name varchar(255) not null,
    status varchar(50)
);

create table flights(
	id int primary key,
    flight_number varchar(10),
    aircraft varchar(50) not null,
    total_aircraft_seats int not null,
    flight_mileage int not null
);

create table customer_flights(
	id int not null,
	customer_id int not null,
    flight_id int not null,
    total_customer_mileage int not null,
    primary key (id),
    foreign key (customer_id) references customers(id),
    foreign key (flight_id) references flights(id)
);

insert into customers(id, name, status) values
(1, 'Agustine Riviera', 'Silver'),
(2, 'Alaina Sepulvida', 'None'),
(3, 'Tom Jones', 'Gold'),
(4, 'Sam Rio', 'None'),
(5, 'Jessica James', 'Silver'),
(6, 'Ana Janco', 'Silver'),
(7, 'Jennifer Cortez', 'Gold'),
(8, 'Christian Janco', 'Silver');

insert into flights (id, flight_number, aircraft, total_aircraft_seats, flight_mileage) values
(1, 'DL143', 'Boeing 747', 400, 135),
(2, 'DL122', 'Airbus A330', 236, 4370),
(3, 'DL53', 'Boeing 777', 264, 2078),
(4, 'DL222', 'Boeing 777', 264, 1765),
(5, 'DL37', 'Boeing 747', 400, 531);

insert into customer_flights (id, customer_id, flight_id, total_customer_mileage) values
(1, 1, 1, 115235),
(2, 1, 2, 115235),
(3, 1, 1, 115235),
(4, 1, 1, 115235),
(5, 2, 2, 6008),
(6, 4, 1, 2653),
(7, 4, 1, 2653),
(8, 5, 1, 127656),
(9, 6, 2, 136773),
(10, 7, 2, 300582),
(11, 8, 2, 14642);

/*3. In the Airline database write the SQL script to get the total number of flights in the database.*/
select count(*) from flights;

/*4. In the Airline database write the SQL script to get the average flight distance.*/
select avg(flight_mileage) from flights;

/*5. In the Airline database write the SQL script to get the average number of seats.*/
select avg(total_aircraft_seats) from flights;

/*6. In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.*/
select c.status, avg(total_customer_mileage) from customers c join customer_flights cf on c.id = cf.customer_id group by c.status;

/*7. In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.*/
select c.status, max(total_customer_mileage) from customers c join customer_flights cf on c.id = cf.customer_id group by c.status;

/*8. In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.*/
select count(*) from flights f where f.aircraft like '%Boeing%';

/*9. In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.*/
select * from flights f where f.flight_mileage between 300 and 2000;

/*10. In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).*/
select c.status, avg(f.flight_mileage)
from customers c
join customer_flights cf on c.id = cf.customer_id
join flights f on cf.flight_id = f.id
group by c.status;

/*11. In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).*/
select f.aircraft, count(*)
from customers c
join customer_flights cf on c.id = cf.customer_id
join flights f on cf.flight_id = f.id
where c.status = 'Gold'
group by f.aircraft;
