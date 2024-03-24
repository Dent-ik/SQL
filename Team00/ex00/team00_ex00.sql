CREATE TABLE graph(
    point1 VARCHAR,
    point2 VARCHAR,
    cost INTEGER
);

INSERT INTO graph
VALUES
  ('a', 'b', 10),
  ('b', 'a', 10),
  ('a', 'c', 15),
  ('c', 'a', 15),
  ('a', 'd', 20),
  ('d', 'a', 20),
  ('b', 'd', 25),
  ('d', 'b', 25),
  ('d', 'c', 30),
  ('c', 'd', 30),
  ('b', 'c', 35),
  ('c', 'b', 35);

WITH RECURSIVE nodes AS (
  SELECT point1 AS path,
    point1, point2, cost
  FROM graph
  WHERE point1 = 'a'
  UNION
  SELECT nodes.path || ',' || graph.point1 AS path,
    graph.point1, graph.point2,
    nodes.cost + graph.cost
  FROM nodes
    JOIN graph
    ON nodes.point2 = graph.point1
  WHERE path NOT LIKE '%' || graph.point1 || '%'), routes AS (
  SELECT cost AS total_cost,
    '{' || path || ',a' || '}' AS tour
  FROM nodes
  WHERE LENGTH(path) = 7 AND point2 = 'a'
)
SELECT *
FROM routes
WHERE total_cost = (
  SELECT MIN(total_cost)
  FROM routes
)
ORDER BY total_cost, tour;