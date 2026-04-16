USE freelance;
-- SET AUTOCOMMIT=0;

-- 2

CREATE TABLE locations_copy LIKE locations;

INSERT INTO locations_copy (place_id, city, country) 
    SELECT place_id, city, country 
    FROM locations;

SELECT * FROM locations_copy;

Create TABLE clients_copy LIKE clients;

INSERT INTO clients_copy (client_id, client_name, place_id) 
    SELECT client_id, client_name, place_id 
    FROM clients;

SELECT * FROM clients_copy;

CREATE TABLE contractors_copy LIKE contractors;
INSERT INTO contractors_copy (contractor_id, first_name, last_name, client_id)  SELECT contractor_id, first_name,last_name, client_id from contractors;

SELECT * FROM contractors_copy;

-- 3a
SET SQL_SAFE_UPDATES = 0;
UPDATE clients 
SET place_id = 2
WHERE client_name="Toyota";

SELECT client_name,place_id 
FROM clients 
WHERE client_name = 'Toyota' OR client_name='IBM';

-- 3b
UPDATE clients 
SET place_id = (
    SELECT place_id 
    FROM clients 
    WHERE client_name='IBM')
WHERE client_name="Toyota";
-- test
SELECT client_name,place_id 
FROM clients 
WHERE client_name = 'Toyota' OR client_name='IBM' ;


-- 4a
SET SQL_SAFE_UPDATES=1;
UPDATE contractors 
SET 
    first_name='Jonathan',
    last_name = 'Smithson'
WHERE first_name = 'John' AND last_name = 'Smith';
-- Produced an error 

SELECT * FROM contractors WHERE contractor_id=7;

-- 4b
SET SQL_SAFE_UPDATES=0;
SET AUTOCOMMIT = 0;
UPDATE contractors 
SET 
    first_name='Jonathan',
    last_name = 'Smithson'
WHERE first_name = 'John' AND last_name = 'Smith';
SELECT * FROM contractors WHERE contractor_id=7;
-- Update goes through

SET SQL_SAFE_UPDATES = 1;
ROLLBACK;
SELECT * FROM contractors WHERE contractor_id=7;
-- Doesnt't Rollback because the update lock is set now

-- 4c
    UPDATE contractors 
    SET 
        first_name='Johnathan',
        last_name = 'Smithson'
    WHERE contractor_id = 7;
    SELECT * FROM contractors WHERE contractor_id=7;

    COMMIT;
    SET AUTOCOMMIT=1;

-- 4d
     UPDATE contractors 
    SET 
        first_name='Jonathan',
        last_name = 'Smithson'
    WHERE contractor_id = (
        SELECT contractor_id 
        FROM contractors
        WHERE first_name = 'John' AND last_name = 'Smith'
    );
    -- failse because you can't specifiy the table your updating in the from clause

-- 4e
--      UPDATE contractors 
--     SET 
--         first_name='Jonathan',
--         last_name = 'Smithson'
--     WHERE contractor_id = (
--         SELECT contractor_id 
--         FROM contractors
--         WHERE first_name = 'John' 
--     )
  

-- 5
    DELETE FROM contractors
        WHERE client_id = (
            SELECT client_id 
            FROM clients 
            WHERE client_name = 'EDF'
            );
    DELETE FROM clients
        WHERE client_name = 'EDF';
        -- doesn't work because while safe update is on you can only specify a keyt in the where column
	SET SQL_SAFE_UPDATES = 0;
    SELECT * FROM clients;

-- 6
DELETE FROM contractors
        WHERE client_id = (
            SELECT client_id 
            FROM clients 
            WHERE client_name = 'Google'
            );
	SELECT * FROM contractors;



-- 7
    DELETE FROM clients
        WHERE client_id NOT IN (
            SELECT client_id 
            FROM contractors
        );
    SELECT * FROM clients;
-- Should only ssee BA(client_id 1) and IBM(client_id 4) 
