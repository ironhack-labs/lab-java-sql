DROP database IF EXISTS labposts;
create database labposts;
USE labposts;

create table Authors(
id int NOT NULL AUTO_INCREMENT,
author_name varchar(255) NOT NULL,
PRIMARY KEY (id)
);

create table Posts(
id int NOT NULL AUTO_INCREMENT,
post_title varchar(255) NOT NULL,
AuthorID int NOT NULL,
word_count int NOT NULL,
views int NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (AuthorID) REFERENCES Authors(id)
);

INSERT INTO Authors (author_name) VALUES
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

SET @MariaCharlotteID = LAST_INSERT_ID();
INSERT INTO Posts (post_title, AuthorID, word_count, views) VALUES 
('Best Paint Colors', @MariaCharlotteID, 814, 14);

SET @JuanPerezID = LAST_INSERT_ID();
INSERT INTO Posts (post_title, AuthorID, word_count, views) VALUES 
('Small Space Decorating Tips', @JuanPerezID, 1146, 221);

SET @GemmaAlcocerID = LAST_INSERT_ID();
INSERT INTO Posts (post_title, AuthorID, word_count, views) VALUES 
('Refinishing Wood Floors', @GemmaAlcocerID, 1571, 7542);

INSERT INTO Posts (post_title, AuthorId, word_count, views) VALUES 
('Hot Accessories', @MariaCharlotteID, 986, 105),
('Mixing Textures', @MariaCharlotteID, 765, 22),
('Kitchen Refresh', @JuanPerezID, 1242, 307),
('Homemade Art Hacks', @MariaCharlotteID, 1002, 193);

SELECT * FROM Posts;