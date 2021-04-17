SELECT date_part('hour', c.c_date),
       count(*)
FROM crime_date c
GROUP BY date_part('hour', c.c_date)
ORDER BY count(*) desc;

