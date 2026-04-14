DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS branches;
DROP TABLE IF EXISTS transaction_types;
DROP TABLE IF EXISTS account_types;
DROP TABLE IF EXISTS customers;


CREATE TABLE customers
(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(30),
house_number INT,
street VARCHAR(30),
city VARCHAR(20),
postcode VARCHAR(8)
);

CREATE TABLE account_types
(
account_type INT PRIMARY KEY,
account_description VARCHAR(20)
);

CREATE TABLE transaction_types
(
transaction_type INT PRIMARY KEY,
transaction_description VARCHAR(20)
);

CREATE TABLE branches
(
branch_id INT PRIMARY KEY,
house_number INT,
street VARCHAR(30),
city VARCHAR(20),
postcode VARCHAR(8)
);

CREATE TABLE accounts
(
account_id INT PRIMARY KEY,
customer_id INT,
branch_id INT,
account_type INT,
date_opened DATE,
date_closed DATE,
CONSTRAINT customer_id_fk FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
CONSTRAINT branch_id_fk FOREIGN KEY (branch_id) REFERENCES branches(branch_id),
CONSTRAINT account_type_fk FOREIGN KEY (account_type) REFERENCES account_types(account_type)
);

CREATE TABLE transactions
(
account_id INT,
transaction_time DATETIME,
transaction_type INT,
amount DECIMAL(10,2),
CONSTRAINT transactions_pk PRIMARY KEY (account_id, transaction_time),
CONSTRAINT transaction_type_fk FOREIGN KEY (transaction_type) REFERENCES transaction_types(transaction_type)
);


INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (1,'Beverly Marshall',43,'Winetavern Hill','Glasgow','G5 7QQ');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (2,'Marion Webb',30,'Lombard West Bank','Glasgow','G3 9EY');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (3,'Timothy Green',85,'Parliament Side','Glasgow','G72 6NP');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (4,'Henry Cook',3,'Charlotte Street','Newcastle','NE30 1DJ');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (5,'Robert Cooper',9,'William Road','London','N11 2BT');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (6,'Lillian Daniel',86,'Constitution Row','London','N22 6PQ');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (7,'Cora Buchanan',66,'Montgomery Terrace','London','SW7 1HJ');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (8,'Maxine Pittman',12,'Eustace Passage','London','SE24 9ED');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (9,'James Carter',14,'Connell Drive','London','W1K 1AN');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (10,'Peter Moore',22,'Hatch Vale','London','E4 9PJ');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (11,'Philip Peterson',21,'Davis Alley','Manchester','M45 8EL');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (12,'Victor Williams',80,'Mitchell Vale','Manchester','M41 6LG');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (13,'Kerry Stokes',38,'Barrack Quay','Manchester','M33 6PF');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (14,'Philip Rogers',29,'Bailey Mount','Manchester','M15 5TQ');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (15,'Dorothy Long',26,'Hindringham Road','Norwich','NR22 6DR');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (16,'Robert Cooper',17,'Sonia Gardens','London','NW10 1AG');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (17,'Beverly Marshall',10,'Newdown Road','Liverpool','L11 0AD');
INSERT INTO customers (customer_id, customer_name, house_number, street, city, postcode) VALUES (18,'Nadia Hawi',33,'Rainey Street','Londonderry','BT45 5AA');

INSERT INTO account_types (account_type, account_description) VALUES (1,'current');
INSERT INTO account_types (account_type, account_description) VALUES (2,'savings');
INSERT INTO account_types (account_type, account_description) VALUES (3,'business');

INSERT INTO transaction_types (transaction_type, transaction_description) VALUES (1,'ATM withdrawal');
INSERT INTO transaction_types (transaction_type, transaction_description) VALUES (2,'Transfer in');
INSERT INTO transaction_types (transaction_type, transaction_description) VALUES (3,'Transfer out');
INSERT INTO transaction_types (transaction_type, transaction_description) VALUES (4,'Direct Debit');
INSERT INTO transaction_types (transaction_type, transaction_description) VALUES (5,'Cash deposit');

