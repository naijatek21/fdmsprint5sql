USE bank;

--Question 1
SELECT customer_name, CONCAT(house_number ,' ',street,', ',city ,', ', postcode) AS full_address
  FROM customers
  WHERE city = 'London' and postcode LIKE 'N%' and postcode NOT LIKE 'NW%';
  ORDER BY customer_name ASC
--Question 2

SELECT account_id, date_opened
FROM accounts
WHERE date_opened >= CURDATE() - INTERVAL 10 YEAR AND date_closed = NULL
ORDER BY date_opened DESC


--Question 3
/*
Gets all the accounts that were either opened or closed within the last year.

*/


