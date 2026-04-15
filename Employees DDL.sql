DROP TABLE IF EXISTS employees;

CREATE TABLE employees 
(
employee_id INT PRIMARY KEY,
name        VARCHAR(50),
manager_id  INT
);


ALTER TABLE employees
ADD CONSTRAINT manager_fk
FOREIGN KEY (manager_id)
REFERENCES employees(employee_id);

INSERT INTO employees (employee_id, name, manager_id) VALUES (1,'Krystle Reece',null);
INSERT INTO employees (employee_id, name, manager_id) VALUES (2,'Vickey Duvall',1);
INSERT INTO employees (employee_id, name, manager_id) VALUES (3,'Brendon	 Hannon',2);
INSERT INTO employees (employee_id, name, manager_id) VALUES (4,'Alysia Messenger',3);
INSERT INTO employees (employee_id, name, manager_id) VALUES (5,'Shelton Thomsen',3);
INSERT INTO employees (employee_id, name, manager_id) VALUES (6,'Divina Hargis',4);
INSERT INTO employees (employee_id, name, manager_id) VALUES (7,'Neely Morrow',4);
INSERT INTO employees (employee_id, name, manager_id) VALUES (8,'Marceline Hawks',4);
INSERT INTO employees (employee_id, name, manager_id) VALUES (9,'Alphonse Mcghee',5);
INSERT INTO employees (employee_id, name, manager_id) VALUES (10,'Concha Coley',5);