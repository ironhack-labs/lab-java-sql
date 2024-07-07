
create table customers (
           customer_id int auto_increment primary key,
           first_name varchar(255),
           last_name varchar(255),
           status varchar(255),
           mileage int
);


create table flights (
             flight_id int auto_increment primary key,
             flight_number varchar(255),
             aircraft varchar(255),
             seats int,
             mileage int
);

create table customer_flight (
             customer_flight_id int auto_increment primary key,
             customer_id int,
             flight_id int
);



