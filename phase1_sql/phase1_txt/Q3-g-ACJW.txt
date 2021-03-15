CREATE VIEW lowmov AS 
 SELECT m.year, m.title, m.rating
 FROM movies m, (SELECT year, min(rating) AS minr
                 FROM movies WHERE rating>=1 GROUP BY year) a
 WHERE m.year=a.year AND a.minr=m.rating AND m.year>=2005 AND m.year<=2011
 ORDER BY m.year ASC, m.title ASC;

 CREATE VIEW highmov AS 
 SELECT m.year, m.title, m.rating
 FROM movies m, (SELECT year, max(rating) AS maxr
                FROM movies WHERE rating >=1 GROUP BY year) a
 WHERE m.year=a.year AND a.maxr=m.rating AND m.year>=2005 AND m.year<=2011
 ORDER BY m.year ASC, m.title ASC;

 SELECT * 
 FROM (SELECT * FROM highmov UNION SELECT * FROM lowmov) AS b_w
 ORDER BY b_w.year ASC, b_w.rating ASC, b_w.title ASC;