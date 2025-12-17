DELETE FROM person_order
WHERE order_date = date '2022-02-25' and menu_id IN (SELECT id FROM menu WHERE pizza_name = 'Greek pizza');

DELETE FROM menu
WHERE pizza_name = 'Greek pizza';