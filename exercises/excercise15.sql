USE trading_platform;
-- SHOW TABLES;
-- DESCRIBE brokers;
-- SELECT * FROM shares;

#Q1
	SELECT 
		broker_id, ROUND(AVG(share_amount),0) AS `Average Share Amount`
    FROM 
		trades
	GROUP BY
		broker_id;
    
-- SELECT broker_id FROM brokers WHERE broker_id IN (SELECT broker_id FROM trades);

#Q2
	SELECT 
		MIN(`Average Share Amount`) AS `Lowest Average Share Amount`
    FROM
		(
			SELECT broker_id, ROUND(AVG(share_amount),0) AS `Average Share Amount`
			FROM 
				trades
			GROUP BY
				broker_id
        )tv
    ;
    
#Q3
	SELECT 
			CONCAT(b.first_name,' ', b.last_name) AS `Broker Name`, 
			IFNULL(`Average Share Amount`,0) AS `Average Share Amount`
    FROM 
		brokers b
	  LEFT OUTER JOIN
		(
			SELECT broker_id, ROUND(AVG(share_amount),0) AS `Average Share Amount`
			FROM 
				trades
			GROUP BY
				broker_id
        )tv
	 ON
		b.broker_id = tv.broker_id
	;
    
#Q4
	SELECT 
		share_id ,
		COUNT(trade_id) as num_trades
    FROM 
		trades
    GROUP BY 
		share_id
	;
    
#Q5 
	SELECT
		MAX(num_trades)
	FROM
		(SELECT share_id ,COUNT(trade_id) as num_trades
		 FROM 
			trades
		 GROUP BY 
			share_id
		) tv
	;
    
#Q6
	SELECT c.currency_id, IFNULL(shares_priced,0) AS `No. Shares Priced With`
    FROM
		currencies c
	 LEFT OUTER JOIN
		(SELECT currency_id,COUNT(share_id) AS shares_priced
		 FROM shares
		 GROUP BY
			currency_id
		)tv
	 ON
		c.currency_id = tv.currency_id
    ;

#Q7
	SELECT
		CONCAT(b.first_name,' ', b.last_name) AS `Broker With Highest Average Share Amount`,
    FROM
		trades t
	 INNER JOIN
		brokers b
	 ON 
		t.broker_id = b.broker_id
	GROUP BY 
		t.broker_id,
        CONCAT(b.first_name,' ', b.last_name)
	HAVING ROUND(AVG(t.share_amount),0)=(SELECT MAX(avg_share)
											FROM(
													SELECT broker_id, ROUND(AVG(share_amount),0) AS avg_share
													FROM trades
													GROUP BY broker_id
												 )tv
										)
	;