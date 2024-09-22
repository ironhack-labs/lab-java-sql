#Readme instruction 1
CREATE DATABASE blogs;

USE blogs;

CREATE TABLE author
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO author (name)
VALUES ('Maria Charlotte'),
       ('Juan Perez'),
       ('Gemma Alcocer');

CREATE TABLE post
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    title      VARCHAR(255),
    word_count INT DEFAULT 0,
    views      INT DEFAULT 0,
    author_id  INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES author (id)
);

INSERT INTO post (title, word_count, views, author_id)
VALUES ('Best Paint Colors', 814, 14, 1),
       ('Small Space Decorating Tips', 1146, 221, 2),
       ('Hot Accesssories', 986, 105, 1),
       ('Mixing textures', 765, 22, 1),
       ('Kitchen Refresh', 1242, 307, 2),
       ('Homemade Art Hacks', 1002, 193, 1),
       ('Refinishing Wood floors', 1571, 7542, 3);

