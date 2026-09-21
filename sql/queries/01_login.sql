SELECT 
    u.user_id,
    u.name,
    u.email,
    r.role_name
FROM users u
JOIN roles r ON u.role_id = r.role_id
WHERE u.email = ?
AND u.password = ?;