DELETE FROM co_actors
USING non_existent n_e 
WHERE co_actors.name = n_e.name;