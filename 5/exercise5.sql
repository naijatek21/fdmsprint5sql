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
