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
