SELECT a1.name, COUNT(DISTINCT(a2.name)) as coactors
FROM actors a1, actors a2
WHERE a1.mid = a2.mid AND a1.name = 'Tom Cruise' AND a2.name != 'Tom Cruise'
GROUP BY a1.name;