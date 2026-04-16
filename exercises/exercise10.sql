USE trading_platform;
#Q1
	SELECT stock_ex_id
    FROM trades
    WHERE transaction_time = (SELECT MAX(transaction_time)
							  FROM trades)
;
                          
#Q2
	SELECT broker_id
    FROM trades
    WHERE trade_id = (SELECT MAX(trade_id)
					  FROM trades)
;
#Q3
	SELECT trade_id
    FROM trades
	WHERE share_amount > (SELECT AVG(share_amount)
						  FROM trades)
	;