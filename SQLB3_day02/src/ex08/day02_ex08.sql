SELECT DISTINCT person.name
FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
WHERE person.gender = 'male' and (person.address = 'Moscow' or person.address = 'Samara') and (menu.pizza_name = 'pepperoni pizza' or menu.pizza_name = 'mushroom pizza')
ORDER BY person.name DESC;