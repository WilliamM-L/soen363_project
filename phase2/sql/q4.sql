-- Districts with the most crime in descending order
SELECT DISTINCT P.district, COUNT(C.cid) as num_crimes
FROM crime_police_area P, crime C
WHERE P.cid = C.cid AND P.district IS NOT NULL
Group by (P.district)
Order by num_crimes desc;
