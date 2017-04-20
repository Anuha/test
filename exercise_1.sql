CREATE DATABASE if not exists power_rangers;

USE power_rangers;

CREATE external TABLE if not exists users (
	id BIGINT PRIMARY KEY, 
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
SELECT age from users WHERE gender='M';
--how many programmers are female 
select gender,count(occupation) total from users where occupation = 'programmer' group by gender; 

--users whose occupation is 'entertainment'
select * from users where occupation = 'entertainment';

--average age in the entertainment industry 
select AVG(age) average_age from users where occupation = 'entertainment'; 

--count on number of students 
select sum(case when occupation = 'student' then 1 else 0 end)from users;

