SELECT	
	COALESCE (p.name , '-') person_name, 
	pv.visit_date visit_date,
	COALESCE (pi.name , '-') pizzeria_name
FROM person p
	FULL JOIN (SELECT * FROM person_visits
WHERE visit_date BETWEEN '2022-01-01' AND  '2022-01-03') pv
	ON pv.person_id = p.id
FULL JOIN pizzeria pi ON pv.pizzeria_id = pi.id
ORDER BY 1, 2 ,3