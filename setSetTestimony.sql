SELECT
r.*,
u.name
FROM reviews
JOIN users u 
ON r.user_id=u.user_id
WHERE event_id=?;


INSERT INTO reviews (user_id,event_id,message,rating)
VALUES (?,?,?,?);