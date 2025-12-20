--Session #1
BEGIN ISOLATION LEVEL SERIALIZABLE; -- Начало транзакции с максимальной изоляцией
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Первый запрос
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Второй запрос
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Финальный запрос (видим актуальные данные)

--Session #2
BEGIN ISOLATION LEVEL SERIALIZABLE; -- Начало транзакции с максимальной изоляцией
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut'; -- Обновление рейтинга 
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка результата
