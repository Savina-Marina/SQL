CREATE UNIQUE INDEX idx_menu_unique on menu(pizzeria_id, pizza_name);

SET enable_seqscan = off;
EXPLAIN ANALYZE 
SELECT *
FROM menu
WHERE pizzeria_id = 1 and pizza_name = 'cheese pizza';
