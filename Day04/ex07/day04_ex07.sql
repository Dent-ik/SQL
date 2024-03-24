INSERT INTO person_visits
SELECT COUNT(*) + 1,
(SELECT id FROM person WHERE name = 'Dmitriy'),
(SELECT pizzeria.id FROM pizzeria
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    WHERE price < 800
    LIMIT 1),
'2022-01-08'
FROM person_visits;

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats

select *
      from mv_dmitriy_visits_and_eats










