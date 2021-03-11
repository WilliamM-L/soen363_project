SELECT co.*
FROM co_actors co
WHERE co.name NOT IN (
    SELECT ne.name 
    FROM non_existent ne 
    WHERE ne.name = co.name
    );