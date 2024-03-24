WITH
	favorite_order AS (
SELECT pi.name, COUNT(*) count, 'order' AS action_type
FROM person_order po
JOIN menu m
ON po.menu_id = m.id
JOIN pizzeria pi
ON pi.id = m.pizzeria_id
GROUP BY 1
ORDER BY count DESC
LIMIT 3
), 
favorite_visits AS(
SELECT pi.name , COUNT(*), 'visit' AS action_type
FROM person_visits pv
JOIN pizzeria pi
ON pi.id = pv.pizzeria_id
GROUP BY 1
ORDER BY count DESC
LIMIT 3
	
)

SELECT *
FROM favorite_order
UNION ALL
SELECT *
FROM favorite_visits
 ORDER BY action_type, count DESC