SELECT pizzeria.name as name, COUNT(*) as count_of_orders,  ROUND(AVG(price), 2) as average_price,
MAX(price) as max_price, MIN(price) as min_price
FROM person_order
JOIN menu on person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name 
ORDER BY name;
