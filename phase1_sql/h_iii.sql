select a.name, COUNT(m.mid) as num_movies
from actors a, movies m 
where a.mid = m.mid AND a.name IN 
	(SELECT name from high_ratings EXCEPT SELECT name from low_ratings)
GROUP BY (a.name)
ORDER BY num_movies desc
LIMIT 10;