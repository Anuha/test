
--------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------ EXERCISE 1 --------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------

--create database 
create database powerrangers;
use powerrangers;
show databases;

--create table for users information using u.user dataset 
	create external table if not exists users (
	id bigint,
	age bigint,
	gender string,
	occupation string,
	unknown bigint
)
comment "Table to store information about users"
row format delimited fields terminated by '|'
LOAD DATA INPATH '/data/power/users/u.user' OVERWRITE INTO TABLE users;

--check table is added 
show tables;had

--show records in users table 
SELECT * FROM users;

--Identify home many students are in the user table
select count(*) from users;

								-------------------- Analysis Queries ------------------

--how many programmers are female 

select gender,count(occupation) total from users where occupation = 'programmer'group by gender; 

--users whose occupation is 'entertainment'
select * from users where occupation = 'entertainment';

--average age in the entertainment industry 
select AVG(age) average_age from users where occupation = 'entertainment'; 

--count on number of students 
select sum(case when occupation = 'student' then 1 else 0 end)from users;

--movies highest rated movies--
select movies.movie_id, movies.title, avg(ratings.rating) as average_rating from movies join ratings on movies.movie_id = ratings.movie_id group by movies.title, movie_id order by average_rating;


--------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------ EXERCISE 2 --------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------

--create table for movies 
create table if not exists movies (
	movie_id BIGINT,
	title STRING,
	release_date STRING,
	imdb_url STRING,
	unknown int,
	action int,
	adventure int,
	animation int,
	children int,
	comedy int,
	crime int,
	documentary int,
	drama int,
	fantasy int,
	film_noir int,
	horror int,
	musical int,
	mystery int,
	romance int,
	scifi int,
	thriller int,
	war int,
	western int
)
ROW FORMAT delimited 
fields TERMINATED BY '|'
LOAD DATA INPATH '/data/power/movies/u.item' OVERWRITE INTO TABLE ratings;

			--load data from localdrive 
----------hadoop fs –put user/data/u.item /user/hive/warehouse/movies

--load data into a Hive table from data in HDFS
LOAD DATA INPATH '/data/power/movies/u.item' OVERWRITE INTO TABLE dummy;


--
insert into TABLE movies select movie_id, title, release_date, url from dummy;

--show records in movies table 
select * from movies;

--show total movies in movies table 
select count(*) Num_of_Movies from movies;

			-------------------------------------- Analysis Queries ------------------------ 

--limit the output to get an idea of the table
select * from movies limit 20; 

--list all movies released in year 1994 
select * from movies where release_date like '%1994%';

--update title coloumn to uppercase 
select upper(title) as title from movies; 

--find all the movies that have the genre 'Romance'
select title, romance from movies where romance = 1 order by romacne;

	-------------------------------------- Ratings Table -------------------------------------- 

--create table for ratings using u.data dataset
create external table if not exists ratings (
	user_id int,
	movie_id int,
	rating bigint ,
	time_stamp bigint	
)
comment "Table to store information about Ratings" 
row format delimited fields terminated by '\t'
LOAD DATA INPATH '/data/power/ratings/u.data' OVERWRITE INTO TABLE ratings;

-------------------------------------- Analysis Queries ------------------------ 

#does age affect ratings 
select ratings.rating, users.age ,ratings.user_id from ratings INNER JOIN users on ratings.user_id=users.id; 
select ratings.rating, users.age ,ratings.user_id from ratings INNER JOIN users on ratings.user_id=users.id where users.age >= 20 and users.age <= 35; 

#how many students rated movies 





--------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------ EXERCISE 3 --------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------




create database if not exists powerrangers;
USE powerrangers;

create table if not exists customers (
	cust_id INT,
	fname STRING,
	lname STRING,
	email STRING,
	phone MAP<STRING, STRING>,
	order_ids ARRAY<INT>,
	order_value STRUCT<min:INT,max:INT,avg:INT,total:INT>
)
ROW FORMAT DELIMITED
	FIELDS TERMINATED BY '|'
	COLLECTION ITEMS TERMINATED BY ','
	MAP KEYS TERMINATED BY ':';

desc customers;

alter table customers CHANGE fname fullname STRING;

desc customers;

--------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------ EXERCISE 4 --------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------


--show records in users table 
SELECT * FROM users;

--Identify home many students are in the user table
select count(*) from users;

								-------------------- Analysis Queries ------------------

--how many programmers are female 
select gender,count(occupation) total from users where occupation = 'programmer'group by gender; 

--users whose occupation is 'entertainment'
select * from users where occupation = 'entertainment';

--average age in the entertainment industry 
select AVG(age) average_age from users where occupation = 'entertainment'; 

--------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------ Additional Exercise --------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------



