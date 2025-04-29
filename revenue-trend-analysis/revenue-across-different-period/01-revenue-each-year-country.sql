/* Calculate revenue for each year for all orders shipped to USA*/

SELECT
	DATE_TRUNC('year', order_date) AS revenue_year,
  	SUM(amount) AS total_revenue_usa
FROM orders
WHERE ship_country = 'USA'
GROUP BY revenue_year;


| revenue_year           | total_revenue_usa |
| ---------------------- | ----------------- |
| 2016-01-01 00:00:00+00 | 38105.68          |
| 2017-01-01 00:00:00+00 | 114845.29         |
| 2018-01-01 00:00:00+00 | 44083.02          |
| 2021-01-01 00:00:00+00 | 456.00            |
| 2022-01-01 00:00:00+00 | 4859.75           |
| 2023-01-01 00:00:00+00 | 11559.59          |
| 2024-01-01 00:00:00+00 | 24650.45          |
| 2025-01-01 00:00:00+00 | 7024.87           |