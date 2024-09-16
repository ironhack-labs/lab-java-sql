create database lab_sql;
Use lab_sql;

create table authors (
	id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    primary key(id)
);

create table books (
	id int NOT NULL AUTO_INCREMENT,
    title varchar(255),
    word_count int,
    views int,
    author_id int,
    foreign key (author_id) references authors(id),
    primary key(id)
);

INSERT INTO authors (name) VALUES
("Maria Charlotte"),
("Juan Perez"),
("Gemma Alcocer");


INSERT INTO books (author_id, title, word_count, views) VALUES
(1, "Best Paint Colors", 814, 14),
(2, "Small Space Decorating Tips", 1146, 221),
(1, "Hot Accessories", 986, 105),
(1, "Mixing Textures", 765, 22),
(2, "Kitchen Refresh", 1242, 307),
(1, "Homemade Art Hacks	", 1002, 193),
(3, "Refinishing Wood Floors", 1571, 7542);

SELECT authors.name, books.title, books.word_count, books.views
FROM books
LEFT JOIN authors ON books.author_id = authors.id;
