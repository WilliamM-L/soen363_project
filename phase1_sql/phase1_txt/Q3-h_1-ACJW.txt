CREATE VIEW high_ratings AS
	SELECT DISTINCT a.name
	FROM actors a, movies m
	WHERE m.mid = a.mid AND m.rating NOTNULL AND m.rating >=4.0;

--movies with no ratings are considered to have a low rating.
CREATE VIEW low_ratings AS
	SELECT DISTINCT a.name
	FROM actors a, movies m
	WHERE m.mid = a.mid AND (m.rating <4.0 OR m.rating IS NULL);

SELECT COUNT(*) as num_low_ratings
FROM low_ratings;

SELECT COUNT(*) as num_high_ratings
FROM high_ratings;