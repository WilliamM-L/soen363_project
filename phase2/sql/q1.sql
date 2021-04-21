-- Show how much crime there was per year
SELECT D.year, COUNT(C.cid) as num_crimes
FROM crime_date D, crime C
WHERE D.cid = C.cid and year != 41 -- eliminating the crime falsely labelled 
Group by D.year
Order by D.year asc;
