USE trading_platform;
SHOW tables;
DESCRIBE companies;
DESCRIBE places;
DESCRIBE stock_exchanges;
DESCRIBE trades;
DESCRIBE shares;
DESCRIBE currencies;
DESCRIBE brokers;

SELECT * FROM trades;

SELECT trade_id
FROM trades
WHERE broker_id = 1
;

SELECT trade_id
FROM trades
WHERE stock_ex_id = 3
;

#Q1
	SELECT trade_id
	FROM trades
	WHERE broker_id = 1
UNION
    SELECT trade_id
	FROM trades
	WHERE stock_ex_id = 3
;


#Q2
	SELECT DISTINCT trade_id
	FROM trades
	WHERE broker_id = 1 
    AND trade_id NOT IN (SELECT trade_id
						FROM trades
						WHERE stock_ex_id = 3)
;

#Q3
	SELECT DISTINCT trade_id
	FROM trades
	WHERE broker_id = 1 
    AND trade_id IN (SELECT trade_id
						FROM trades
						WHERE stock_ex_id = 3)
;
