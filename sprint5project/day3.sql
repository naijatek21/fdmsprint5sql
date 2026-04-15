USE bank;

-- Question 4
SELECT 
	c.customer_id, 
    c.customer_name,
    IFNULL(a.account_id,' ') AS `Account No.`,
    IFNULL(t.transaction_time,' ') AS `Transaction Time`
FROM 
    customers c 

LEFT OUTER JOIN
		accounts a
ON 
        c.customer_id = a.customer_id
LEFT OUTER JOIN
		transactions t
ON
		a.account_id = t.account_id
ORDER BY
	c.customer_id,
    a.account_id,
    t.transaction_time DESC
;

--Question 5

SELECT 
	c.customer_id, 
    c.customer_name,
    IFNULL(a.account_id,' ') AS `Account No.`,
    IFNULL(t.transaction_time,' ') AS `Transaction Time`
FROM 
    customers c 

LEFT OUTER JOIN
		accounts a
ON 
        c.customer_id = a.customer_id
LEFT OUTER JOIN
		transactions t
ON
		a.account_id = t.account_id
WHERE
    t.transaction_time = (
							SELECT MIN(transaction_time) 
                            FROM transactions
                            )
;

-- Question 6
SELECT CONCAT('Earliest Account Opened on: ',DATE(MIN(date_opened))) AS `Bank Summary` FROM accounts
UNION ALL
SELECT CONCAT('Latest Account Opened on: ',DATE(MAX(date_opened))) FROM accounts
UNION ALL
SELECT CONCAT('Earliest Transaction Date: ', MIN(transaction_time)) FROM transactions
UNION ALL
SELECT CONCAT('Latest Transaction: ' , MAX(transaction_time)) FROM transactions
;

-- Question 7
SELECT account_id,SUM(amount) AS `Current Balance`
FROM 
	transactions
GROUP BY account_id
ORDER BY
	`Current Balance` ASC;


-- Question 8
SELECT DISTINCT customer_id , account_type, 
	COUNT(account_id) OVER (PARTITION BY customer_id,account_type) AS `No. of Accounts`
FROM 
	accounts 
ORDER BY 
	customer_id ASC,
    account_type DESC;
    
    SELECT * FROM account_types;








    -- Question 9
SELECT DISTINCT c.customer_id ,c.customer_name, ats.account_description, 
	COUNT(a.account_id) OVER (PARTITION BY a.customer_id,a.account_type) AS `No. of Accounts`
FROM 
	customers c
LEFT OUTER JOIN
	accounts a
ON
	c.customer_id = a.customer_id
INNER JOIN
	account_types ats
ON
	a.account_type = ats.account_type
ORDER BY 
	c.customer_name ASC,
    ats.account_description ASC;

--Question 10


 -- Question 10
 SELECT a.account_type, COUNT(a.account_id) OVER (PARTITION BY a.customer_id,a.account_type) AS `No. of Accounts`,
	COUNT(t.transaction_type) OVER (PARTITION BY t.account_id,t.transaction_type) AS `No. of Transactions`
    FROM
		accounts a
	INNER JOIN
		transactions t
	ON
		a.account_id = t.account_id
	ORDER BY	
		a.account_type,
        t.transaction_type
    ;
--Question 11

/*
SHows the number of unique account types each customer has in ascending customer id order 
and descending accountb type order
*/
	


