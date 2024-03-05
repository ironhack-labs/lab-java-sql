CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(255) NOT NULL
);
CREATE TABLE BlogPosts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    word_count INT NOT NULL,
    views INT NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
-- Insert authors
INSERT INTO Authors (author_name) VALUES
    ('Maria Charlotte'),
    ('Juan Perez'),
    ('Gemma Alcocer');

-- Insert blog posts
INSERT INTO BlogPosts (title, word_count, views, author_id) VALUES
    ('Best Paint Colors', 814, 14, 1),  -- Maria Charlotte
    ('Small Space Decorating Tips', 1146, 221, 2),  -- Juan Perez
    ('Hot Accessories', 986, 105, 1),  -- Maria Charlotte
    ('Mixing Textures', 765, 22, 1),  -- Maria Charlotte
    ('Kitchen Refresh', 1242, 307, 2),  -- Juan Perez
    ('Homemade Art Hacks', 1002, 193, 1),  -- Maria Charlotte
    ('Refinishing Wood Floors', 1571, 7542, 3);  -- Gemma Alcocer