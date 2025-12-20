--Session #1
BEGIN ISOLATION LEVEL REPEATABLE READ; -- Начало транзакции с уровнем READ REPEATABLE
SELECT SUM(rating) FROM pizzeria; -- Первый запрос (сумма рейтингов)
SELECT SUM(rating) FROM pizzeria; -- Второй запроc
COMMIT;
SELECT SUM(rating) FROM pizzeria; -- Финальный запрос

--Session #2
BEGIN ISOLATION LEVEL REPEATABLE READ; -- Начало транзакции с уровнем READ REPEATABLE
INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 2', 4); -- Вставка новой пиццерии
COMMIT;
SELECT SUM(rating) FROM pizzeria; -- Проверка результата