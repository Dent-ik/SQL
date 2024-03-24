SELECT m.pizza_name, pi.name pizzeria_name_1, pi1.name pizzeria_name_2, m.price
FROM menu m
INNER JOIN menu m1
ON m.id != m1.id AND m.price = m1.price AND m.pizza_name =  m1.pizza_name AND m.pizzeria_id < m1.pizzeria_id 
INNER JOIN pizzeria pi
ON m1.pizzeria_id = pi.id
INNER JOIN pizzeria pi1
ON m.pizzeria_id = pi1.id
ORDER BY 1







