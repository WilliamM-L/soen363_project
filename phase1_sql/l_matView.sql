CREATE OR REPLACE FUNCTION public.similarity(
	"X_mid" INTEGER,
	"Y_mid" INTEGER)
    RETURNS REAL
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
X_mid INTEGER;
Y_mid INTEGER;

X_num_actors INTEGER;
common_actors INTEGER;
actor_ratio NUMERIC;

X_num_tags INTEGER;
common_tags INTEGER;
tag_ratio NUMERIC;

X_num_genres INTEGER;
common_genres INTEGER;
genre_ratio NUMERIC;

max_date INTEGER;
min_date INTEGER;
X_date INTEGER;
Y_date INTEGER;
date_factor NUMERIC;

X_rating REAL;
Y_rating REAL;
rating_factor NUMERIC;
BEGIN

X_mid = $1;
Y_mid = $2;

SELECT COUNT(*) INTO X_num_actors FROM actors WHERE mid=X_mid;
SELECT COUNT(*) INTO common_actors FROM (
	SELECT name FROM actors WHERE mid=X_mid
	INTERSECT
	SELECT name FROM actors WHERE mid=Y_mid
) AS actors_intersection;
actor_ratio = CAST(common_actors AS NUMERIC)/X_num_actors;

SELECT COUNT(*) INTO X_num_tags FROM tags WHERE tags.mid=X_mid;
SELECT COUNT(*) INTO common_tags FROM (
	SELECT tid FROM tags WHERE tags.mid=X_mid
	INTERSECT
	SELECT tid FROM tags WHERE tags.mid=Y_mid
) AS tags_intersection;
tag_ratio = CAST(common_tags AS NUMERIC)/X_num_tags;

SELECT COUNT(*) INTO X_num_genres FROM genres WHERE genres.mid=X_mid;
SELECT COUNT(*) INTO common_genres FROM (
	SELECT genre FROM genres WHERE genres.mid=X_mid
	INTERSECT
	SELECT genre FROM genres WHERE genres.mid=Y_mid
) AS genres_intersection;
genre_ratio = CAST(common_genres AS NUMERIC)/X_num_genres;

SELECT max(year) INTO max_date FROM movies;
SELECT min(year) INTO min_date FROM movies;
SELECT year INTO X_date FROM movies WHERE mid=X_mid;
SELECT year INTO Y_date FROM movies WHERE mid=Y_mid;
date_factor = 1 - ABS(CAST((X_date - Y_date) AS NUMERIC) / (max_date - min_date));

SELECT rating INTO X_rating FROM movies WHERE mid=X_mid;
SELECT rating INTO Y_rating FROM movies WHERE mid=Y_mid;
rating_factor = 1 - ABS(CAST((X_rating - Y_rating) AS NUMERIC) / 5.0);

RETURN (actor_ratio + tag_ratio + genre_ratio + date_factor + rating_factor)/5.0;
end;
$BODY$;

SELECT mid FROM movies WHERE title='Mr. & Mrs. Smith';

-- FROM there create the view with the ID (2205 in this case)
CREATE MATERIALIZED VIEW "similarity_Smith"
 AS
SELECT movies.title,
   movies.rating,
   100 * similarity(2205, movies.mid) AS similarity
  FROM movies WHERE
  mid != 2205 AND
  title != 'Mr. & Mrs. Smith' AND
  rating IS NOT NULL AND
  year IS NOT NULL
  ;

  -- Getting the 10 best matches
  SELECT * FROM "similarity_Smith" ORDER BY similarity DESC LIMIT 10;
