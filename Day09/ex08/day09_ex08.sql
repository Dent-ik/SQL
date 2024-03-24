CREATE FUNCTION fnc_fibonacci(pstop integer default 10) RETURNS table(fib int) AS $$
    WITH RECURSIVE fibo AS
    (SELECT 0 AS first, 1 AS second
     UNION ALL
    SELECT second, first + second FROM fibo WHERE second < pstop)
    SELECT first FROM fibo
    $$ LANGUAGE sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();