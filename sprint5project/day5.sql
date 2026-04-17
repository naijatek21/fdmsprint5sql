USE bank;
#Q16	
	SELECT MAX(num_transactions) AS 'Maximum No. of Transactions from a Single Account'
	FROM(
		SELECT account_id ,COUNT(transaction_time) AS num_transactions
		FROM transactions
		GROUP BY account_id)t
	;
#Q17a
	SELECT MAX(average)
	FROM 
		(SELECT AVG(amount) AS average
		FROM transactions
		WHERE QUARTER(transaction_time) = 
		QUARTER(DATE_ADD(CURDATE(), INTERVAL -1 QUARTER)) 
		GROUP BY account_id
		) iv
	;
        
        /*
			The query returns the highest average amount transacted 
            under a single account in any year in the quarter previous to this current one
		*/
#Q17b
	SELECT MAX(average)
	FROM 
		(SELECT AVG(amount) AS average
		FROM transactions
		WHERE QUARTER(transaction_time) = 
			  QUARTER(DATE_ADD(CURDATE(), INTERVAL -1 QUARTER))
		 AND
			YEAR(transaction_time) = YEAR(DATE_ADD(CURDATE(), INTERVAL -1 QUARTER))
		GROUP BY account_id
		) iv
	;
            
#Q18a
	INSERT INTO transaction_types(transaction_type,transaction_description) 
		VALUES(6,'Interest Payment')
	;
#Q18b
	CREATE TABLE transactions_history LIKE transactions;
    INSERT INTO transactions_history (SELECT * 
									  FROM transactions
                                      WHERE DATE(transaction_time) < 
												DATE_FORMAT(DATE_ADD(CURDATE(),INTERVAL -5 YEAR),'%Y-01-01')
									 )
	;
	-- SELECT * FROM transactions_history ORDER BY transaction_time;
#Q19a
	SET SQL_SAFE_UPDATES = 0; 
	UPDATE customers
    SET house_number = 153,
		street = 'North Street',
        city = 'Glasgow',
        postcode = 'G3 7DA'
	WHERE
		customer_id = 16
	;
#Q19b
	SET SQL_SAFE_UPDATES = 0; 
	UPDATE accounts
    SET date_closed = CURDATE()
    WHERE account_id IN (SELECT account_id
						 FROM transactions
                         GROUP BY account_id
						 HAVING SUM(amount) = 0 OR
							    YEAR(MAX(transaction_time)) < YEAR(DATE_ADD(CURDATE(),INTERVAL -5 YEAR))
						)
		  AND date_closed IS NULL
	;

	-- ROLLBACK;
	/*	
	  SELECT a.account_id,a.date_opened,a.date_closed,tv.last_transaction,tv.balance
	    FROM 
	 		accounts a
	 	INNER JOIN
	 		 (SELECT account_id, MAX(transaction_time) AS last_transaction, SUM(amount) AS balance
			  FROM transactions
	 		  GROUP BY account_id)tv
	 	  ON a.account_id = tv.account_id
	 	ORDER BY last_transaction;
		
	*/	
	-- SELECT * FROM branches;
#Q20a
	DELETE FROM branches
    WHERE house_number = 38
	  AND street = 'Stoke Newington High Street'
      AND city = 'London'
	;
#Q20b
	DELETE FROM customers
		WHERE
        customer_id NOT IN (SELECT customer_id
							FROM accounts)
	;
    
    -- SELECT customer_id FROM customers
-- 		WHERE  customer_id NOT IN (SELECT customer_id
-- 							FROM accounts);
-- SELECT * FROM customers;
