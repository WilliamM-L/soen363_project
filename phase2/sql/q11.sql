-- Count of crimes per hour for the year 2008
SELECT date_part('hour', c.c_date),
       count(*)
FROM crime_date c
WHERE c.year = 2008
GROUP BY date_part('hour', c.c_date)
ORDER BY count(*) desc;

