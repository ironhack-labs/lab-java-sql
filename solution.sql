
-- 1 Normalize the following blog database and write the DDL scripts to create the database tables: 

CREATE DATABASE LAB_3_02_Blog;

use LAB_3_02_Blog;

CREATE TABLE Author (
	author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255)
);

CREATE TABLE BlogPost (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    word_count INT NOT NULL,
    views INT NOT NULL,
    author_id int,
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

INSERT INTO Author (author_name) VALUES
    ('Maria Charlotte'),
    ('Juan Perez'),
    ('Gemma Alcocer');


INSERT INTO BlogPost (title, word_count, views, author_id) VALUES
    ('Best Paint Colors', 814, 14, 1),
    ('Small Space Decorating Tips', 1146, 221, 2),
    ('Hot Accessories', 986, 105, 1),
    ('Mixing Textures', 765, 22, 1),
    ('Kitchen Refresh', 1242, 307, 2),
    ('Homemade Art Hacks', 1002, 193, 1),
    ('Refinishing Wood Floors', 1571, 7542, 3);
    

  