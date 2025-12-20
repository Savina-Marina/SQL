--Session #1
BEGIN ISOLATION LEVEL REPEATABLE READ; -- Установка уровня изоляции REPEATABLE READ для текущей транзакции
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; -- Обновление рейтинга Pizza Hut до 4 баллов
COMMIT; -- Фиксация изменений
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

--Session #2
BEGIN ISOLATION LEVEL REPEATABLE READ; -- Установка уровня изоляции REPEATABLE READ для текущей транзакции
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Обновление рейтинга Pizza Hut до 3.6 баллов
COMMIT; -- Фиксация изменений
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
