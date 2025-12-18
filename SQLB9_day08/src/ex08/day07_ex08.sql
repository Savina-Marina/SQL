SELECT person.address as address, pizzeria.name as name , COUNT(DISTINCT person_order.id) as count_of_orders
FROM person_order
JOIN person on person_order.person_id = person.id
JOIN menu on person_order.menu_id = menu.id
JOIN pizzeria on menu.pizzeria_id = pizzeria.id
GROUP BY person.address , pizzeria.name
ORDER BY person.address , pizzeria.name;

