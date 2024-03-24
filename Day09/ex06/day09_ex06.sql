CREATE FUNCTION fnc_person_visits_and_eats_on_date (pperson VARCHAR DEFAULT 'Dmitriy',
                                                    pprice  NUMERIC DEFAULT 500,
                                                    pdate   DATE DEFAULT    '2022-01-08')
                                                    RETURNS TABLE (name VARCHAR) AS $$
    BEGIN
        RETURN QUERY
            SELECT p2.name AS name FROM person p
                JOIN person_visits pv on p.id = pv.person_id
                JOIN pizzeria p2 on pv.pizzeria_id = p2.id
                JOIN menu m on p2.id = m.pizzeria_id
            WHERE price < pprice AND p.name = pperson AND visit_date = pdate;
        END;
    $$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');