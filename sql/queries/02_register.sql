SELECT *
FROM users
WHERE email = ?;

INSERT INTO users
(name, email, password, role_id)
VALUES
(?,?,?,?);