

SELECT
  EXTRACT(year FROM order_date) AS revenue_year, 
  EXTRACT(quarter FROM order_date) AS revenue_quarter, 
  SUM(amount) AS total_revenue 
FROM orders
GROUP BY ROLLUP(
  EXTRACT(year FROM order_date),
  EXTRACT(quarter FROM order_date)
)
ORDER BY
  EXTRACT(year FROM order_date), 
  EXTRACT(quarter FROM order_date);


| revenue_year | revenue_quarter | total_revenue |
| ------------ | --------------- | ------------- |
| 2016         | 3               | 79728.58      |
| 2016         | 4               | 128355.41     |
| 2016         | null            | 208083.99     |
| 2017         | 1               | 138288.95     |
| 2017         | 2               | 143177.07     |
| 2017         | 3               | 153937.83     |
| 2017         | 4               | 181681.50     |
| 2017         | null            | 617085.35     |
| 2018         | 1               | 193637.42     |
| 2018         | null            | 193637.42     |
| 2021         | 2               | 6004.69       |
| 2021         | 3               | 7941.80       |
| 2021         | 4               | 5728.73       |
| 2021         | null            | 19675.22      |
| 2022         | 1               | 11689.96      |
| 2022         | 2               | 14145.01      |
| 2022         | 3               | 8396.10       |
| 2022         | 4               | 8440.22       |
| 2022         | null            | 42671.29      |
| 2023         | 1               | 28033.25      |
| 2023         | 2               | 28720.82      |
| 2023         | 3               | 10789.87      |
| 2023         | 4               | 22378.13      |
| 2023         | null            | 89922.07      |
| 2024         | 1               | 13183.45      |
| 2024         | 2               | 35514.28      |
| 2024         | 3               | 11141.13      |
| 2024         | 4               | 11324.10      |
| 2024         | null            | 71162.96      |
| 2025         | 1               | 12783.85      |
| 2025         | 2               | 10771.14      |
| 2025         | null            | 23554.99      |
| null         | null            | 1265793.29    |