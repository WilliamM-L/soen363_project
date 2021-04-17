-- Type of crime per location description (group by location description)

SELECT l.location_description, c.primary_type
FROM crime c, crime_location l
WHERE c.cid = l.cid
GROUP BY l.location_description, c.primary_type
