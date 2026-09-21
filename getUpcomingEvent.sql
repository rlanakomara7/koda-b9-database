SELECT *
FROM events
WHERE event_date >= CURRENT_DATE
ORDER BY event_date ASC;