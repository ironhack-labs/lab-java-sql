create table authors (
     author_id int auto_increment primary key,
     first_name varchar(255),
     last_name varchar(255)
);

create table posts (
       post_id int auto_increment primary key,
       title varchar(255),
       word_count int,
       views int
);

create table author_post (
         author_post_id int auto_increment primary key,
         author_id int,
         post_id int
);