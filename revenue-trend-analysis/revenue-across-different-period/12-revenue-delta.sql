/* Calculate total revenue and delta percentages for each month in year 2017 for orders shipped to USA. */


SELECT
  DATE_TRUNC('month', order_date) AS revenue_month,
  SUM(amount) AS total_revenue,
  ROUND(100.0 *
  	(SUM(amount) - LAG(SUM(amount),1) OVER(ORDER BY DATE_TRUNC('month', order_date))) 
  	/ (LAG(SUM(amount),1) OVER(ORDER BY DATE_TRUNC('month', order_date))), 2) AS delta_percentage
FROM orders
WHERE order_date >= '2017-01-01' AND order_date < '2018-01-01'
	AND ship_country = 'USA'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);


| revenue_month          | total_revenue | delta_percentage |
| ---------------------- | ------------- | ---------------- |
| 2017-01-01 00:00:00+00 | 4456.00       | null             |
| 2017-02-01 00:00:00+00 | 8697.64       | 95.19            |
| 2017-03-01 00:00:00+00 | 12268.08      | 41.05            |
| 2017-04-01 00:00:00+00 | 6096.04       | -50.31           |
| 2017-05-01 00:00:00+00 | 1019.40       | -83.28           |
| 2017-06-01 00:00:00+00 | 6719.50       | 559.16           |
| 2017-07-01 00:00:00+00 | 25229.59      | 275.47           |
| 2017-08-01 00:00:00+00 | 2578.99       | -89.78           |
| 2017-09-01 00:00:00+00 | 15902.60      | 516.62           |
| 2017-10-01 00:00:00+00 | 19147.05      | 20.40            |
| 2017-11-01 00:00:00+00 | 9220.40       | -51.84           |
| 2017-12-01 00:00:00+00 | 3510.00       | -61.93           |