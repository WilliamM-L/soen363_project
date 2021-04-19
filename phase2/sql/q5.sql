-- the number of arrest for each type of crime
SELECT c.primary_type,
count(*) FILTER (
	WHERE c.arrest = 'True'
) AS num_of_arrest,
count (*) FILTER (
	WHERE c.arrest = 'False'
) AS num_of_nonarrest,
count(c.cid) AS total_num_cases,
100*count(*) FILTER (WHERE c.arrest = 'True')/Cast(count(c.cid) as float) as percentage_arrested
FROM crime c
GROUP BY primary_type
ORDER BY percentage_arrested DESC;
