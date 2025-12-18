SELECT person.address as address, 
	ROUND((MAX(age) - (MIN(age) / MAX(age::numeric))), 2) as formula, 
    ROUND(AVG(age), 2) as "average",
    (ROUND((MAX(age) - (MIN(age) / MAX(age::numeric))), 2) > ROUND(AVG(age), 2)) as comparison
FROM person
GROUP BY address
ORDER BY address;