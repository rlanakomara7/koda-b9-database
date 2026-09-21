SELECT 
    c.community_id,
    c.name,
    cc.category_name
FROM communities c
JOIN community_categories cc
ON c.category_id = cc.category_id
WHERE c.name LIKE '%keyword%'
OR cc.category_name LIKE '%keyword%';