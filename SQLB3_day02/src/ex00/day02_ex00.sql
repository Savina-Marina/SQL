SELECT pizzeria.name AS  pizzeria_name, pizzeria.rating AS rating_value
FROM pizzeria
LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE person_visits.pizzeria_id IS NULL
ORDER BY pizzeria.name
