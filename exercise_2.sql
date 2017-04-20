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
SELECT COUNT(*) FROM movies WHERE release_date LIKE '%(1995)%';
select movies.title from movies join users on users.id=movies.movie_id where users.gender='M' and users.age < 25;

--limit the output to get an idea of the table
SELECT * FROM movies LIMIT 20; 

--list all movies released in year 1994 
SELECT * FROM movies WHERE release_date LIKE '%1994%';

--update title coloumn to uppercase 
SELECT UPPER(title) AS title FROM movies; 

--find all the movies that have the genre 'Romance'
select title, romance from movies where romance = 1 order by romacne;