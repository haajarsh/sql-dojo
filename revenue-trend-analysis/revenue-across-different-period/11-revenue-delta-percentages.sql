/*Calculate revenue delta as percentages */

SELECT
  DATE_TRUNC('quarter', order_date) AS revenue_quarter, 
  SUM(amount) AS total_revenue,
  ROUND(100.0 * 
  	(SUM(amount) - LAG(SUM(amount), 1) 
		OVER (ORDER BY DATE_TRUNC('quarter', order_date))) 
  		/ (LAG(SUM(amount), 1) 
  		OVER (ORDER BY DATE_TRUNC('quarter', order_date))),3) AS delta
FROM orders
GROUP BY DATE_TRUNC('quarter', order_date)
ORDER BY DATE_TRUNC('quarter', order_date);

| revenue_quarter        | total_revenue | delta   |
| ---------------------- | ------------- | ------- |
| 2016-07-01 00:00:00+00 | 79728.58      | null    |
| 2016-10-01 00:00:00+00 | 128355.41     | 60.990  |
| 2017-01-01 00:00:00+00 | 138288.95     | 7.739   |
| 2017-04-01 00:00:00+00 | 143177.07     | 3.535   |
| 2017-07-01 00:00:00+00 | 153937.83     | 7.516   |
| 2017-10-01 00:00:00+00 | 181681.50     | 18.023  |
| 2018-01-01 00:00:00+00 | 193637.42     | 6.581   |
| 2021-04-01 00:00:00+00 | 6004.69       | -96.899 |
| 2021-07-01 00:00:00+00 | 7941.80       | 32.260  |
| 2021-10-01 00:00:00+00 | 5728.73       | -27.866 |
| 2022-01-01 00:00:00+00 | 11689.96      | 104.058 |
| 2022-04-01 00:00:00+00 | 14145.01      | 21.001  |
| 2022-07-01 00:00:00+00 | 8396.10       | -40.643 |
| 2022-10-01 00:00:00+00 | 8440.22       | 0.525   |
| 2023-01-01 00:00:00+00 | 28033.25      | 232.139 |
| 2023-04-01 00:00:00+00 | 28720.82      | 2.453   |
| 2023-07-01 00:00:00+00 | 10789.87      | -62.432 |
| 2023-10-01 00:00:00+00 | 22378.13      | 107.399 |
| 2024-01-01 00:00:00+00 | 13183.45      | -41.088 |
| 2024-04-01 00:00:00+00 | 35514.28      | 169.385 |
| 2024-07-01 00:00:00+00 | 11141.13      | -68.629 |
| 2024-10-01 00:00:00+00 | 11324.10      | 1.642   |
| 2025-01-01 00:00:00+00 | 12783.85      | 12.891  |
| 2025-04-01 00:00:00+00 | 10771.14      | -15.744 |