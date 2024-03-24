SELECT m.name 
FROM v_persons_male m
UNION ALL
SELECT name 
FROM v_persons_female m
ORDER BY 1
