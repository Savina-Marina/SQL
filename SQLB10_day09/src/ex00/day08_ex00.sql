--Session #1

BEGIN; -- Начало транзакции - все последующие операции будут изолированы
UPDATE pizzeria  SET rating = 5 WHERE name = 'Pizza Hut'; -- Обновление рейтинга Pizza Hut до 5 баллов
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT; -- Фиксация изменений - теперь они становятся видны всем сеансам

--Session2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';