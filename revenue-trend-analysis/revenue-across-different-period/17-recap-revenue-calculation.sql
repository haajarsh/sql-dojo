-- Calculate average order value for each month in year 2017.

SELECT 
	DATE_TRUNC('month', order_date) AS revenue_month,
  	AVG(amount) AS avg_order_value
FROM orders
WHERE order_date >= '2017-01-01' AND order_date < '2018-01-01'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);


| revenue_month          | avg_order_value       |
| ---------------------- | --------------------- |
| 2017-01-01 00:00:00+00 | 1856.3054545454545455 |
| 2017-02-01 00:00:00+00 | 1327.0220689655172414 |
| 2017-03-01 00:00:00+00 | 1284.9076666666666667 |
| 2017-04-01 00:00:00+00 | 1710.7403225806451613 |
| 2017-05-01 00:00:00+00 | 1680.6656250000000000 |
| 2017-06-01 00:00:00+00 | 1212.0940000000000000 |
| 2017-07-01 00:00:00+00 | 1546.0872727272727273 |
| 2017-08-01 00:00:00+00 | 1432.9600000000000000 |
| 2017-09-01 00:00:00+00 | 1503.4937837837837838 |
| 2017-10-01 00:00:00+00 | 1756.5589473684210526 |
| 2017-11-01 00:00:00+00 | 1280.4061764705882353 |
| 2017-12-01 00:00:00+00 | 1487.4677083333333333 |


-- Calculate total revenue and delta for each month in the first half of 2017.

SELECT
  DATE_TRUNC('month', order_date) AS revenue_month,
  SUM(amount) AS total_revenue,
  SUM(amount) - LAG(SUM(amount), 1) OVER(ORDER BY DATE_TRUNC('month', order_date)) AS delta
FROM orders
WHERE order_date >= '2017-01-01' AND order_date < '2017-07-01'
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

-- Calculate total revenue for each quarter in the year 2017 where ship_country is Germany.

SELECT
	DATE_TRUNC('year', order_date) AS year,
  	SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 1 THEN amount ELSE 0 END) AS Q1,
  	SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 2 THEN amount ELSE 0 END) AS Q2,
  	SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 3 THEN amount ELSE 0 END) AS Q3,
  	SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 4 THEN amount ELSE 0 END) AS Q4
FROM orders
WHERE ship_country = 'Germany'
GROUP BY DATE_TRUNC('year', order_date)
ORDER BY DATE_TRUNC('year', order_date);

| year                   | q1       | q2       | q3       | q4       |
| ---------------------- | -------- | -------- | -------- | -------- |
| 2016-01-01 00:00:00+00 | 0        | 0        | 18975.67 | 16431.48 |
| 2017-01-01 00:00:00+00 | 11929.90 | 42017.24 | 23575.25 | 39797.81 |
| 2018-01-01 00:00:00+00 | 44599.09 | 0        | 0        | 0        |
| 2021-01-01 00:00:00+00 | 0        | 0        | 1174.75  | 500.00   |
| 2022-01-01 00:00:00+00 | 2976.88  | 471.20   | 4261.00  | 910.40   |
| 2023-01-01 00:00:00+00 | 0        | 2856.00  | 1197.95  | 3758.80  |
| 2024-01-01 00:00:00+00 | 6938.64  | 3852.00  | 1485.80  | 0        |
| 2025-01-01 00:00:00+00 | 944.85   | 1629.98  | 0        | 0        |