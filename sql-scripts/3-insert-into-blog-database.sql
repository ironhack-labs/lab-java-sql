
# Insert into Authors
INSERT INTO authors (first_name, last_name) VALUES ('Maria', 'Charlotte');

INSERT INTO authors (first_name, last_name) VALUES ('Juan', 'Perez');
INSERT INTO authors (first_name, last_name) VALUES ('Gemma', 'Alcocer');


# Insert into Posts
INSERT INTO posts (title, word_count, views)
VALUES
    ('Best Paint Colors', 814, 14),
    ('Small Space Decorating Tips', 1146, 221),
    ('Hot Accessories', 986, 105),
    ('Mixing Textures', 765, 22),
    ('Kitchen Refresh', 1242, 307),
    ('Homemade Art Hacks', 1002, 193),
    ('Refinishing Wood Floors', 1571, 7542);


# Insert into author_post
insert into author_post (author_id, post_id) values (1, 1), (1,3), (1,4), (1,6),(2,5),(3,7);





