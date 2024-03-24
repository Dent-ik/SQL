SELECT name, sum(count) AS total_count FROM ((select p.name, count(pv.id) from person_visits pv
        JOIN pizzeria p ON pv.pizzeria_id = p.id GROUP BY name) UNION ALL (select p.name, count(po.id) from person_order po
    JOIN menu m on m.id = po.menu_id
    JOIN pizzeria p on p.id = m.pizzeria_id
    GROUP BY name)) as vo GROUP BY name ORDER BY total_count DESC, name;

