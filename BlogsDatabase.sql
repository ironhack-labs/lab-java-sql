CREATE SCHEMA Blogs;

CREATE TABLE Blogs.Authors (
    ID int NOT NULL AUTO_INCREMENT,
    Name varchar(255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Blogs.Blogs (
    ID int NOT NULL AUTO_INCREMENT,
    AuthorID int NOT NULL,
    Title varchar(255) NOT NULL,
    WordCount int NOT NULL,
    Views int NOT NULL,
    PRIMARY KEY (ID),
	FOREIGN KEY (AuthorID) REFERENCES Authors(ID)
);

INSERT INTO Blogs.Authors (Name) VALUES
    ('Maria Charlotte'),
    ('Juan Perez'),
    ('Gemma Alcocer');

INSERT INTO Blogs.Blogs (AuthorID, Title, WordCount, Views) VALUES
    (1, 'Best Paint Colors', 814,14),
    (2, 'Small Space Decorating Tips', 1146, 221),
    (1, 'Hot Accessories', 986, 105),
    (1, 'Mixing Textures', 765, 22),
    (2, 'Kitchen Refresh', 1242, 307),
    (1, 'Homemade Art Hacks', 1002, 193),
    (3, 'Refinishing Wood Floors', 1571, 7542);
