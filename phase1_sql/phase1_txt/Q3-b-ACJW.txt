select name from actors where mid in (
	select mid from movies where title = 'The Dark Knight'
) order by name asc
