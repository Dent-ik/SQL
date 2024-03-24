SELECT pi.name
FROM person_visits pv
INNER JOIN person p
ON pv.person_id = p.id
INNER JOIN pizzeria pi
ON pv.pizzeria_id = pi.id
INNER JOIN menu m
ON m.pizzeria_id = pi.id
WHERE p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08' AND price < 800
