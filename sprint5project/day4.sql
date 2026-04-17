USE bank;
#Q12
	SELECT a.account_id, SUM(t.amount) AS `Total Cash Deposits`
	FROM
		accounts a
	LEFT OUTER JOIN
		transactions t
	ON
		a.account_id = t.account_id
	INNER JOIN
		transaction_types ty
	ON 
		t.transaction_type = ty.transaction_type
	WHERE
		transaction_description = 'Cash deposit' 
	GROUP BY
		a.account_id
	HAVING
		`Total Cash Deposits` > 3000
	ORDER BY
		`Total Cash Deposits` DESC	
	;

#Q13
	SELECT t1.account_id,
           t1.transaction_time AS `Date/Time of Largest Transaction`
	FROM
		transactions t1
	WHERE
		t1.amount = (SELECT MAX(amount)
					 FROM transactions t2
                     WHERE t2.account_id = t1.account_id
					)
	ORDER BY t1.account_id;
    
#Q14
	SELECT account_id
	FROM transactions
	WHERE transaction_time >= DATE_ADD(NOW(), INTERVAL -365 DAY)
	GROUP BY account_id
	HAVING AVG(amount) > 1000;
    /*
		The query returns a list of all the account_id for accounts who conducted transactions 
			of an average amount greater than 1000 oover the last year at the time of query executuion
    */

#Q15
	SELECT a1.branch_id,
		a1.customer_id,
		a1.date_opened
	FROM accounts a1
	WHERE a1.date_opened = (SELECT MAX(a2.date_opened)
							FROM accounts a2
							WHERE a2.branch_id = a1.branch_id
							);
	/*
		Query returns the customer_ids of the bank customers 
			who opened the most recent account at each branch
            and the date that they opened that account

	*/
