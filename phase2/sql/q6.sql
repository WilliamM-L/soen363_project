-- top 3 types of crime + homocide for every year

SELECT DISTINCT d.year, c.primary_type, COUNT(c.cid) as num_crimes
FROM crime_date d, crime c
WHERE d.cid = c.cid AND (c.primary_type LIKE 'THEFT' OR c.primary_type LIKE 'BATTERY' OR c.primary_type LIKE 'CRIMINAL DAMAGE' OR c.primary_type LIKE 'HOMICIDE')
GROUP BY (d.year, c.primary_type)
ORDER BY d.year DESC, num_crimes DESC;

-- -- top 3 types of crime + homocide for every year

-- SELECT DISTINCT d.year, c.primary_type, COUNT(c.cid) as num_crimes
-- FROM crime_date d, crime c
-- WHERE d.cid = c.cid AND c.primary_type in
-- (
-- 	SELECT cr.primary_type
-- 	FROM crime cr, crime_date cd
-- 	where d.year = cd.year
-- 	Group by (cr.primary_type)
-- 	order by COUNT(cr.cid) desc
-- 	limit 3
-- ) or c.primary_type LIKE 'HOMICIDE'
-- GROUP BY (d.year, c.primary_type)
-- ORDER BY d.year DESC, num_crimes DESC;