-- the number of arrest for each type of crime

SELECT c.primary_type, count(*) FILTER (
	WHERE c.arrest = 'True'
) AS num_of_arrest, 
count (*) FILTER (
	WHERE c.arrest = 'False'
) AS num_of_nonarrest
FROM crime c
GROUP BY primary_type
