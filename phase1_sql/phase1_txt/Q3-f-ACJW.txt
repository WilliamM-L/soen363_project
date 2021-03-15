SELECT * FROM movies WHERE num_rating = (SELECT max(num_rating) from movies);

SELECT * FROM movies WHERE rating = (SELECT max(rating) from movies);

SELECT * FROM movies WHERE num_rating = (SELECT max(num_rating) from movies)
INTERSECT
SELECT * FROM movies WHERE rating = (SELECT max(rating) from movies);


SELECT * FROM movies WHERE rating = (SELECT min(rating) from movies)
order by mid asc;

SELECT * FROM movies WHERE num_rating = (SELECT max(num_rating) from movies)
INTERSECT
SELECT * FROM movies WHERE rating = (SELECT min(rating) from movies);

-- In conclusion, the conjecture is false. The movies with the lowest or
-- highest ratings don't have the highest number of ratings. It's more like
-- the opposite in fact, the movies with a perfect rating only have a few
-- ratings and the movies with the worse ratings have 0 ratings.
