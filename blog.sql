DROP SCHEMA IF EXISTS SQL_EXAMPLE;
CREATE SCHEMA SQL_EXAMPLE;
USE SQL_EXAMPLE;

CREATE TABLE Autor(
	id INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Blog(
	Id INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    WordCount INT NOT NULL,
    Views INT,
    AutorId INT NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY(AutorId) references Autor(Id)
);

INSERT INTO Autor(Name) VALUES
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

INSERT INTO Blog(Title,WordCount,Views,AutorId) VALUES
('Best Paint Colors', 814, 14,1 ),
('Small Space Decorating Tips',1146,221,2),
('Hot Accessories',986,105, 1),
('Mixing Textures',765,22,1),
('Kitchen Refresh',1242,307,2),
('Homemade Art Hacks',1002,193,1),
('Refinishing Wood Floors',1571,7542,3);

select Blog.Title, Autor.Name
from Blog
join Autor on Blog.AutorId=Autor.Id;  