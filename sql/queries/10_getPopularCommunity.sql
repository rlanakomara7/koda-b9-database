SELECT 
    c.community_id,
    c.name,
    COUNT(cm.user_id) AS total_member
FROM communities c
JOIN community_members cm
ON c.community_id = cm.community_id
GROUP BY c.community_id
ORDER BY total_member DESC
LIMIT 10;