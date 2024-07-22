CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    AuthorName VARCHAR(100) NOT NULL
);

CREATE TABLE Blogs (
    BlogID INT PRIMARY KEY AUTO_INCREMENT,
    AuthorID INT,
    Title VARCHAR(255) NOT NULL,
    WordCount INT,
    Views INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

INSERT INTO Authors (AuthorName) VALUES ('Maria Charlotte'), ('Juan Perez'), ('Gemma Alcocer');

INSERT INTO Blogs (AuthorID, Title, WordCount, Views) VALUES
(1, 'Best Paint Colors', 814, 14),
(2, 'Small Space Decorating Tips', 1146, 221),
(1, 'Hot Accessories', 986, 105),
(1, 'Mixing Textures', 765, 22),
(2, 'Kitchen Refresh', 1242, 307),
(1, 'Homemade Art Hacks', 1002, 193),
(3, 'Refinishing Wood Floors', 1571, 7542);
