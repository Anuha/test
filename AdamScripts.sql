--user under 30s stem fields--
select * from users where age < 30 and occupation = 'doctor' or age < 30 and occupation = 'engineer' or age < 30 and occupation = 'scientist' order by age;

--user M to F ratio in programming --
select sum(case when gender = 'M' then 1 else 0 end)/count(*) as male_ratio, sum(case when gender ='F' then 1 else 0 end)/count(*) as female_ratio from users where occupation ='librarian';

--movies highest rated movies--
select movies.movie_id, movies.title, avg(ratings.rating) as average_rating from movies join ratings on movies.movie_id = ratings.movie_id group by movies.title, movie_id order by average_rating;
