CREATE VIEW high_ratings AS
	SELECT DISTINCT a.name
	FROM actors a, movies m
	WHERE m.mid = a.mid AND m.rating NOTNULL AND m.rating >=4.0;

CREATE VIEW low_ratings AS
	SELECT DISTINCT a.name
	FROM actors a, movies m
	WHERE m.mid = a.mid AND (m.rating <4.0 OR m.rating IS NULL);

SELECT COUNT(*)
FROM low_ratings;

SELECT COUNT(*)
FROM high_ratings;