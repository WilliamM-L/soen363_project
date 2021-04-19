-- top 50 districts with crime of a certain type
SELECT pa.district, c.primary_type, count(c.cid) as num_crimes
FROM crime c, crime_police_area pa
WHERE c.cid = pa.cid and district IS NOT NULL
GROUP BY pa.district, c.primary_type
order by num_crimes desc
LIMIT 50;
