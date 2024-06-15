CREATE DATABASE blog_db;

USE blog_db;

CREATE TABLE author (
                        id INTEGER PRIMARY KEY,
                        author_name VARCHAR(50)
);

CREATE TABLE blog (
                      id SERIAL PRIMARY KEY,
                      author_id INTEGER NOT NULL,
                      FOREIGN KEY (author_id) REFERENCES author(id),
                      title VARCHAR(100),
                      word_count INTEGER,
                      views INTEGER
);

INSERT INTO author(id,author_name)
VALUES (1, 'Maria Charlotte'),
       (2, 'Juan Perez'),
       (3, 'Gemma Alcocer');

INSERT INTO blog(author_id, title, word_count, views)
VALUES (1, 'Best Paint Colors', 814, 14),
       (2, 'Small Space Decorating Tips', 1146, 221),
       (1, 'Hot Accessories', 986, 105),
       (1, 'Mixing Textures', 765, 22),
       (2, 'Kitchen Refresh', 1242, 307),
       (1, 'Homemade Art Hacks', 1002, 193),
       (3, 'Refinishing Wood Floors', 1571, 7542);