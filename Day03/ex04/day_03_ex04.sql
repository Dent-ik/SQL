(SELECT pi.name pizzeria_name
FROM person p INNER JOIN person_order pv
ON p.id = pv.person_id
INNER JOIN  menu ON menu.id = pv.menu_id
INNER JOIN  pizzeria pi 
ON pi.id = menu.pizzeria_id
WHERE p.gender = 'female'
	EXCEPT
SELECT pi.name 
FROM person p INNER JOIN person_order pv
ON p.id = pv.person_id
INNER JOIN  menu ON menu.id = pv.menu_id
INNER JOIN  pizzeria pi
ON pi.id = menu.pizzeria_id
WHERE p.gender = 'male')
      union
(SELECT pi.name 
FROM person p INNER JOIN person_order pv
ON p.id = pv.person_id
INNER JOIN  menu ON menu.id = pv.menu_id
INNER JOIN  pizzeria pi 
ON pi.id = menu.pizzeria_id
WHERE p.gender = 'male'
      EXCEPT
SELECT pi.name pizzeria_name
FROM person p INNER JOIN person_order pv
ON p.id = pv.person_id
INNER JOIN  menu ON menu.id = pv.menu_id
INNER JOIN  pizzeria pi
ON pi.id = menu.pizzeria_id
WHERE p.gender = 'female')
ORDER BY 1