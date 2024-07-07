
insert into customers (first_name, last_name, status, mileage) values
                       ('Agustine', 'Riviera', 'Silver', 115235),
                       ('Alaina', 'Sepulvida', 'None', 6008),
                       ('Tom', 'Jones', 'Gold', 205767),
                       ('Sam', 'Rio', 'None', 2653),
                       ('Jessica', 'James', 'Silver', 127656),
                       ('Ana', 'Janco', 'Silver', 136773),
                       ('Jennifer', 'Cortez', 'Gold', 300582),
                       ('Christian', 'Janco', 'Silver', 14642);


insert into flights (flight_number, aircraft, seats, mileage) values
                  ('DL143', 'Boeing 747', 400, 135),
                  ('DL122', 'Airbus A330', 236, 4370),
                  ('DL53', 'Boeing 777', 264, 2078),
                  ('DL222', 'Boeing 777', 264, 1765),
                  ('DL37', 'Boeing 777', 400, 531);



insert into customer_flight (customer_id, flight_id) values
                                                         (1,	1),
                                                         (1,	1),
                                                         (1,	1),
                                                         (1,	1),
                                                         (1,	2),
                                                         (2,	2),
                                                         (3,	2),
                                                         (3,	3),
                                                         (3,	4),
                                                         (4,	1),
                                                         (4,	1),
                                                         (4,	5),
                                                         (5,	1),
                                                         (5,	2),
                                                         (6,	4),
                                                         (7,	4),
                                                         (8,	4);