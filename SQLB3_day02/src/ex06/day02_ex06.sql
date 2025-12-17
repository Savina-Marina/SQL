SELECT menu.pizza_name, pizzeria.name
FROM person_order
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person ON person_order.person_id = person.id
WHERE person.name IN ('Denis', 'Anna')
ORDER BY menu.pizza_name, pizzeria.name;