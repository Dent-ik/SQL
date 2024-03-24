SELECT m.pizza_name pizza_name, m.price price, pi.name pizzeria_name , pv.visit_date visit_date
FROM menu m
INNER JOIN pizzeria pi
ON pi.id = m.pizzeria_id
INNER JOIN person_visits pv
ON pi.id = pv.pizzeria_id 
INNER JOIN person p
ON p.id = pv.person_id
WHERE p.name = 'Kate' AND price between 800 and 1000
ORDER BY 1, 2, 3 
