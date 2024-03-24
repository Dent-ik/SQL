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
UNION ALL
SELECT *
FROM routes
WHERE total_cost = (
  SELECT MAX(total_cost)
  FROM routes
)
ORDER BY total_cost, tour;
