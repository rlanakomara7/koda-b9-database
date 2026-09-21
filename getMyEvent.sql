SELECT 
    e.*
FROM events e
JOIN event_members em
ON e.event_id = em.event_id
WHERE em.user_id = ?
AND em.status='JOINED';