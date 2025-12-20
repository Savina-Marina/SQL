--Session #1
BEGIN ISOLATION LEVEL READ COMMITTED; -- Начало транзакции с уровнем READ COMMITTED
SELECT SUM(rating) FROM pizzeria; -- Первый запрос (сумма рейтингов)
SELECT SUM(rating) FROM pizzeria; -- Второй запроc
COMMIT;
SELECT SUM(rating) FROM pizzeria; -- Финальный запрос

--Session #2
BEGIN ISOLATION LEVEL READ COMMITTED; -- Начало транзакции с уровнем READ COMMITTED
INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza', 5); -- Вставка новой пиццерии
COMMIT;
SELECT SUM(rating) FROM pizzeria; -- Проверка результата