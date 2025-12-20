Session #1
BEGIN ISOLATION LEVEL READ COMMITTED; -- Начало транзакции с уровнем READ COMMITTED
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Первый запрос
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Второй запрос, увидим 3.6 после commit
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Финальный запрос

Session #2
BEGIN ISOLATION LEVEL READ COMMITTED; -- Начало транзакции с уровнем READ COMMITTED
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Обновление рейтинга 
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка результата