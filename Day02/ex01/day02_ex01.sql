SELECT 
	d::date missing_date
FROM (SELECT * FROM person_visits pv WHERE pv.person_id BETWEEN 1 AND 2) pv 
RIGHT JOIN generate_series('2022-01-01','2022-01-10', interval '1 day') d
on pv.visit_date = d
where pv.id is null
order by 1