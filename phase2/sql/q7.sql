-- types of crime per district

SELECT pa.district, c.primary_type
FROM crime c, crime_police_area pa
WHERE c.cid = pa.cid
GROUP BY pa.district, c.primary_type
limit 500