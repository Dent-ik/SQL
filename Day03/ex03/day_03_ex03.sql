(SELECT pi.name pizzeria_name
FROM person p
INNER JOIN person_visits pv
ON p.id = pv.person_id 
INNER JOIN pizzeria pi
ON pi.id = pv.pizzeria_id 
WHERE p.gender = 'female'
EXCEPT ALL	
SELECT pi.name
FROM person p
INNER JOIN person_visits pv
ON p.id = pv.person_id 
INNER JOIN pizzeria pi
ON pi.id = pv.pizzeria_id 
WHERE p.gender = 'male')
UNION ALL
(SELECT pi.name pizzeria_name
FROM person p
INNER JOIN person_visits pv
ON p.id = pv.person_id 
INNER JOIN pizzeria pi
ON pi.id = pv.pizzeria_id 
WHERE p.gender = 'male'
EXCEPT ALL
SELECT pi.name pizzeria_name
FROM person p
INNER JOIN person_visits pv
ON p.id = pv.person_id 
INNER JOIN pizzeria pi
ON pi.id = pv.pizzeria_id 
WHERE p.gender = 'female')
ORDER BY 1
