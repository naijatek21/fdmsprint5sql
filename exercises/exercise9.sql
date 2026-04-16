USE trading_platform;
#Q1
	SELECT broker_id, AVG(price_total) AS `Average Price Total`
	FROM trades
	GROUP BY broker_id
	;

#Q2
	
    SELECT se.stock_ex_id , IFNULL(MIN(t.transaction_time),'NONE') AS `Earliest Trade`
    FROM
		stock_exchanges se
	LEFT OUTER JOIN
		trades t 
	ON se.stock_ex_id = t.stock_ex_id
    GROUP BY se.stock_ex_id;
		
#Q3
	SELECT c.currency_id , COUNT(s.share_id) AS `Shares Priced In`
    FROM
		currencies c
	LEFT OUTER JOIN
		shares s
	ON
		c.currency_id = s.currency_id
    GROUP BY
		c.currency_id
	;
    
#Q4
	SELECT share_id , SUM(share_amount) AS `Total Share Amount`
    FROM trades 
    GROUP BY
		share_id
	;