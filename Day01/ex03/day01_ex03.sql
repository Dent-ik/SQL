SELECT  po.action_date , po.person_id
    FROM (
	SELECT peo.order_date  AS action_date , peo.person_id AS person_id
	FROM person_order peo
	UNION 
	SELECT pv.visit_date AS action_date, pv.person_id AS person_id
	FROM person_visits pv
		WHERE  person_id != person_id
) AS po
ORDER BY po.action_date, po.person_id DESC
