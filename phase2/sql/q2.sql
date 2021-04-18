-- Show the number of crimes commited for each primary_type in descending order
SELECT C.primary_type, COUNT(C.cid) as num_crimes_of_type
FROM crime C
Group by (C.primary_type)
order by num_crimes_of_type desc;

-- Year 2008
SELECT C.primary_type, COUNT(C.cid) as num_crimes_of_type
FROM crime C, crime_date D
where c.cid = D.cid and d.year = 2008
Group by (C.primary_type)
order by num_crimes_of_type desc;
