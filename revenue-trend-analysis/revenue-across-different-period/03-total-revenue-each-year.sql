/*Calculate total revenue for each year to USA.*/

SELECT 
	EXTRACT(year FROM order_date) AS revenue_year,
  	SUM(amount) AS total_revenue_usa
FROM orders
WHERE ship_country = 'USA'
GROUP BY EXTRACT(year FROM order_date);


| revenue_year | total_revenue_usa |
| ------------ | ----------------- |
| 2016         | 38105.68          |
| 2017         | 114845.29         |
| 2018         | 44083.02          |
| 2021         | 456.00            |
| 2022         | 4859.75           |
| 2023         | 11559.59          |
| 2024         | 24650.45          |
| 2025         | 7024.87           |