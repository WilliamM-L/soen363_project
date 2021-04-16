-- Show the top 10 years with the most crime
SELECT D.year, COUNT(C.cid) as num_crimes
FROM crime_date D, crime C
WHERE D.cid = C.cid
Group by (D.year)
Order by num_crimes desc
Limit 10;
