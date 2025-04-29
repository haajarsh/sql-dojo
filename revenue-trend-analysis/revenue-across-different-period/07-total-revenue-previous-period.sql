/* Calculate average order amount in 2016 for each month and previous month */

SELECT
  	DATE_TRUNC('month', order_date) AS calculation_month,
	AVG(amount) AS avg_order_amount,
  	LAG(AVG(amount), 1) OVER(ORDER BY DATE_TRUNC('month', order_date)) AS previous_month_avg_order_amount
FROM orders
WHERE order_date >= '2016-01-01' AND order_date < '2017-01-01'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);

| calculation_month      | avg_order_amount      | previous_month_avg_order_amount |
| ---------------------- | --------------------- | ------------------------------- |
| 2016-07-01 00:00:00+00 | 1266.4500000000000000 | null                            |
| 2016-08-01 00:00:00+00 | 1019.4112000000000000 | 1266.4500000000000000           |
| 2016-09-01 00:00:00+00 | 1147.0173913043478261 | 1019.4112000000000000           |
| 2016-10-01 00:00:00+00 | 1442.9126923076923077 | 1147.0173913043478261           |
| 2016-11-01 00:00:00+00 | 1824.0020000000000000 | 1442.9126923076923077           |
| 2016-12-01 00:00:00+00 | 1459.3429032258064516 | 1824.0020000000000000           |