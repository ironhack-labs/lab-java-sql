DROP SCHEMA IF EXISTS AIRLINEDB;
CREATE SCHEMA AIRLINEDB;
USE AIRLINEDB;

CREATE Table Customer_Info(
	Id int NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Status VARCHAR(64),
    TotalMileage int NOT NULL,
    PRIMARY KEY(Id)
);

CREATE Table Aircraft_Info(
	Id int NOT NULL AUTO_INCREMENT,
    Model VARCHAR(64) NOT NULL,
    TotalSeats INT NOT NULL,
    PRIMARY KEY(Id)
);


CREATE TABLE Fligths_Info(
	Id int NOT NULL AUTO_INCREMENT,
    Number VARCHAR(64) NOT NULL,
    Mileage INT NOT NULL,
	PRIMARY KEY(Id)
);

CREATE TABLE Reservations(
	Id int NOT NULL AUTO_INCREMENT,
    FligthId INT NOT NULL,
    CustomerId INT NOT NULL,
    AircraftId INT NOT NULL,
	PRIMARY KEY(Id),
    FOREIGN KEY(FligthId) references Fligths_Info(Id),
    FOREIGN KEY(CustomerId) references Customer_Info(Id),
    FOREIGN KEY(AircraftId) references Aircraft_Info(Id)
);


INSERT INTO Customer_Info(Name, Status, TotalMileage) VALUES
('Agustine Riviera','Silver',115235),
('Alaina Sepulvida','',6008),
('Tom Jones','Gold',205767),
('Sam Rio','', 2653),
('Jessica James','Silver',	127656),
('Christian Janco','Silver',14642),
('Ana Janco','Silver',136773),
('Jennifer Cortez',	'Gold',	300582);

INSERT INTO Aircraft_Info(Model,TotalSeats) Values
('Boeing 747',400),
('Airbus A330',236),
('Boeing 777',264)
;

INSERT INTO Fligths_Info(Number,Mileage) VALUES
('DL143',135),
('DL122',4370),
('DL53',2078),
('DL37',531),
('DL222',1765);

INSERT INTO Reservations(FligthId,CustomerId,AircraftId) Values
(1,17,1),
(2,17,1),
(2,18,1),
(2,19,2),
(3,19,2),
(1,20,2),
(4,20,2),
(1,21,2),
(2,21,3),
(2,22,1),
(5,23,3),
(5,24,3);


select COUNT(*) from Fligths_Info;
select AVG(Mileage) from Fligths_Info;
select AVG(TotalSeats) from Aircraft_Info;
select AVG(TotalMileage),Status from Customer_Info Group by Status;
select MAX(TotalMileage),Status from Customer_Info Group by Status;
select COUNT(*) from Aircraft_Info where Model like "Boeing%";
select * from Fligths_Info where Mileage>300 and Mileage<2000;

SELECT AVG(Fligths_Info.Mileage), Customer_Info.Status
FROM Reservations 
JOIN Fligths_Info ON Reservations.FligthId = Fligths_Info.Id
JOIN Customer_Info ON Reservations.CustomerId = Customer_Info.Id
group by Customer_Info.Status;

Select max(ReservationModel) from(
SELECT Aircraft_Info.Model AS ReservationModel, COUNT(*) AS Reservation_Count
FROM Reservations 
JOIN Fligths_Info ON Reservations.FligthId = Fligths_Info.Id
JOIN Customer_Info ON Reservations.CustomerId = Customer_Info.Id
JOIN Aircraft_Info ON Reservations.AircraftId = Aircraft_Info.Id
GROUP BY Aircraft_Info.Model
) as Counts;
SELECT *
FROM Reservations 
JOIN Fligths_Info ON Reservations.FligthId = Fligths_Info.Id
JOIN Customer_Info ON Reservations.CustomerId = Customer_Info.Id;
