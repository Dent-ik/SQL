SELECT pv.visit_date action_date, p.name person_name
FROM person p, person_visits pv
WHERE p.id = pv.person_id
ORDER BY pv.visit_date ASC, p.name DESC;