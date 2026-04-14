USE freelance;
SET AUTOCOMMIT=0;

CREATE TABLE locations_copy LIKE locations;

Insert INTO locations_copy (place_id, city, country) 
    Select place_id, city, country 
    from locations;

SELECT * FROM locations;

Create TABLE clients_copy LIKE clients;

Insert Into clients (client_id, client_name, place_id) 
    SELECT client_id, client_name, place_id 
    FROM clients;

SELECT * FROM clients_copy;

Create TABLE contractors_copy LIKE contractors;
Insert Into contractors (contractor_id, first_name, last_name, client_id)  SELECT contractor_id, first_name,last_name, client_id from contractors;

SELECT * FROM contractors_copy;

