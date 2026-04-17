USE trading_platform;
-- SHOW TABLES;
-- DESCRIBE brokers;
-- SELECT * FROM trades;

#Q1
	SELECT  
		t1.stock_ex_id,
		t1.transaction_time,
		t1.trade_id
	FROM
		trades t1
	WHERE
		t1.transaction_time = (SELECT MIN(t2.transaction_time)
							   FROM trades t2
							   WHERE t2.stock_ex_id = t1.stock_ex_id
							  )
	ORDER BY
		stock_ex_id
	;
    
#Q2
	SELECT
		t1.stock_ex_id,
        t1.price_total AS `Highest Price Total`,
        t1.broker_id
	FROM
		trades t1
	WHERE
		t1.price_total = ( SELECT MAX(t2.price_total)
						   FROM trades t2
                           WHERE t2.stock_ex_id = t1.stock_ex_id
						 )
	ORDER BY
		stock_ex_id
	;
    
#Q3
	SELECT  
			se.stock_ex_name as `Exchange Name`,
			t1.transaction_time,
			t1.trade_id
		FROM
			trades t1
		 INNER JOIN
			stock_exchanges se
		ON
			se.stock_ex_id = t1.stock_ex_id
		WHERE
			t1.transaction_time = (SELECT MIN(t2.transaction_time)
								   FROM trades t2
								   WHERE t2.stock_ex_id = t1.stock_ex_id
							  )
	;

#Q4
	SELECT
		se.stock_ex_name as `Exchange Name`,
        t1.price_total AS `Highest Price Total`,
        t1.broker_id
	FROM
			trades t1
		 INNER JOIN
			stock_exchanges se
		ON
			se.stock_ex_id = t1.stock_ex_id
	WHERE
		t1.price_total = ( SELECT MAX(t2.price_total)
						   FROM trades t2
                           WHERE t2.stock_ex_id = t1.stock_ex_id
						 )
	;
    
    
#Q5
	SELECT
        MONTH(t1.transaction_time) as `Month`,
		t1.broker_id,
        t1.share_amount
	FROM
		trades t1
	WHERE
		t1.share_amount=(SELECT MIN(t2.share_amount)
						 FROM trades t2
                         WHERE MONTH(t2.transaction_time)= MONTH(t1.transaction_time)
							
						)
	ORDER BY
		`MONTH`
	;
        
#Q6
	SELECT
        MONTH(t1.transaction_time) as `Month`,
		CONCAT(b.first_name,' ' , b.last_name) AS `Broker Name`,
        t1.share_amount
	FROM
		trades t1
	 INNER JOIN
		brokers b
	  ON
      b.broker_id = t1.broker_id
	WHERE
		t1.share_amount=(SELECT MIN(t2.share_amount)
						 FROM trades t2
                         WHERE MONTH(t2.transaction_time)= MONTH(t1.transaction_time)
							
						)
	ORDER BY
		`MONTH`
	;