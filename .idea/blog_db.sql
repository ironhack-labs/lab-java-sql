CREATE DATABASE blog_db;

USE blog_db;

CREATE TABLE author
(
    author_id   INT PRIMARY KEY,
    author_name VARCHAR(50)
);

CREATE TABLE posts
(
    post_id         INT PRIMARY KEY,
    author_id       INT,
    post_title      VARCHAR(50),
    post_word_count INT,
    post_views      INT,
    FOREIGN KEY (author_id) REFERENCES author (author_id)

);

INSERT INTO author(author_id, author_name)
VALUES (1, 'Maria Charlotte'),
       (2, 'Juan Perez'),
       (3, 'Gemma Alcocer');

INSERT INTO posts(post_id, author_id, post_title, post_word_count, post_views)
VALUES (0, 1, 'Best Paint Colors', 814, 14),
       (1, 2, 'Small Space Decorating Tips', 1146, 221),
       (2, 1, 'Hot Accessories', 986, 105),
       (3, 1, 'Mixing Textures	', 765, 22),
       (4, 2, 'Kitchen Refresh', 1242, 307),
       (5, 1, 'Homemade Art Hacks', 1002, 193),
       (6, 3, 'Refinishing Wood Floors', 1571, 7542);
