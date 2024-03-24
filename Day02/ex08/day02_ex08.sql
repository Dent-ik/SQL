SELECT p.name
FROM person_order po
INNER JOIN menu m
ON po.menu_id = m.id
INNER JOIN person p
ON po.person_id = p.id
WHERE p.gender = 'male'
AND p.address IN ('Moscow','Samara') 
AND pizza_name IN ('pepperoni pizza','mushroom pizza')
ORDER BY 1 DESC