INSERT INTO branches (branch_id, house_number, street, city, postcode) VALUES (1,1,'Eastcheap','London','EC3M 1AA');
INSERT INTO branches (branch_id, house_number, street, city, postcode) VALUES (2,79,'Calverdale Avenue','Manchester','M21 7PZ');
INSERT INTO branches (branch_id, house_number, street, city, postcode) VALUES (3,36,'Drygate','Glasgow','G4 0YA');
INSERT INTO branches (branch_id, house_number, street, city, postcode) VALUES (4,22,'Kingsway','London','WC2A 2HT');
INSERT INTO branches (branch_id, house_number, street, city, postcode) VALUES (5,38,'Stoke Newington High Street','London','N16 7PL');

INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (56483939,1,3,3,DATE_ADD(CURDATE(), INTERVAL -440 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (78338956,2,3,1,DATE_ADD(CURDATE(), INTERVAL -2769 DAY),DATE_ADD(CURDATE(), INTERVAL -1890 DAY));
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (52728686,2,3,3,DATE_ADD(CURDATE(), INTERVAL -101 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (25667397,2,3,2,DATE_ADD(CURDATE(), INTERVAL -2993 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (47685796,3,3,1,DATE_ADD(CURDATE(), INTERVAL -3428 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (54837221,3,3,2,DATE_ADD(CURDATE(), INTERVAL -3562 DAY),DATE_ADD(CURDATE(), INTERVAL -1900 DAY));
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (87258666,4,3,1,DATE_ADD(CURDATE(), INTERVAL -3700 DAY),DATE_ADD(CURDATE(), INTERVAL -245 DAY));
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) 
       VALUES (38146185,4,3,2,(CASE WHEN CONCAT(YEAR(CURDATE())-10, RIGHT(DATE_ADD(CURDATE(), INTERVAL -1 DAY), 6)) = CONCAT(YEAR(CURDATE())-10, '-02-29')
                                    THEN STR_TO_DATE(CONCAT(YEAR(CURDATE())-10, RIGHT(CURDATE(), 6)), '%Y-%m-%d')
                                    ELSE STR_TO_DATE(CONCAT(YEAR(CURDATE())-10, RIGHT(DATE_ADD(CURDATE(), INTERVAL -1 DAY), 6)), '%Y-%m-%d')
                               END)
                             ,NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (55533262,5,1,1,DATE_ADD(CURDATE(), INTERVAL -4034 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (55376799,5,1,3,DATE_ADD(CURDATE(), INTERVAL -4113 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (82232723,5,1,2,DATE_ADD(CURDATE(), INTERVAL -405 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (34242358,6,1,1,DATE_ADD(CURDATE(), INTERVAL -405 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (77783442,6,1,3,DATE_ADD(CURDATE(), INTERVAL -1417 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (77568493,6,1,2,DATE_ADD(CURDATE(), INTERVAL -1977 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (27953468,6,4,2,DATE_ADD(CURDATE(), INTERVAL -557 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (85923845,8,4,1,DATE_ADD(CURDATE(), INTERVAL -3362 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (84772925,7,4,1,DATE_ADD(CURDATE(), INTERVAL -363 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (78434257,7,4,3,DATE_ADD(CURDATE(), INTERVAL -1103 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (52378627,9,4,1,DATE_ADD(CURDATE(), INTERVAL -1589 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (72239757,9,4,2,DATE_ADD(CURDATE(), INTERVAL -3653 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (25836396,10,4,1,DATE_ADD(CURDATE(), INTERVAL -1825 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (46039792,10,1,2,DATE_ADD(CURDATE(), INTERVAL -3 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (32894464,10,1,3,DATE_ADD(CURDATE(), INTERVAL -4866 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (23995326,11,2,1,DATE_ADD(CURDATE(), INTERVAL -2567 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) 
       VALUES (54733628,11,2,2,(CASE WHEN CONCAT(YEAR(CURDATE())-10, RIGHT(CURDATE(), 6)) = CONCAT(YEAR(CURDATE())-10, '-02-29')
                                       OR CONCAT(YEAR(CURDATE())-10, RIGHT(CURDATE(), 6)) = CONCAT(YEAR(CURDATE())-10, '-03-01')
                                     THEN STR_TO_DATE(CONCAT(YEAR(CURDATE())-10, RIGHT(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 6)), '%Y-%m-%d')
                                     ELSE STR_TO_DATE(CONCAT(YEAR(CURDATE())-10, RIGHT(DATE_ADD(CURDATE(), INTERVAL -1 DAY), 6)), '%Y-%m-%d')
                                END)
 							  ,NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (22742922,12,2,1,DATE_ADD(CURDATE(), INTERVAL -3061 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (38256324,13,2,1,DATE_ADD(CURDATE(), INTERVAL -4716 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (10577680,13,2,3,DATE_ADD(CURDATE(), INTERVAL -5555 DAY),DATE_ADD(CURDATE(), INTERVAL -2395 DAY));
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (39022548,13,2,3,DATE_ADD(CURDATE(), INTERVAL -4683 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (68576388,14,2,1,DATE_ADD(CURDATE(), INTERVAL -334 DAY),DATE_ADD(CURDATE(), INTERVAL -35 DAY));
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (24843697,15,2,1,DATE_ADD(CURDATE(), INTERVAL -3906 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (95545567,15,2,3,DATE_ADD(CURDATE(), INTERVAL -651 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (63325847,15,1,2,DATE_ADD(CURDATE(), INTERVAL -4762 DAY),DATE_ADD(CURDATE(), INTERVAL -2435 DAY));
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (30177319,8,4,2,DATE_ADD(CURDATE(), INTERVAL -4832 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (65878125,17,3,3,DATE_ADD(CURDATE(), INTERVAL -212 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (79144602,18,3,1,DATE_ADD(CURDATE(), INTERVAL -3247 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (84336710,1,3,1,DATE_ADD(CURDATE(), INTERVAL -200 DAY),DATE_ADD(CURDATE(), INTERVAL -170 DAY));
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (86051392,1,3,1,DATE_ADD(CURDATE(), INTERVAL -1 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (66638210,18,3,2,DATE_ADD(CURDATE(), INTERVAL -1482 DAY),NULL);
INSERT INTO accounts (account_id, customer_id, branch_id, account_type, date_opened, date_closed) VALUES (43199052,17,3,2,DATE_ADD(CURDATE(), INTERVAL -2811 DAY),DATE_ADD(CURDATE(), INTERVAL -537 DAY));

INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (56483939,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -422 DAY), ' 13:35'), DATETIME),5,2264);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (78338956,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2748 DAY), ' 10:12'), DATETIME),5,1090.23);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (52728686,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -73 DAY), ' 11:54'), DATETIME),5,1759.55);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (25667397,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2990 DAY), ' 14:16'), DATETIME),5,588.82);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (47685796,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3405 DAY), ' 09:41'), DATETIME),5,3307.67);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (87258666,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3676 DAY), ' 15:07'), DATETIME),5,676.45);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55533262,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4008 DAY), ' 12:30'), DATETIME),5,1730);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55376799,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4085 DAY), ' 07:45'), DATETIME),5,837.50);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (82232723,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -396 DAY), ' 08:22'), DATETIME),5,1414.99);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (34242358,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -398 DAY), ' 10:37'), DATETIME),5,4505.15);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (77783442,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1415 DAY), ' 05:28'), DATETIME),5,1804.30);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (77568493,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1954 DAY), ' 23:05'), DATETIME),5,1191.25);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (27953468,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -531 DAY), ' 08:15'), DATETIME),5,3949.75);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (85923845,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3335 DAY), ' 00:40'), DATETIME),5,3044.80);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (84772925,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -236 DAY), ' 16:42'), DATETIME),5,3532.64);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (78434257,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1100 DAY), ' 12:19'), DATETIME),5,4018.38);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (52378627,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1586 DAY), ' 15:40'), DATETIME),5,2248);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (25836396,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1825 DAY), ' 17:35'), DATETIME),5,3763.15);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (32894464,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4842 DAY), ' 18:23'), DATETIME),5,818.26);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (23995326,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2550 DAY), ' 09:01'), DATETIME),5,2601);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (22742922,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3061 DAY), ' 11:56'), DATETIME),5,923.40);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (32894464,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4835 DAY), ' 12:10'), DATETIME),2,1250);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (32894464,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4828 DAY), ' 14:46'), DATETIME),2,1000);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (32894464,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4821 DAY), ' 11:17'), DATETIME),2,751);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (38256324,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4713 DAY), ' 22:07'), DATETIME),5,1622.25);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (68576388,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -282 DAY), ' 20:32'), DATETIME),5,3629.35);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (24843697,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3892 DAY), ' 21:47'), DATETIME),5,3994.99);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (95545567,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -647 DAY), ' 13:15'), DATETIME),5,4748.70);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (63325847,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4756 DAY), ' 14:50'), DATETIME),5,1249.45);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (56483939,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -383 DAY), ' 19:25'), DATETIME),5,278);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (78338956,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2717 DAY), ' 22:18'), DATETIME),1,-255);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (52728686,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -37 DAY), ' 06:10'), DATETIME),4,-256);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (25667397,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2915 DAY), ' 08:52'), DATETIME),4,-131.50);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (47685796,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3359 DAY), ' 09:40'), DATETIME),3,-323.10);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (87258666,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3617 DAY), ' 12:58'), DATETIME),4,-492.90);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55533262,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3967 DAY), ' 14:12'), DATETIME),1,-344);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55376799,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4059 DAY), ' 17:09'), DATETIME),1,-364);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (82232723,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -356 DAY), ' 15:39'), DATETIME),3,-402);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (34242358,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -366 DAY), ' 18:24'), DATETIME),1,-409);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (77783442,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1367 DAY), ' 10:44'), DATETIME),4,-206);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (77568493,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1883 DAY), ' 13:59'), DATETIME),2,377);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (27953468,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -462 DAY), ' 22:13'), DATETIME),3,-273.15);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (85923845,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3286 DAY), ' 19:07'), DATETIME),2,84);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (84772925,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -193 DAY), ' 21:50'), DATETIME),1,-40);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (78434257,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1004 DAY), ' 11:37'), DATETIME),4,-24.99);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (52378627,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1536 DAY), ' 14:52'), DATETIME),3,-186.50);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (25836396,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1692 DAY), ' 23:26'), DATETIME),2,26);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (32894464,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4819 DAY), ' 18:00'), DATETIME),5,89);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (23995326,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2468 DAY), ' 18:04'), DATETIME),3,-405);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (22742922,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2720 DAY), ' 19:39'), DATETIME),2,380);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (38256324,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4671 DAY), ' 09:38'), DATETIME),4,-494.99);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (68576388,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -201 DAY), ' 04:12'), DATETIME),3,-114);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (24843697,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3812 DAY), ' 10:05'), DATETIME),4,-346);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (95545567,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -594 DAY), ' 12:32'), DATETIME),4,-303);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (63325847,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4720 DAY), ' 17:38'), DATETIME),1,-325);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (56483939,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -156 DAY), ' 19:30'), DATETIME),4,-297);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (78338956,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2443 DAY), ' 22:52'), DATETIME),2,325);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (25667397,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2628 DAY), ' 21:36'), DATETIME),4,-463.55);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (47685796,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3230 DAY), ' 17:27'), DATETIME),5,386);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (87258666,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3371 DAY), ' 20:17'), DATETIME),4,-328);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55533262,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3681 DAY), ' 00:43'), DATETIME),2,392);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55376799,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3838 DAY), ' 08:25'), DATETIME),5,322);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (82232723,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -136 DAY), ' 11:17'), DATETIME),4,-228);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (34242358,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -240 DAY), ' 18:20'), DATETIME),1,-373.35);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (77783442,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1094 DAY), ' 15:52'), DATETIME),3,-119);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (77568493,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1635 DAY), ' 14:10'), DATETIME),5,129);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (27953468,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -244 DAY), ' 13:08'), DATETIME),1,-145);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (85923845,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2978 DAY), ' 13:40'), DATETIME),5,143);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (84772925,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -94 DAY), ' 20:41'), DATETIME),2,230);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (78434257,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -828 DAY), ' 18:26'), DATETIME),4,-364);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (52378627,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1274 DAY), ' 20:00'), DATETIME),2,358);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (25836396,CONVERT(CONCAT(DATE_ADD(DATE_ADD(CURDATE(), INTERVAL -4 YEAR), INTERVAL -1 DAY), ' 22:04'), DATETIME),4,-3789.15);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (32894464,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4595 DAY), ' 19:13'), DATETIME),2,24);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (23995326,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2466 DAY), ' 08:29'), DATETIME),2,114);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (22742922,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2321 DAY), ' 05:10'), DATETIME),4,-81.98);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (38256324,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4515 DAY), ' 10:20'), DATETIME),5,270);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (68576388,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -39 DAY), ' 11:37'), DATETIME),4,-263);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (24843697,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3799 DAY), ' 18:50'), DATETIME),2,175);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (95545567,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -396 DAY), ' 13:48'), DATETIME),5,260);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (63325847,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4362 DAY), ' 09:29'), DATETIME),5,267);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (78338956,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1928 DAY), ' 16:13'), DATETIME),5,149);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (25667397,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2403 DAY), ' 17:30'), DATETIME),2,90);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (47685796,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2626 DAY), ' 21:26'), DATETIME),2,294);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (87258666,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3137 DAY), ' 20:04'), DATETIME),2,127);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55533262,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3109 DAY), ' 14:38'), DATETIME),4,-282);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55376799,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3166 DAY), ' 17:33'), DATETIME),1,-132.50);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (77783442,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -642 DAY), ' 07:24'), DATETIME),5,169);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (77568493,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1306 DAY), ' 11:17'), DATETIME),3,-500);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (85923845,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2732 DAY), ' 23:43'), DATETIME),3,-170.35);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (78434257,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -385 DAY), ' 12:20'), DATETIME),4,-140);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (52378627,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -787 DAY), ' 00:03'), DATETIME),5,163);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (32894464,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4089 DAY), ' 15:42'), DATETIME),2,66);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (23995326,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1942 DAY), ' 10:47'), DATETIME),5,153);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (22742922,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2111 DAY), ' 13:54'), DATETIME),4,-366);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (38256324,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3838 DAY), ' 09:23'), DATETIME),1,-411.97);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (24843697,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3050 DAY), ' 18:54'), DATETIME),2,268);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (63325847,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4044 DAY), ' 12:19'), DATETIME),1,-69);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (25667397,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1763 DAY), ' 05:35'), DATETIME),3,-97);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (47685796,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2107 DAY), ' 07:12'), DATETIME),5,267);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (87258666,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2696 DAY), ' 18:47'), DATETIME),5,91);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55533262,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2577 DAY), ' 20:11'), DATETIME),1,-183);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55376799,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2941 DAY), ' 23:33'), DATETIME),1,-53);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (77783442,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -221 DAY), ' 10:22'), DATETIME),4,-267);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (77568493,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -756 DAY), ' 16:46'), DATETIME),2,478);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (85923845,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2262 DAY), ' 13:00'), DATETIME),5,245);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (52378627,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -407 DAY), ' 12:01'), DATETIME),5,500);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (32894464,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3527 DAY), ' 09:08'), DATETIME),1,-415.50);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (23995326,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1415 DAY), ' 10:10'), DATETIME),1,-428);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (38256324,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3598 DAY), ' 14:32'), DATETIME),2,334);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (24843697,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2881 DAY), ' 17:50'), DATETIME),5,125);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (63325847,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3696 DAY), ' 03:34'), DATETIME),4,-279);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (25667397,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -637 DAY), ' 02:44'), DATETIME),2,387);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (47685796,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1201 DAY), ' 12:05'), DATETIME),4,-75);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (87258666,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2116 DAY), ' 01:47'), DATETIME),5,234);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55533262,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1773 DAY), ' 15:18'), DATETIME),2,269);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55376799,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1972 DAY), ' 00:08'), DATETIME),2,109);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (85923845,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1900 DAY), ' 05:22'), DATETIME),5,327);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (32894464,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2700 DAY), ' 11:24'), DATETIME),1,-159);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (23995326,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -218 DAY), ' 16:32'), DATETIME),1,-57);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (38256324,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2539 DAY), ' 09:00'), DATETIME),3,-42);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (24843697,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3445 DAY), ' 07:36'), DATETIME),4,-299.30);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (63325847,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2623 DAY), ' 08:12'), DATETIME),3,-39);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (47685796,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -141 DAY), ' 10:17'), DATETIME),3,-113);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (87258666,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1760 DAY), ' 13:49'), DATETIME),2,256);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55533262,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -842 DAY), ' 20:14'), DATETIME),2,439);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55376799,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1018 DAY), ' 11:23'), DATETIME),2,85);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (85923845,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2131 DAY), ' 09:00'), DATETIME),3,-494.45);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (32894464,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1821 DAY), ' 14:00'), DATETIME),2,311);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (38256324,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1483 DAY), ' 01:18'), DATETIME),3,-8);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (24843697,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -644 DAY), ' 04:55'), DATETIME),1,-119);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55533262,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -172 DAY), ' 11:36'), DATETIME),1,-30);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55376799,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -305 DAY), ' 15:00'), DATETIME),5,471);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (32894464,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -901 DAY), ' 21:48'), DATETIME),3,-342.30);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (38256324,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -740 DAY), ' 13:33'), DATETIME),3,-82);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (32894464,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -174 DAY), ' 00:21'), DATETIME),1,-50);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (38256324,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -181 DAY), ' 23:45'), DATETIME),2,200);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (38256324,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -50 DAY), ' 14:55'), DATETIME),1,-50);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (85923845,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1829 DAY), ' 16:12'), DATETIME),3,-3179);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (63325847,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2435 DAY), ' 02:34'), DATETIME),3,-804.99);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (22742922,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2085 DAY), ' 06:14'), DATETIME),3,-1250);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (52728686,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -35 DAY), ' 17:30'), DATETIME),3,-2370);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (38146185,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3652 DAY), ' 16:10'), DATETIME),5,5000);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (87258666,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1633 DAY), ' 10:15'), DATETIME),3,-563.55);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (77568493,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -322 DAY), ' 13:17'), DATETIME),2,950);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (77568493,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -282 DAY), ' 10:43'), DATETIME),2,1200);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (30177319,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4832 DAY), ' 09:50'), DATETIME),5,1000);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (30177319,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2876 DAY), ' 21:25'), DATETIME),1,-500);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (30177319,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1932 DAY), ' 11:35'), DATETIME),3,-500);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (22742922,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1954 DAY), ' 15:21'), DATETIME),2,394.58);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (22742922,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -932 DAY), ' 12:46'), DATETIME),2,24.50);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55533262,STR_TO_DATE(CONCAT(CONCAT(YEAR(NOW()) - 6,'1231'), ' 23:59:59'), "%Y%m%d %H:%i:%s"),2,130);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (55533262,STR_TO_DATE(CONCAT(CONCAT(YEAR(NOW()) - 5,'0101'), ' 00:00:00'), "%Y%m%d %H:%i:%s"),3,-130);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (38146185,CONVERT(CONCAT(DATE_FORMAT(NOW(),'%Y%m%d%H%i'), '00'), DATETIME),5,3500);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (65878125,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -212 DAY), ' 10:15'), DATETIME),2,1250);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (79144602,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3247 DAY), ' 09:10'), DATETIME),2,4750);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (79144602,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3238 DAY), ' 10:10'), DATETIME),4,-67.50);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (79144602,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3216 DAY), ' 09:10'), DATETIME),2,4750);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (79144602,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3207 DAY), ' 10:10'), DATETIME),4,-67.50);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (23995326,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -155 DAY), ' 11:34'), DATETIME),3,-1978);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (78338956,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1899 DAY), ' 16:13'), DATETIME),5,-1300);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (78338956,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1890 DAY), ' 16:13'), DATETIME),5,-9.23);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (66638210,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1482 DAY), ' 12:45'), DATETIME),5,850);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (66638210,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1411 DAY), ' 21:25'), DATETIME),1,-200);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (66638210,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1375 DAY), ' 18:03'), DATETIME),1,-650);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (39022548,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4683 DAY), ' 11:54'), DATETIME),2,8950);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (39022548,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4321 DAY), ' 10:10'), DATETIME),4,2370);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (39022548,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3277 DAY), ' 17:20'), DATETIME),4,-10000);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (10577680,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -5555 DAY), ' 13:52'), DATETIME),2,5000);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (10577680,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -5500 DAY), ' 15:28'), DATETIME),2,5000);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (10577680,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -4732 DAY), ' 10:41'), DATETIME),3,-3500);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (10577680,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -3448 DAY), ' 18:20'), DATETIME),3,-6500);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (43199052,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2811 DAY), ' 15:44'), DATETIME),5,3120);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (43199052,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2427 DAY), ' 08:50'), DATETIME),5,1785);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (43199052,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -2042 DAY), ' 14:30'), DATETIME),5,8125);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (43199052,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1855 DAY), ' 09:00'), DATETIME),4,-228);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (43199052,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1825 DAY), ' 09:00'), DATETIME),4,-228);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (43199052,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -1795 DAY), ' 09:00'), DATETIME),4,-228);
INSERT INTO transactions (account_id, transaction_time, transaction_type, amount) VALUES (43199052,CONVERT(CONCAT(DATE_ADD(CURDATE(), INTERVAL -544 DAY), ' 13:07'), DATETIME),3,-12346);


COMMIT;