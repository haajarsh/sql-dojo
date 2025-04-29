/*Calculate number of orders by each quarter and year. */

SELECT
	DATE_TRUNC('year', order_date) AS year,
  	COUNT(CASE WHEN EXTRACT(quarter FROM order_date) = 1 THEN amount END) AS Q1,
  	COUNT(CASE WHEN EXTRACT(quarter FROM order_date) = 2 THEN amount END) AS Q2,
  	COUNT(CASE WHEN EXTRACT(quarter FROM order_date) = 3 THEN amount END) AS Q3,
  	COUNT(CASE WHEN EXTRACT(quarter FROM order_date) = 4 THEN amount END) AS Q4
FROM orders
GROUP BY DATE_TRUNC('year', order_date)
ORDER BY DATE_TRUNC('year', order_date);

| year                   | q1  | q2  | q3  | q4  |
| ---------------------- | --- | --- | --- | --- |
| 2016-01-01 00:00:00+00 | 0   | 0   | 70  | 82  |
| 2017-01-01 00:00:00+00 | 92  | 93  | 103 | 120 |
| 2018-01-01 00:00:00+00 | 109 | 0   | 0   | 0   |
| 2021-01-01 00:00:00+00 | 0   | 6   | 8   | 7   |
| 2022-01-01 00:00:00+00 | 9   | 8   | 8   | 9   |
| 2023-01-01 00:00:00+00 | 11  | 14  | 10  | 12  |
| 2024-01-01 00:00:00+00 | 8   | 11  | 11  | 9   |
| 2025-01-01 00:00:00+00 | 11  | 9   | 0   | 0   |