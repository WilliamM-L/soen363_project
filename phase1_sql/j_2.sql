CREATE VIEW all_combinations AS
SELECT ac.mid, coa.name
FROM co_actors coa, actors ac
WHERE ac.name = 'Annette Nicole'

SELECT COUNT (*)
FROM all_combinations