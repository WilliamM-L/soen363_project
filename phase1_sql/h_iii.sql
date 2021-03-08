SELECT a.name, COUNT(m.mid) AS num_movies
FROM actors a, movies m 
WHERE a.mid = m.mid AND a.name IN 
	(SELECT name FROM high_ratings EXCEPT SELECT name FROM low_ratings)
GROUP BY (a.name)
ORDER BY num_movies DESC
LIMIT 10;