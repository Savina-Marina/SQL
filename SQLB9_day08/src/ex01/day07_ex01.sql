SELECT name,  COUNT(*) as count_of_visits
FROM person_visits
JOIN person on person_visits.person_id = person.id 
GROUP BY 1
ORDER BY count_of_visits DESC
LIMIT 4;
