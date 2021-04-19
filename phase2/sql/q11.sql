-- Count of crimes per hour for the year 2008
SELECT date_part('hour', c.c_date),
       count(*) as num_crimes_committed
FROM crime_date c
WHERE c.year = 2008
GROUP BY date_part('hour', c.c_date)
ORDER BY num_crimes_committed desc;
