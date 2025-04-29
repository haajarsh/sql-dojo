/* Calculate the count of orders placed in the current year and the count of orders placed in the previous year. */

SELECT
	DATE_TRUNC('year', order_date) AS order_year,
  	COUNT(order_id) AS order_count,
  	LAG(COUNT(order_id), 1) 
  		OVER(ORDER BY DATE_TRUNC('year', order_date)) AS previous_year_order_count
FROM orders
GROUP BY DATE_TRUNC('year', order_date)
ORDER BY DATE_TRUNC('year', order_date);


| order_year             | order_count | previous_year_order_count |
| ---------------------- | ----------- | ------------------------- |
| 2016-01-01 00:00:00+00 | 152         | null                      |
| 2017-01-01 00:00:00+00 | 408         | 152                       |
| 2018-01-01 00:00:00+00 | 109         | 408                       |
| 2021-01-01 00:00:00+00 | 21          | 109                       |
| 2022-01-01 00:00:00+00 | 34          | 21                        |
| 2023-01-01 00:00:00+00 | 47          | 34                        |
| 2024-01-01 00:00:00+00 | 39          | 47                        |
| 2025-01-01 00:00:00+00 | 20          | 39                        |