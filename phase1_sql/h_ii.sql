select COUNT(a.name) as num_no_flops
from actors a
where a.name IN (SELECT name from high_ratings EXCEPT SELECT name from low_ratings);