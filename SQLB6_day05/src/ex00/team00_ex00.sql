
CREATE TABLE nodes (
    point1 varchar(1) NOT NULL,
    point2 varchar(1) NOT NULL,
    cost int NOT NULL
);

INSERT INTO nodes VALUES 
('a','b',10), ('b','a',10),
('a','c',15), ('c','a',15),
('a','d',20), ('d','a',20),
('b','c',35), ('c','b',35),
('b','d',25), ('d','b',25),
('c','d',30), ('d','c',30);


WITH RECURSIVE tours AS (
    SELECT 
        point1,
        point2,
        cost,
        point1 || ',' || point2 AS tour,
        cost AS total_cost,
        1 AS depth
    FROM nodes 
    WHERE point1 = 'a'
    
    UNION ALL

    SELECT 
        n.point1,
        n.point2,
        n.cost,
        p.tour || ',' || n.point2,
        p.total_cost + n.cost,
        p.depth + 1
    FROM nodes n
    JOIN tours p ON n.point1 = p.point2
    WHERE (p.tour NOT LIKE '%' || n.point2 || '%' AND p.depth < 3)
       OR (n.point2 = 'a' AND p.depth = 3)
),
complete_tours AS (
    SELECT 
        total_cost,
        concat('{', tour, '}') as tour
    FROM tours
    WHERE point2 = 'a'
)
SELECT *
FROM complete_tours
WHERE total_cost = (SELECT MIN(total_cost) FROM complete_tours)
ORDER BY total_cost, tour;