SELECT title FROM movies WHERE
EXISTS(
  SELECT * FROM tags, tag_names WHERE
   tags.mid = movies.mid AND tags.tid = tag_names.tid AND tag_names.tag LIKE '%bad%'
)
AND
EXISTS(
  SELECT * FROM tags,tag_names WHERE
   tags.mid = movies.mid AND tags.tid = tag_names.tid AND tag_names.tag LIKE '%good%'
)
