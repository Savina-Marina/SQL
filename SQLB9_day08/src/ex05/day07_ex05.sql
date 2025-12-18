SELECT person.name
FROM person_order
JOIN person on person_order.person_id = person_id
GROUP BY person.name
ORDER BY person.name;