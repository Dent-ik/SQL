SELECT pi.name, COUNT(pi.name) AS count_order, ROUND(AVG(price),2) average_price, MAX(m.price) max_price, MIN(m.price) min_price
FROM person_order po
JOIN menu m
ON m.id = po.menu_id
JOIN pizzeria pi
ON pi.id = m.pizzeria_id
GROUP BY 1
ORDER BY 1

-- SELECT pi.name, COUNT(pi.name) AS count_order, AVG(m.price)::INT average_price, MAX(m.price) max_price, MIN(m.price) min_price
-- FROM person_order po
-- JOIN menu m
-- ON m.id = po.menu_id
-- JOIN pizzeria pi
-- ON pi.id = m.pizzeria_id
-- GROUP BY 1
-- ORDER BY 1