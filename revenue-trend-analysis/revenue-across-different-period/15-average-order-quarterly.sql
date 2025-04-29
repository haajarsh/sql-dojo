/* Calculate average order amount per quarter. */

SELECT
  DATE_TRUNC('year', order_date) AS year, 
  AVG(CASE WHEN EXTRACT(quarter FROM order_date) = 1 THEN amount END) AS Q1,
  AVG(CASE WHEN EXTRACT(quarter FROM order_date) = 2 THEN amount END) AS Q2,
  AVG(CASE WHEN EXTRACT(quarter FROM order_date) = 3 THEN amount END) AS Q3,
  AVG(CASE WHEN EXTRACT(quarter FROM order_date) = 4 THEN amount END) AS Q4
FROM orders
GROUP BY DATE_TRUNC('year', order_date)
ORDER BY DATE_TRUNC('year', order_date);


| year                   | q1                    | q2                    | q3                    | q4                    |
| ---------------------- | --------------------- | --------------------- | --------------------- | --------------------- |
| 2016-01-01 00:00:00+00 | null                  | null                  | 1138.9797142857142857 | 1565.3098780487804878 |
| 2017-01-01 00:00:00+00 | 1503.1407608695652174 | 1539.5383870967741935 | 1494.5420388349514563 | 1514.0125000000000000 |
| 2018-01-01 00:00:00+00 | 1776.4900917431192661 | null                  | null                  | null                  |
| 2021-01-01 00:00:00+00 | null                  | 1000.7816666666666667 | 992.7250000000000000  | 818.3900000000000000  |
| 2022-01-01 00:00:00+00 | 1298.8844444444444444 | 1768.1262500000000000 | 1049.5125000000000000 | 937.8022222222222222  |
| 2023-01-01 00:00:00+00 | 2548.4772727272727273 | 2051.4871428571428571 | 1078.9870000000000000 | 1864.8441666666666667 |
| 2024-01-01 00:00:00+00 | 1647.9312500000000000 | 3228.5709090909090909 | 1012.8300000000000000 | 1258.2333333333333333 |
| 2025-01-01 00:00:00+00 | 1162.1681818181818182 | 1196.7933333333333333 | null                  | null                  |