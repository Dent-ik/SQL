create materialized view mv_dmitriy_visits_and_eats AS(
SELECT pi.name pizzeria_name
FROM person_visits pv
INNER JOIN person p
ON pv.person_id = p.id
INNER JOIN pizzeria pi
ON pv.pizzeria_id = pi.id
INNER JOIN menu m
ON m.pizzeria_id = pi.id
WHERE pv.visit_date = '2022-01-08' AND m.price < 800 AND p.name = 'Dmitriy')
