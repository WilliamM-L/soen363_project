-- Types of crimes overall (ordered desc)

SELECT c.primary_type, count(c.primary_type) as num_of_cases
FROM crime c
GROUP BY c.primary_type
ORDER BY num_of_cases DESC;