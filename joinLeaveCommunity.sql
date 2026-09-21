UPDATE community_members
SET status='LEFT'
WHERE community_id=?
AND user_id=?;

INSERT INTO community_members
(community_id,user_id,status)
VALUES
(?,?, 'JOINED');