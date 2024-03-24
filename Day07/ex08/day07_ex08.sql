SELECT  p.address , pi.name, COUNT(pi.name)
FROM person_order po
JOIN person p
ON po.person_id = p.id
JOIN menu m
ON m.id = po.menu_id
JOIN pizzeria pi
ON pi.id = m.pizzeria_id
GROUP BY 1, 2
ORDER BY 1 , 2