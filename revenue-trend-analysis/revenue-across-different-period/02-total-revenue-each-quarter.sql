/* Calculate total revenue for each quarter in 2017*/

SELECT 
	DATE_TRUNC('quarter', order_date) AS quarter_in_2017,
  	SUM(amount) AS total_revenue
FROM orders
WHERE order_date >= '2017-01-01' AND order_date < '2018-01-01'
GROUP BY quarter_in_2017
ORDER BY quarter_in_2017;


| quarter_in_2017        | total_revenue |
| ---------------------- | ------------- |
| 2017-01-01 00:00:00+00 | 138288.95     |
| 2017-04-01 00:00:00+00 | 143177.07     |
| 2017-07-01 00:00:00+00 | 153937.83     |
| 2017-10-01 00:00:00+00 | 181681.50     |