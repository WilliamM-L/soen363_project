--movies with duplicates
SELECT DISTINCT m.mid, m.title
FROM movies m, movies n
WHERE m.mid != n.mid AND m.title = n.title AND m.year = n.year
order by m.title;

--no duplicate movies
CREATE VIEW distinct_movies AS
SELECT DISTINCT m.*
FROM movies m
WHERE m.mid <= ALL (
	SELECT n.mid
	FROM movies n
	WHERE m.title = n.title
	)
order by m.title;

--actors with duplicates
SELECT DISTINCT a.*
FROM actors a, actors b
WHERE (a.name = b.name AND a.mid = b.mid AND a.cast_position != b.cast_position) OR (a.name != b.name AND a.mid = b.mid AND a.cast_position = b.cast_position)
order by a.mid, a.name;

--actors without duplicates
CREATE VIEW distinct_actors AS
SELECT DISTINCT c.*
FROM actors c
WHERE (c.mid, c.name) NOT IN (
	SELECT DISTINCT a.mid, a.name
	FROM actors a, actors b
	WHERE (a.name = b.name AND a.mid = b.mid AND a.cast_position != b.cast_position) OR (a.name != b.name AND a.mid = b.mid AND a.cast_position = b.cast_position)
	)
ORDER BY c.mid, c.name;


--genres with duplicates
--Every genre row is unique because its 2 attributes are used for the composite primary key

--tags with duplicates
--every tag rowis unique because its 2 attributes are used for the composite primary key


--tag_names with duplicates
select t1.* from tag_names t1, tag_names t2 where t1.tid != t2.tid AND t1.tag = t2.tag;

