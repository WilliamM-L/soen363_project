CREATE OR REPLACE VIEW valid_ratings
 AS
SELECT *
  FROM movies WHERE
  rating > 0 AND
  rating IS NOT NULL
  ;

-- ran in 102 msec

SELECT * FROM valid_ratings WHERE num_rating = (SELECT max(num_rating) from valid_ratings);

SELECT * FROM valid_ratings WHERE rating = (SELECT max(rating) from valid_ratings);

SELECT * FROM valid_ratings WHERE num_rating = (SELECT max(num_rating) from valid_ratings)
INTERSECT
SELECT * FROM valid_ratings WHERE rating = (SELECT max(rating) from valid_ratings);


SELECT * FROM valid_ratings WHERE rating = (SELECT min(rating) from valid_ratings)
order by mid asc;

SELECT * FROM valid_ratings WHERE num_rating = (SELECT max(num_rating) from valid_ratings)
INTERSECT
SELECT * FROM valid_ratings WHERE rating = (SELECT min(rating) from valid_ratings);

-- In conclusion, the conjecture is false. The movies with the lowest or
-- highest ratings don't have the highest number of ratings. It's more like
-- the opposite in fact, the movies with a perfect rating or the worse rating
-- only have a few ratings.
