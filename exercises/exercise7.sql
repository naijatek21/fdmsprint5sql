USE trading_platform;
#Q1
	SELECT stock_ex_name
    FROM stock_exchanges
    WHERE stock_ex_id IN (SELECT stock_ex_id
						  FROM trades);
                          
                          
#Q2
	SELECT stock_ex_name
    FROM stock_exchanges
    WHERE stock_ex_id NOT IN (SELECT stock_ex_id
						  FROM trades);
#Q3
	SELECT city
    FROM places
	WHERE place_id IN (SELECT place_id
						   FROM stock_exchanges);
#Q4
	SELECT city
    FROM places
	WHERE place_id NOT IN (SELECT place_id
						   FROM stock_exchanges);