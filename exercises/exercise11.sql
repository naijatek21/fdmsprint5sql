USE trading_platform;
#Q1
	SELECT broker_id, AVG(price_total) AS `Average Price Total`
	FROM trades
	GROUP BY broker_id
    HAVING `Average Price Total` > 3000000
	;

#Q2
    SELECT se.stock_ex_id 
    FROM
		stock_exchanges se
	LEFT OUTER JOIN
		trades t 
	ON se.stock_ex_id = t.stock_ex_id
    GROUP BY se.stock_ex_id
    HAVING DATE(MIN(t.transaction_time)) > DATE_ADD(CURDATE(), INTERVAL -365 DAY)
    ;
		
#Q3
	SELECT c.currency_id 
    FROM
		currencies c
	LEFT OUTER JOIN
		shares s
	ON
		c.currency_id = s.currency_id
    GROUP BY
		c.currency_id
	HAVING
		COUNT(s.share_id) >= 4
	;
    
#Q4
	SELECT share_id 
    FROM trades 
    GROUP BY
		share_id
	HAVING  SUM(share_amount) > 100000
	;
    

#Q5
	SELECT p.place_id
	FROM
		places p 
	INNER JOIN
		companies c
	ON
		p.place_id = c.place_id
	GROUP BY p.place_id
    HAVING COUNT(c.company_id) > 2
	;
    
#Q6
	SELECT share_id
    FROM
		trades
	GROUP BY 
		share_id
	HAVING MAX(price_total) > 1000000
;

#Q7
	SELECT share_id
    FROM
		trades
	WHERE  broker_id =1
	GROUP BY 
		share_id
	HAVING COUNT(trade_id) > 2
;

#Q8
	SELECT share_id
    FROM
		trades
	WHERE price_total > 1000000
	GROUP BY 
		share_id
	HAVING COUNT(trade_id) > 5
;
