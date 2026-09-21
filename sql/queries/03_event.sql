SELECT 
    e.event_id,
    e.title,
    e.event_date,
    e.location,
    c.category_name
FROM events e
JOIN event_categories c
ON e.category_id = c.category_id
WHERE e.title LIKE '%keyword%'
OR c.category_name LIKE '%keyword%';