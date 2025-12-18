SELECT name , count_of_visits
FROM(
SELECT person.name, COUNT(person_visits.person_id) as count_of_visits
FROM person_visits
JOIN person on person_visits.person_id = person.id
GROUP BY person.name) as visit_1
WHERE count_of_visits > 3;
