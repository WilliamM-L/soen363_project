-- Type of crime per location description (group by location description)

SELECT l.location_description, c.primary_type
FROM crime c, crime_location l
WHERE c.cid = l.cid
GROUP BY l.location_description, c.primary_type;

-- what is the most "popular" crime location?

SELECT l.location_description, count(l) AS most_popular_crime_location
FROM crime_location l
GROUP BY l.location_description
ORDER BY count(l) DESC;

-- How many arson cases are recorded for an abandoned building?

SELECT count(*) AS num_of_cases
FROM crime c, crime_location l
WHERE c.cid = l.cid AND c.primary_type = 'ARSON' AND l.location_description LIKE 'ABANDONED%';