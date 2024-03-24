WITH d AS (
    SELECT d::date
	FROM 
 generate_series('2022-01-01','2022-01-10', interval '1 day') d
)
	SELECT d::date  missing_date
FROM (SELECT * FROM person_visits pv WHERE pv.person_id = 1 or pv.person_id = 2) pv 
RIGHT  JOIN d
ON pv.visit_date = d
WHERE pv.id IS NULL
ORDER BY 1