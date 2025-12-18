(SELECT pizzeria.name, COUNT(*)  as count, 'visit' as action_type 
FROM person_visits
JOIN pizzeria on person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY count DESC
LIMIT 3
)

UNION

(SELECT pizzeria.name , COUNT(*)  as count, 'order' as action_type 
FROM person_order
JOIN menu on person_order.menu_id = menu.id
JOIN pizzeria on menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY count DESC
LIMIT 3
)
ORDER BY action_type ASC, count DESC;