CREATE DATABASE blog_db;
use blog_db;
CREATE TABLE authors(
                        AuthorID INTEGER PRIMARY KEY,
                        name VARCHAR(50) NOT NULL
);
CREATE TABLE posts (
                       PostID INTEGER PRIMARY KEY ,
                       title VARCHAR(100) NOT NULL ,
                       word_count INTEGER NOT NULL ,
                       views INTEGER NOT NULL,
                       AuthorID INTEGER NOT NULL ,
                       FOREIGN KEY (AuthorID) REFERENCES authors(AuthorID)
);
INSERT INTO authors(AuthorID, name)
VALUES
    (1, 'Maria Charlotte'),
    (2, 'Juan Perez'),
    (3, 'Gemma Alcocer');
INSERT INTO posts (PostID, title, word_count, views, AuthorID)
VALUES
    (1, 'Best Paint Colors', 814, 14, 1),
    (2, 'Small Space Decorating Tips', 1146, 221, 2),
    (3, 'Hot Accessories', 986, 105, 1),
    (4, 'Mixing Textures', 765, 22, 1),
    (5, 'Kitchen Refresh', 1242, 307, 2),
    (6, 'Homemade Art Hacks', 1002, 193, 1),
    (7, 'Refinishing Wood Floors', 1571, 7542, 3);
