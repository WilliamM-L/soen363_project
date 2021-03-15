CREATE VIEW longevity_helper AS
(SELECT name, (MAX(year)-MIN(year)) AS diff
FROM movies, actors
WHERE movies.mid = actors.mid
GROUP BY name
);

SELECT longevity_helper.name
FROM longevity_helper 
WHERE longevity_helper.diff >= ALL(SELECT longevity_helper.diff FROM longevity_helper);