# Q1
    SELECT currency_name 
    FROM currencies;
    
    #Answer: US Dollar, Euro, AUS Dollar, British Pound, and Yen

#Q2
    SELECT * 
    FROM companies 
    WHERE place_id = 3;
    
    #Answer: New_York_Times, Google, and Toyota 

#Q3
    SELECT stock_ex_name, stock_ex_symbol
    FROM stock_exchanges
    WHERE stock_ex_name LIKE 'London%Stock%Exchange';
    
    #Answer: LSE

#Q4
    SELECT city, country 
    FROM places
    WHERE country = 'France'
    
    #Answer: Paris
#Q5
    SELECT first_name, last_name
    FROM brokers
    WHERE first_name = 'John';
    
    #Answer : Smith and Bush

#Q6
    SELECT broker_id, stock_ex_id 
    FROM broker_stock_ex
    WHERE stock_ex_id = 1;
    
    #Answer: 1,2,3,4,5,9,10,12

#Q7
    SELECT * 
    FROM companies
    WHERE company_id = 2
    
    #Answer : The New York Times 

#Q8
    SELECT * 
    FROM currencies
    WHERE currency_id = 1;

    #Answer : US Dollar

#Q9
    SELECT stock_ex_name
    FROM stock_exchanges
    WHERE stock_ex_symbol = 'TSE';
    
    #Answer: Tokyo Stock Exchange

#Q10
    SELECT last_name
    FROM brokers
    WHERE broker_id = 1;

    #Answer: Smith

#Q11
    SELECT trade_id, price_total
    FROM trades
    WHERE stock_ex_id = 3 AND share_amount > 20000;
    
    #Result : 5 trades with ids: 10,24,38,53,61

#Q12
    SELECT broker_id
    FROM broker_stock_ex
    WHERE stock_ex_id = 2
    ORDER BY broker_id ASC;

    #Result : 1,4,5,6,7,11,13,15

#Q13
    SELECT * 
    FROM currencies
    WHERE currency_name LIKE '%Dollar%';

    #Result: US Dollar, Australian Dollar

#Q14
    SELECT stock_ex_name,stock_ex_symbol
    FROM stock_exchanges
    WHERE stock_ex_symbol LIKE '%SE%'
    ORDER BY stock_ex_name DESC;

    /*Result:
	    Tokyo Stock Exchange
        New York Stock Exchange
        Moscow Stock Exchange
		London Stock Exchange
        
    */

#Q15
	SELECT DISTINCT share_id 
	FROM shares_prices
	WHERE price >= 400 AND price <= 500;
    #Result: 1 and 7
	
#Q16
	SELECT trade_id, (price_total/share_amount) AS Cost_Per_Share
    FROM trades;
    
