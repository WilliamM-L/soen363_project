-- Wards with the most crime in descending order
SELECT P.ward, COUNT(C.cid) as num_crimes
FROM crime_police_area P, crime C
WHERE P.cid = C.cid AND P.ward IS NOT NULL
Group by (P.ward)
Order by ward asc;

-- Visualisation queries

-- percentage distribution
SELECT P.ward, CAST(COUNT(C.cid) as float) / (Select count(*) from crime) as num_crimes
FROM crime_police_area P, crime C
WHERE P.cid = C.cid AND P.ward IS NOT NULL
Group by (P.ward)
Order by ward asc;

-- percentage of crime commited by top 10 wards = 32.4%
-- top 15 wards = 45.3%
-- top 20 wards = 56%
Select Sum(num_crimes) as percentage_of_crime_from_top_10_wards from(
	SELECT P.ward, 100 * CAST(COUNT(C.cid) as float) / (Select count(*) from crime) as num_crimes
	FROM crime_police_area P, crime C
	WHERE P.cid = C.cid AND P.ward IS NOT NULL
	Group by (P.ward)
	Order by num_crimes desc
	limit 10
) as percentage_crimes;
