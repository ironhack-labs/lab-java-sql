drop schema if exists test;
create schema  test;
use test;

drop table if exists customer;
create table if not exists customer (
	cId INT auto_increment,
	customer_status VARCHAR(255),
	customer_name VARCHAR(255),
	total_customer_mileage INT,
	primary key (cId)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

drop table if exists aircraft;
create table if not exists aircraft (
	aircraft_id INT auto_increment,
	aircraft_name VARCHAR(255),
	aircraft_seats smallint,
	primary key (aircraft_id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

drop table if exists flights;
create table if not exists flights(
customer_id INT,
flight_number VARCHAR(255),
aircraft_id INT,
flight_mileage INT,
foreign key (customer_id) references customer(cId),
foreign key (aircraft_id) references aircraft(aircraft_id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;


insert into customer (customer_status, customer_name, total_customer_mileage)values
('Silver','Agustine Rivera', 115235), ('None','Alaina Sepulvida', 6008), ('Gold','Tom Jones',205767),
('None', 'Sam Rio', 2653), ('Silver','Jessica James', 127656), ('Silver', 'Ana janco', '136773'),
('Gold', 'Jennifer Cortez', 300582), ('Silver', 'Christian Janco', 14642);

insert into aircraft (aircraft_name, aircraft_seats) values ('Boeing 747',400), ('Airbus A330',236), ('Boeing 777', 264);

insert into flights (customer_id, flight_number, aircraft_id, flight_mileage)values(1,'DL143',1,135),(1,'DL122',2,4370),(2,'DL122',2,4370),(3,'DL122',2,4370),
(3,'DL53',3,2078),(4,'DL143',1,135),(3,'DL222',3,1765),(5,'DL143',1,135), (6,'DL222',3,1765), (7, 'DL222',3,1765),(5,'DL122',2,4370), (4,'DL37',1,531),(8,'DL222',3,1765);

select count(flight_number) from flights;
select avg(flight_mileage) from flights; 
select avg(aircraft_seats) from aircraft;
select avg(total_customer_mileage) from customer group by customer_status;
select max(total_customer_mileage) from customer group by customer_status; 
select count(*) from aircraft where aircraft_name like 'Boeing%';
select count(*) from flights where flight_mileage between 300 and 2000;
select c.customer_status, avg(flight_mileage) from customer c join flights f on c.cId = f.customer_id group by c.customer_status;
select a.aircraft_name, count(*) from customer c join flights f on c.cId = f.customer_id join aircraft a on f.aircraft_id = a.aircraft_id where c.customer_status = 'Gold' group by a.aircraft_id, a.aircraft_name order by count(*) desc limit 1;

