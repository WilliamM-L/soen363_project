-- the number of arrest for each type of crime

SELECT c.primary_type, count(c.arrest = 'True') AS num_of_arrest
FROM crime c
WHERE c.arrest = 'True'
GROUP BY primary_type
ORDER BY num_of_arrest DESC