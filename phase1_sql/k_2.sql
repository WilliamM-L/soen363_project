CREATE VIEW most_social AS 
SELECT a1.name AS act, COUNT(DISTINCT(a2.name)) AS coactors
FROM actors a1, actors a2
WHERE a1.mid = a2.mid AND a1.name <> a2.name
GROUP BY a1.name;

SELECT *
FROM most_social m_s
WHERE m_s.coactors >= ALL (
    SELECT MAX(coactors) 
    FROM most_social)
ORDER BY act ASC;