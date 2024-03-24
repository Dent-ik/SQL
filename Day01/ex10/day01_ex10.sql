SELECT 
(SELECT p.name FROM person p WHERE  po.person_id = p.id) person_name ,   
(SELECT m.pizza_name FROM menu m WHERE po.menu_id = m.id) pizza_name,
  (SELECT   (SELECT  pi.name    FROM  pizzeria  pi WHERE pi.id = m.pizzeria_id ) FROM  menu m WHERE po.menu_id = m.id) pizzeria_name
FROM person_order po
ORDER BY person_name, pizza_name , pizzeria_name
