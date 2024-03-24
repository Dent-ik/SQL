SELECT m.pizza_name pizza_name , pi.name pizzeria_name
FROM person_order po
INNER JOIN person p
ON po.person_id = p.id
INNER JOIN menu m 
ON po.menu_id = m.id
INNER JOIN pizzeria pi
ON pi.id = m.pizzeria_id
WHERE p.name IN ('Denis', 'Anna')
ORDER BY 1, 2