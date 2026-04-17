USE bank;
#Q16	
		SELECT MAX(num_transactions) AS 'Maximum No. of Transactions from a Single Account'
        FROM(
		 SELECT account_id ,COUNT(transaction_time) AS num_transactions
		 FROM transactions
         GROUP BY account_id)t;