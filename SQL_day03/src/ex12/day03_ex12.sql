INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    (SELECT MAX(id) FROM person_order) + generate.num, person.id,
    (SELECT id FROM menu WHERE pizza_name = 'Greek pizza'),'2022-02-25'
FROM person
CROSS JOIN generate_series(1, (SELECT COUNT(*) FROM person)) AS generate(num)
WHERE person.id = generate.num;