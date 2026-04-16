--Q1
    SELECT *
    FROM trades
    WHERE Date_FORMAT(transaction_time,'%Y%m') = DATE_FORMAT(CURDATE(),'%Y%m')
;


--Q2   
    SELECT *
    FROM trades
    WHERE DATE(transaction_time) > DATE_ADD(CURDATE(), INTERVAL -7 DAY)
;

--Q3
	SELECT *
	FROM trades
	WHERE 
	DATE(transaction_time) >= DATE_ADD(CURDATE(), INTERVAL -1 YEAR);

--Q4
	SELECT trade_id
	FROM trades
	WHERE DATE(transaction_time) >= DATE_FORMAT(CURDATE(),'%Y-01-01');

--Q5
	SELECT *
	FROM trades
	WHERE YEAR(transaction_time) = YEAR(DATE_ADD(CURDATE(), INTERVAL -1 YEAR));


--Q6
	SELECT *
	FROM trades
	WHERE QUARTER(transaction_time) = QUARTER(DATE_ADD(CURDATE(), INTERVAL -1 QUARTER))
		  AND YEAR(transaction_time) = YEAR(DATE_ADD(CURDATE(), INTERVAL -1 QUARTER));
      
--Q7
SELECT trade_id
FROM trades
WHERE 
DATE(transaction_time) > DATE_ADD(CURDATE(), INTERVAL -90 DAY)
AND price_total > 1000000;

--Q8
SELECT share_id,price,time_start,time_end, DATEDIFF(time_end,time_start)
FROM shares_prices;

-- SHOW tables;
-- DESCRIBE shares_prices;

       