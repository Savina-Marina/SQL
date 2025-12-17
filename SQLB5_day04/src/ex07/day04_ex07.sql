CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT DISTINCT pizzeria.name
FROM person_visits
JOIN person ON person.id = person_visits.person_id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
WHERE person.name = 'Dmitriy';

WITH max_id AS (
    SELECT COALESCE(MAX(id), 0) as current_max FROM person_visits
)
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT 
    max_id.current_max + ROW_NUMBER() OVER (),
    person.id, pizzeria.id, DATE '2022-01-08'
FROM person, max_id
JOIN pizzeria ON pizzeria.name NOT IN (
    SELECT name FROM mv_dmitriy_visits_and_eats
)
JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Dmitriy'
  AND menu.price < 800;

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

SELECT * FROM mv_dmitriy_visits_and_eats;