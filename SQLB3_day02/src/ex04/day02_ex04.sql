SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name,
menu.price AS price
FROM pizzeria
JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'
ORDER BY pizza_name ,pizzeria_name ,price;