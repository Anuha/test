CONNECT localhost;

INVALIDATE METADATA;

USE power_rangers;

CREATE external TABLE if not exists users (
	id BIGINT, 
	age INT,
	gender STRING,
	occupation STRING
) 
comment "Table to store user info." row format delimited fields 
TERMINATED BY '|' stored 
AS 
  textfile location '/userinfo/';
  
  
SELECT * FROM users;
SELECT COUNT(*) FROM users;

SELECT DISTINCT occupation FROM users ORDER BY occupation; 
SELECT * FROM users WHERE occupation='doctor';
SELECT * FROM users WHERE age < 25;
SELECT * FROM users WHERE age < 40 AND occupation='doctor';
SELECT occupation, COUNT(*) amount FROM users GROUP BY occupation;
SELECT AVG(age) from users WHERE gender='M';

create table if not exists dummy (
	movie_id bigint,
	title string,
	release_date string,
	empty string,
	url string
)
ROW FORMAT delimited 
fields TERMINATED BY '|';

CREATE TABLE if not exists movies (
	movie_id BIGINT,
	title STRING,
	release_date STRING,
	url STRING
)
ROW FORMAT delimited 
fields TERMINATED BY '|';

DESC movies;

LOAD DATA INPATH '/movieinfo/u.item' OVERWRITE INTO TABLE dummy;
INSERT INTO TABLE movies SELECT movie_id, title, release_date, url FROM dummy;

SELECT COUNT(*) FROM movies;
SELECT * FROM movies WHERE title LIKE '%Story%';
SELECT * FROM movies ORDER BY title;
SELECT COUNT(*) FROM movies; where release_date='(1995)';


CREATE TABLE if not exists customers (
	cust_id INT,
	fname STRING,
	lname STRING,
	email STRING,
	phone MAP<STRING, STRING>,
	order_ids ARRAY<INT>,
	order_value STRUCT<min:INT,max:INT,avg:INT,total:INT>
)
STORED AS PARQUET;

desc customers;
ALTER TABLE customers CHANGE fname fullname STRING;
desc customers;