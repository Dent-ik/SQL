CREATE VIEW RS AS(
SELECT pv.person_id  
FROM person_visits pv
WHERE pv.visit_date = '2022-01-02'
EXCEPT 
SELECT pv.person_id FROM person_visits pv
WHERE pv.visit_date = '2022-01-06');

CREATE VIEW SR AS(
SELECT pv.person_id  
FROM person_visits pv
WHERE pv.visit_date = '2022-01-06'
EXCEPT 
SELECT person_id FROM person_visits
WHERE visit_date = '2022-01-02');

CREATE VIEW v_symmetric_union AS(
	SELECT person_id
FROM RS
	UNION 
SELECT person_id
FROM SR	
ORDER BY 1
)