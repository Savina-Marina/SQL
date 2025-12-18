WITH restaurants AS(
	(SELECT name, COUNT(person_id)  as count, 'visit' as action_type 
FROM person_visits
JOIN pizzeria on pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY count DESC
)

UNION

	(SELECT name , COUNT(person_id)  as count, 'order' as action_type 
FROM person_order
JOIN menu on menu_id = menu.id
JOIN pizzeria on menu.pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY count DESC
)
ORDER BY action_type ASC, count DESC)

SELECT name, SUM(count) as total_count
FROM restaurants
GROUP BY name
ORDER BY total_count DESC, name ASC;
