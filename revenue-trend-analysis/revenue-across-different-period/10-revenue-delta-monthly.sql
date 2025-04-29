/*Calculate the total monthly revenue for each month of 2017, along with the revenue change as compared to the previous month. */

SELECT 
	DATE_TRUNC('month', order_date) AS revenue_month,
  	SUM(amount) AS total_revenue,
  	SUM(amount) - LAG(SUM(amount), 1) OVER(ORDER BY DATE_TRUNC('month', order_date)) AS delta
FROM orders
WHERE order_date >= '2017-01-01' AND order_date < '2018-01-01'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);


| revenue_month          | total_revenue | delta     |
| ---------------------- | ------------- | --------- |
| 2017-01-01 00:00:00+00 | 61258.08      | null      |
| 2017-02-01 00:00:00+00 | 38483.64      | -22774.44 |
| 2017-03-01 00:00:00+00 | 38547.23      | 63.59     |
| 2017-04-01 00:00:00+00 | 53032.95      | 14485.72  |
| 2017-05-01 00:00:00+00 | 53781.30      | 748.35    |
| 2017-06-01 00:00:00+00 | 36362.82      | -17418.48 |
| 2017-07-01 00:00:00+00 | 51020.88      | 14658.06  |
| 2017-08-01 00:00:00+00 | 47287.68      | -3733.20  |
| 2017-09-01 00:00:00+00 | 55629.27      | 8341.59   |
| 2017-10-01 00:00:00+00 | 66749.24      | 11119.97  |
| 2017-11-01 00:00:00+00 | 43533.81      | -23215.43 |
| 2017-12-01 00:00:00+00 | 71398.45      | 27864.64  |