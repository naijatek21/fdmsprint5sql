USE trading_platform;
# SHOW tables;
# DESCRIBE companies;
# DESCRIBE places;
# DESCRIBE stock_exchanges;
# DESCRIBE trades;
# DESCRIBE shares;
# DESCRIBE currencies;
# DESCRIBE brokers;


# Q1
	SELECT c.company_name,p.city,p.country
	FROM
		companies c
	INNER JOIN
		places p
	ON
		c.place_id = p.place_id;

# Q2
	SELECT DISTINCT company_name,stock_ex_name
	FROM
		companies c
	INNER JOIN
		shares sh
	ON
		c.company_id= sh.company_id
	INNER JOIN
		trades t
	ON
		sh.share_id = t.share_id
	INNER JOIN
		stock_exchanges se
	ON
		t.stock_ex_id = se.stock_ex_id
	ORDER BY
		company_name,stock_ex_name;

# Q3
	SELECT s.share_id, cu.currency_name
    FROM 
		shares s
    INNER JOIN
		currencies cu
	ON
		s.currency_id = cu.currency_id;
        
        
# Q4
	SELECT cu.currency_name AS `Currency`, IFNULL(s.share_id,'None') AS `Share Used` 
    FROM 
		shares s
    RIGHT OUTER JOIN
		currencies cu
	ON
		s.currency_id = cu.currency_id;
# Q5
	SELECT cu.currency_name AS `Currency`
    FROM 
		shares s
    RIGHT OUTER JOIN
		currencies cu
	ON
		s.currency_id = cu.currency_id
	WHERE
		s.share_id is NULL;


# Q6
	SELECT DISTINCT company_name,currency_name AS `Currency Traded In`
	FROM
		companies c
	INNER JOIN
		shares sh
	ON
		c.company_id = sh.company_id
	INNER JOIN
		currencies cu
	ON
		sh.currency_id = cu.currency_id;

# Q7
	SELECT CONCAT(b.first_name,' ',b.last_name) AS `Broker Name` ,` se.stock_ex_name
    FROM
		brokers b
	INNER JOIN
		broker_stock_ex bs
	ON 
		b.broker_id = bs.broker_id
    INNER JOIN
		stock_exchanges se
	ON 
		bs.stock_ex_id = se.stock_ex_id;
