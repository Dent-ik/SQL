CREATE VIEW v_price_with_discount AS(
SELECT p.name, m.pizza_name, m.price, (m.price*0.9)::int discount_price
FROM person_order po
INNER JOIN person p
ON po.person_id = p.id
INNER JOIN menu m
ON po.menu_id = m.id
ORDER BY  p.name, m.pizza_name);
