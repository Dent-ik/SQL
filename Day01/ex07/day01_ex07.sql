SELECT po.order_date, CONCAT(name, ' (age:',age::varchar,')')  person_information
FROM person p, person_order po
WHERE p.id = po.person_id
ORDER BY person_information