CREATE VIEW co_actors AS
SELECT DISTINCT ac2.name
FROM actors ac1, actors ac2
WHERE ac1.name = 'Annette Nicole' AND ac1.mid = ac2.mid AND ac2.name != 'Annette Nicole'

select count(*)
from co_actors