CREATE VIEW non_existent AS
SELECT ac.name, ac.mid
FROM all_combinations ac
WHERE ac.name NOT IN (
    SELECT DISTINCT coa.name
    FROM co_actors coa, actors a
    WHERE coa.name = a.name AND ac.mid = a.mid);

SELECT COUNT(*) FROM non_existent;