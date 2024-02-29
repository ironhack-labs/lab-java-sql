CREATE SCHEMA Airline;

CREATE TABLE airline.Flights(
ID int NOT NULL auto_increment,
FlightNumber varchar(100) NOT NULL,
FlightMileage int,
AircraftID int,
primary key (ID),
foreign key (AircraftID) references Aircrafts(ID)
);

CREATE TABLE airline.CustomersFlights(
CustomerID int,
FlightID int,
foreign key (CustomerID) references Customers(ID),
foreign key (FlightID) references  Flights(ID)
);

INSERT INTO airline.customers(CustomerName,CustomerStatus,CustomerMileage) VALUES
("Agustine Riviera", "Silver",115235),
("Alaina Sepulvida", null, 6008),
("Tom Jones","Gold",205767),
("Sam Rio", null,2635),
("Jessica James", "Silver",127656),
("Ana Janco", "Silver",136773),
("Jeniffer Cortez", "Gold",300582),
("Christian Janco", "Gold",14642);

INSERT INTO  airline.aircrafts(Aircraft,TotalAircraftSeats) VALUES
("Boeing 747",400),
("Airbus A330", 236),
("Boeing 777", 264);

INSERT INTO airline.flights(FlightNumber, FlightMileage, AircraftID) VALUES
("DL143", 135 ,1),
("DL122", 4370, 2),
("DL53", 2078, 3),
("DL222", 1765, 3),
("DL37", 531, 1);

INSERT INTO airline.customersFlights(CustomerID, FlightID) VALUES
(1,1),
(1,2),
(2,2),
(3,2),
(3,3),
(4,1),
(3,4),
(5,1),
(6,4),
(7,4),
(5,2),
(4,5),
(8,4);
