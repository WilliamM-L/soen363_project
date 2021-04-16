-- Wards with the most crime in descending order
SELECT DISTINCT P.ward, COUNT(C.cid) as num_crimes
FROM crime_police_area P, crime C
WHERE P.cid = C.cid AND P.ward IS NOT NULL
Group by (P.ward)
Order by num_crimes desc;
