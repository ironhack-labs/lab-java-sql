CREATE SCHEMA Blog;

CREATE TABLE blog.Posts(
ID int NOT NULL auto_increment,
Title varchar(255) NOT NULL,
WordCount int NOT NULL,
Views int NOT NULL,
AuthorID int,
foreign key (AuthorID) references Authors(ID), 
primary key(ID)
);

CREATE TABLE blog.Authors(
ID int NOT NULL auto_increment,
Author varchar(255) NOT NULL,
primary key(ID)
);

INSERT INTO blog.authors(Author) VALUES
("Maria Charlotte"),
("Juan Perez"),
("Gemma Alcocer");

INSERT INTO blog.posts(Title, WordCount, Views, AuthorID) VALUES
("Best Paint Colors", 814, 14, 1),
("Small Space Decorating Tips", 1146, 221, 2),
("Hot Accessories", 986, 105, 1),
("Mixing Textures", 765, 22, 1),
("Kitchen Refresh", 1242, 307,2),
("Homemade Art Hacks", 1002,193,1),
("Refinishing Wood Floors", 1571, 7542,3);
