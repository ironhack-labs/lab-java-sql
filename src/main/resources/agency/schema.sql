CREATE database Agency;

CREATE TABLE Authors(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Articles(
	id int NOT NULL AUTO_INCREMENT,
	author_id int NOT NULL,
	title varchar(100) NOT NULL,
    word_count smallint NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (author_id) REFERENCES Authors(id)
);

CREATE TABLE Activity(
	author_id int,
    article_id int,
    views int,
    FOREIGN KEY (author_id) REFERENCES Authors(id),
    FOREIGN KEY (article_id) REFERENCES Articles(id)
);
