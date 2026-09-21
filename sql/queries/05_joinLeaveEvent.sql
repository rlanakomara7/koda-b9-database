UPDATE event_members
SET status='LEFT'
WHERE event_id=?
AND user_id=?;

INSERT INTO event_members
(event_id,user_id,status,joined_at)
VALUES
(?,?, 'JOINED', NOW());