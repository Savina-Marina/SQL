--Session #1
SHOW TRANSACTION ISOLATION LEVEL;  -- Проверка текущего уровня изоляции транзакций
BEGIN; -- Начало транзакции
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; -- Обновление рейтинга Pizza Hut до 4 баллов
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

--Session #2
SHOW TRANSACTION ISOLATION LEVEL; -- Проверка текущего уровня изоляции транзакций
BEGIN; -- Начало транзакции
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Обновление рейтинга Pizza Hut до 3.6 баллов
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
