SELECT EXOPLODE(NGRAMS(SENTENCES(LOWER(title)), 2, 5)) AS bigrams FROM movies;

-- Example:
-- "Lord of the Rings"
-- "lord of the rings"
-- "lord", "of", "the", "rings"
-- The first number of NGRAMS is used to specify how long the returned array of common combination should be. 
--		The result should be this length (e.g. 2 as above)
-- The second number of NGRAMS is to limit the amount of results which are returned
-- There is an optional extra argument which is used to specify the accuracy
-- Explode then splits the array of NGRAMS putting each onto separate lines.

SELECT EXOPLODE(NGRAMS(SENTENCES(LOWER(title)), 3, 5)) AS bigrams FROM movies;

SELECT EXOPLODE(NGRAMS(SENTENCES(LOWER(title)), 4, 5)) AS bigrams FROM movies;

SELECT EXOPLODE(NGRAMS(SENTENCES(LOWER(title)), 2, 5)) AS bigrams FROM movies WHERE AVG(rating) >= 5 GROUP BY movie_id;
SELECT EXOPLODE(NGRAMS(SENTENCES(LOWER(title)), 2, 5)) AS bigrams FROM movies WHERE AVG(rating) = 1.0 GROUP BY movie_id;


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

-- Analysis on age and ratings 
select ratings.rating, users.age ,ratings.user_id from ratings INNER JOIN users on ratings.user_id=users.id; 
select ratings.rating, users.age ,ratings.user_id from ratings INNER JOIN users on ratings.user_id=users.id where users.age >= 20 and users.age <= 35; 