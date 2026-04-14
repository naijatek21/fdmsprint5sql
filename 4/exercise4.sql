USE freelance;
SET AUTOCOMMIT=0;

--2

CREATE TABLE locations_copy LIKE locations;

INSERT INTO locations_copy (place_id, city, country) 
    SELECT place_id, city, country 
    FROM locations;

SELECT * FROM locations;

Create TABLE clients_copy LIKE clients;

INSERT INTO clients (client_id, client_name, place_id) 
    SELECT client_id, client_name, place_id 
    FROM clients;

SELECT * FROM clients_copy;

CREATE TABLE contractors_copy LIKE contractors;
INSERT INTO contractors (contractor_id, first_name, last_name, client_id)  SELECT contractor_id, first_name,last_name, client_id from contractors;

SELECT * FROM contractors_copy;

--3a
UPDATE clients 
SET place_id = 2
WHERE client_name="Toyota";

SELECT client_name,place_id 
FROM clients 
WHERE client_name = 'Toyota' OR client_name='IBM';

--3b
UPDATE clients 
SET place_id = (
    SELECT place_id 
    FROM clients 
    WHERE client_name='IBM')
WHERE client_name="Toyota";
--test
SELECT client_name,place_id 
FROM clients 
WHERE client_name = 'Toyota' OR client_name='IBM' ;


--4a
UPDATE contractors 
SET 
    first_name='Jonathan',
    last_name = 'Smithson'
WHERE first_name = 'John' AND last_name = 'Smith';

--4b
SET SQL_SAFE_UPDATES=0;
UPDATE contractors 
SET 
    first_name='Jonathan',
    last_name = 'Smithson'
WHERE first_name = 'John' AND last_name = 'Smith';
SET SQL_SAFE_UPDATES = 1;


--4
    UPDATE contractors 
    SET 
        first_name='Jonathan',
        last_name = 'Smithson'
    WHERE contractor_id = 7;
    COMMIT
    SET AUTOCOMMIT=1

--4.4
     UPDATE contractors 
    SET 
        first_name='Jonathan',
        last_name = 'Smithson'
    WHERE contractor_id = (
        SELECT contractor_id 
        FROM contractors
        WHERE first_name = 'John' AND last_name = 'Smith'
    );

--4.5
--      UPDATE contractors 
--     SET 
--         first_name='Jonathan',
--         last_name = 'Smithson'
--     WHERE contractor_id = (
--         SELECT contractor_id 
--         FROM contractors
--         WHERE first_name = 'John' 
--     )
  

--5
    DELETE FROM contactors
        WHERE client_id = (
            SELECT client_id 
            FROM clients 
            WHERE client_name = 'EDF'
            );
    DELETE FROM clients
        WHERE client_name = 'EDF'

--6
    DELETE FROM contractors
        WHERE client_id = (
            SELECT client_id 
            FROM clients 
            WHERE client_name = 'Google'
            );


--7
    DELETE FROM clients
        WHERE client_id NOT IN (
            SELECT client_id 
            FROM contractors
        );

