CREATE OR REPLACE FUNCTION public.similarity(
	"X_mid" integer,
	"Y_mid" integer)
    RETURNS real
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
X_mid integer;
Y_mid integer;

X_num_actors integer;
common_actors integer;
actor_ratio numeric;

X_num_tags integer;
common_tags integer;
tag_ratio numeric;

X_num_genres integer;
common_genres integer;
genre_ratio numeric;

max_date integer;
min_date integer;
X_date integer;
Y_date integer;
date_factor numeric;

X_rating real;
Y_rating real;
rating_factor numeric;
begin

X_mid = $1;
Y_mid = $2;

select count(*) into X_num_actors from actors where mid=X_mid;
select count(*) into common_actors from (
	select name from actors where mid=X_mid
	intersect
	select name from actors where mid=Y_mid
) as actors_intersection;
actor_ratio = cast(common_actors as numeric)/X_num_actors;

select count(*) into X_num_tags from tags where tags.mid=X_mid;
select count(*) into common_tags from (
	select tid from tags where tags.mid=X_mid
	intersect
	select tid from tags where tags.mid=Y_mid
) as tags_intersection;
tag_ratio = cast(common_tags as numeric)/X_num_tags;

select count(*) into X_num_genres from genres where genres.mid=X_mid;
select count(*) into common_genres from (
	select genre from genres where genres.mid=X_mid
	intersect
	select genre from genres where genres.mid=Y_mid
) as genres_intersection;
genre_ratio = cast(common_genres as numeric)/X_num_genres;

select max(year) into max_date from movies;
select min(year) into min_date from movies;
select year into X_date from movies where mid=X_mid;
select year into Y_date from movies where mid=Y_mid;
date_factor = 1 - ABS(cast((X_date - Y_date) as numeric) / (max_date - min_date));

select rating into X_rating from movies where mid=X_mid;
select rating into Y_rating from movies where mid=Y_mid;
rating_factor = 1 - ABS(cast((X_rating - Y_rating) as numeric) / 5.0);

-- raise notice '% actors, % common_actors, % actor_ratio',
-- X_num_actors, common_actors, actor_ratio;
-- raise notice '% tags, % common_tags, % tag_ratio',
-- X_num_tags, common_tags, tag_ratio;
-- raise notice '% genres, % common_genres, % genre_ratio',
-- X_num_genres, common_genres, genre_ratio;
-- raise notice '% X_date, % Y_date, % date_factor',
-- X_date, Y_date, date_factor;
-- raise notice ' % X_rating, % Y_rating, % rating_factor',
-- X_rating, Y_rating, rating_factor;
return (actor_ratio + tag_ratio + genre_ratio + date_factor + rating_factor)/5.0;
end;
$BODY$;

select mid from movies where title='Mr. & Mrs. Smith';

-- from there create the view with the ID (2205 in this case)
CREATE OR REPLACE VIEW "similarity_Smith"
 AS
SELECT movies.title,
   movies.rating,
   100 * similarity(2205, movies.mid) as similarity
  FROM movies WHERE
  mid != 2205 and
  title != 'Mr. & Mrs. Smith' and
  rating is not null and
  year is not null
  ;

  -- Getting the 10 best matches
  select * from "similarity_Smith" order by similarity desc limit 10;
