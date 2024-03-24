SELECT m.pizza_name pizza_name, m.price price , pi.name pizzeria_name FROM 
	(SELECT 
	id 
FROM menu 
	EXCEPT 
SELECT 
	menu_id
FROM person_order) AS nt
INNER JOIN menu m
ON nt.id = m.id
INNER JOIN pizzeria pi
ON pi.id = m.pizzeria_id
ORDER BY 1 , 2