CREATE DATABASE Blog;
use Blog;
CREATE TABLE Author (
                        AuthorID INT PRIMARY KEY,
                        FirstName VARCHAR(50) NOT NULL,
                        LastName VARCHAR(50) NOT NULL
);

CREATE TABLE BlogPost (
                          PostID INT PRIMARY KEY,
                          Title VARCHAR(100) NOT NULL,
                          WordCount INT NOT NULL,
                          Views INT NOT NULL,
                          AuthorID INT,
                          FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

CREATE TABLE Category (
                          CategoryID INT PRIMARY KEY,
                          CategoryName VARCHAR(50) NOT NULL
);

CREATE TABLE PostCategory (
                              PostID INT,
                              FOREIGN KEY (PostID) REFERENCES BlogPost(PostID),
                              CategoryID INT,
                              FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
                              PRIMARY KEY (PostID, CategoryID)
);

INSERT INTO Author (AuthorID, FirstName, LastName) VALUES
                                                       (1, 'Maria', 'Charlotte'),
                                                       (2, 'Juan', 'Perez'),
                                                       (3, 'Gemma', 'Alcocer');

INSERT INTO Category (CategoryID, CategoryName) VALUES
                                                    (1, 'Home Decor'),
                                                    (2, 'DIY'),
                                                    (3, 'Renovation');

INSERT INTO BlogPost (PostID, Title, WordCount, Views, AuthorID) VALUES
                                                                     (1, 'Best Paint Colors', 814, 14, 1),
                                                                     (2, 'Small Space Decorating Tips', 1146, 221, 2),
                                                                     (3, 'Hot Accessories', 986, 105, 1),
                                                                     (4, 'Mixing Textures', 765, 22, 1),
                                                                     (5, 'Kitchen Refresh', 1242, 307, 2),
                                                                     (6, 'Homemade Art Hacks', 1002, 193, 1),
                                                                     (7, 'Refinishing Wood Floors', 1571, 7542, 3);

INSERT INTO PostCategory (PostID, CategoryID) VALUES
                                                  (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 2), (7, 3);