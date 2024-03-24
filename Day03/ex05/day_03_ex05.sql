SELECT pi.name pizzeria_name
FROM person p INNER JOIN person_visits pv
ON p.id = pv.person_id
INNER JOIN  pizzeria pi 
ON pi.id = pv.pizzeria_id
WHERE p.name = 'Andrey'
EXCEPT ALL
SELECT pi.name pizzeria_name
FROM person p INNER JOIN person_order po
ON p.id = po.person_id
INNER JOIN  menu ON menu.id = po.menu_id
INNER JOIN  pizzeria pi 
ON pi.id = menu.pizzeria_id
WHERE p.name = 'Andrey'
ORDER BY 1