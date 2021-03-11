SELECT COUNT(a.name) AS num_no_flops
FROM actors a
WHERE a.name IN (
    SELECT name FROM high_ratings 
    EXCEPT 
    SELECT name FROM low_ratings
    );