/* Calculate the category revenue for each quarter in year 2017. */

SELECT
  category_name,
  SUM(oi.amount) AS overall_category_revenue,
  SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 1 THEN oi.amount ELSE 0.0 END) AS revenue_Q1,
  SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 2 THEN oi.amount ELSE 0.0 END) AS revenue_Q2,
  SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 3 THEN oi.amount ELSE 0.0 END) AS revenue_Q3,
  SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 4 THEN oi.amount ELSE 0.0 END) AS revenue_Q4
FROM order_items oi 
JOIN orders o
  ON oi.order_id = o.order_id
JOIN products p
  ON p.product_id = oi.product_id
JOIN categories c
  ON c.category_id = p.category_id
WHERE order_date >= '2017-01-01'
  AND order_date < '2018-01-01'
GROUP BY
  c.category_id,
  category_name;


| category_name  | overall_category_revenue | revenue_q1 | revenue_q2 | revenue_q3 | revenue_q4 |
| -------------- | ------------------------ | ---------- | ---------- | ---------- | ---------- |
| Beverages      | 103924.32                | 35386.88   | 25982.03   | 19452.86   | 23102.55   |
| Condiments     | 55368.63                 | 13026.08   | 12852.70   | 13315.05   | 16174.80   |
| Confections    | 82657.78                 | 19316.93   | 21403.33   | 20276.83   | 21660.69   |
| Dairy Products | 115387.66                | 24380.14   | 24666.98   | 30634.21   | 35706.33   |
| Grains/Cereals | 56871.83                 | 12409.10   | 15157.50   | 15244.53   | 14060.70   |
| Meat/Poultry   | 80975.12                 | 17402.35   | 14932.45   | 20640.51   | 27999.81   |
| Produce        | 54940.77                 | 9061.32    | 14817.16   | 8761.28    | 22301.01   |
| Seafood        | 66959.24                 | 7306.15    | 13364.92   | 25612.56   | 20675.61   |


/*Compare the category revenues for orders placed in December 2016 and December 2017. */

SELECT
  category_name,
  SUM(CASE WHEN order_date >= '2016-12-01' AND order_date < '2017-01-01' THEN oi.amount ELSE 0.0 END) AS december_2016,
  SUM(CASE WHEN order_date >= '2017-12-01' AND order_date < '2018-01-01' THEN oi.amount ELSE 0.0 END) AS december_2017
FROM order_items oi 
JOIN orders o
  ON oi.order_id = o.order_id
JOIN products p
  ON p.product_id = oi.product_id
JOIN categories c
  ON c.category_id = p.category_id
GROUP BY
  c.category_id,
  category_name;

| category_name  | december_2016 | december_2017 |
| -------------- | ------------- | ------------- |
| Dairy Products | 10952.66      | 9844.85       |
| Meat/Poultry   | 8956.80       | 12767.17      |
| Condiments     | 1497.44       | 5824.20       |
| Confections    | 5872.65       | 8778.15       |
| Grains/Cereals | 2194.00       | 5242.35       |
| Produce        | 3190.82       | 12157.90      |
| Beverages      | 9431.80       | 10876.65      |
| Seafood        | 3143.46       | 5907.18       |