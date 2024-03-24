DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();


CREATE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS TABLE  (id      person.id%TYPE,
                name    person.name%TYPE,
                age     person.age%TYPE,
                gender  person.gender%TYPE,
                address person.address%TYPE) AS $$
    SELECT * FROM person WHERE gender = pgender
    $$ LANGUAGE sql;


select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();