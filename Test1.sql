CREATE TYPE address_street AS (
    street_name varchar(50),
    street_type varchar(30)
);

CREATE FUNCTION default_address_street()
RETURNS address_street AS $$
BEGIN
    RETURN ROW('', 'alley'::varchar(30))::address_street;
END;
$$ LANGUAGE plpgsql;

CREATE TYPE address AS (
    number INTEGER,
    street address_street,
    city CHARACTER VARYING(40),
    state CHARACTER(2)
);

CREATE TABLE employee (
 name varchat(50),
 ssn  INT PRIMARY KEY,
 addr address);
 
 INSERT INTO employee
 VALUES('Smith', 1112233, 
		(1500, ROW('Bardstown', 'street'),
                 'Louisville', 'KY'));
				 
Select * from employee
