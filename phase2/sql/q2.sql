-- SELECT * FROM (
-- SELECT DISTINCT D.Year, C.primary_type, row_number() over (order by count(C.cid) desc) as num_crimes
-- FROM crime_date D, crime C
-- WHERE D.cid = C.cid
-- Group by (D.Year, C.primary_type)
-- Order by D.Year desc, num_crimes desc) all_crimes
-- where num_crimes > 450;


-- Show the number of crimes commited for each primary_type in descending order
SELECT C.primary_type, COUNT(C.cid) as num_crimes_of_type
FROM crime C
Group by (C.primary_type)
order by num_crimes_of_type desc;