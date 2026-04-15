SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS contractors;
CREATE DATABASE if NOT EXISTS freelance;
SET FOREIGN_KEY_CHECKS = 1;
USE freelance;

CREATE TABLE locations 
(
   place_id INT,
   city VARCHAR(50),
   country VARCHAR(50) ,
   CONSTRAINT loc_pk PRIMARY KEY(place_id)
);

Create TABLE clients(
    client_id INT,
    client_name VARCHAR(50),
    place_id INT,
    CONSTRAINT cli_pk PRIMARY KEY(client_id),
    CONSTRAINT place_fk FOREIGN KEY(place_id) REFERENCES locations(place_id)

);

CREATE Table contractors(
    contractor_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    client_id INT,
    CONSTRAINT con_pk PRIMARY KEY(contractor_id),
    CONSTRAINT cli_fk FOREIGN KEY(client_id) REFERENCES clients(client_id)

);


INSERT into locations (place_id, city, country) VALUES
(1, 'London', 'UK'),
(2, 'New York', 'USA'),
(3, 'Paris', 'France'),
(4, 'Tokyo', 'Japan');

SELECT * FROM locations;

INSERT into clients (client_id, client_name, place_id) VALUES
(1, 'BA', 1),
(2, 'EDF', 3),
(3, 'Google', 2),
(4, 'IBM', 2),
(5, 'Tesco', 1),
(6, 'Toyota', 4);

SELECT * FROM clients;

INSERT INTO contractors (contractor_id, first_name, last_name, client_id) VALUES
(1, 'Andrew', 'Wallace', 4),
(2, 'Andre', 'Sinclair', 3),
(3, 'John', 'Smith', 1),
(4, 'Parker', 'Hamilton', 2),
(5, 'James', 'Washington', 3),
(6, 'Paul', 'Piper', 2),
(7, 'John', 'Smith', 4);

SELECT * from contractors;