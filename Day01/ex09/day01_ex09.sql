SELECT pi.name
FROM pizzeria pi
WHERE pi.id NOT IN (
	SELECT pv.pizzeria_id
	FROM person_visits pv
);
SELECT pi.name
FROM pizzeria pi
WHERE NOT EXISTS (
	SELECT pv.pizzeria_id
	FROM person_visits pv
	WHERE pv.pizzeria_id = pi.id
)





