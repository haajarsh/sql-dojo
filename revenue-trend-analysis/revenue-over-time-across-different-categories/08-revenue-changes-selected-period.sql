/* Calculate revenue changes for selected period - year 2017- show revenue first quarter of 2017 and the revenue changes in the next 3 quarters in 2017.*/

SELECT
  category_name,
  SUM(oi.amount) AS overall_category_revenue_2017,
  SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 1 THEN oi.amount ELSE 0.0 END) AS revenue_2017_Q1,
  SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 2 THEN oi.amount ELSE 0.0 END) - 
  SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 1 THEN oi.amount ELSE 0.0 END) AS change_Q2,
  SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 3 THEN oi.amount ELSE 0.0 END) - 
  SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 2 THEN oi.amount ELSE 0.0 END) AS change_Q3,
  SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 4 THEN oi.amount ELSE 0.0 END) - 
  SUM(CASE WHEN EXTRACT(quarter FROM order_date) = 3 THEN oi.amount ELSE 0.0 END) AS change_Q4
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

| category_name  | overall_category_revenue_2017 | revenue_2017_q1 | change_q2 | change_q3 | change_q4 |
| -------------- | ----------------------------- | --------------- | --------- | --------- | --------- |
| Beverages      | 103924.32                     | 35386.88        | -9404.85  | -6529.17  | 3649.69   |
| Condiments     | 55368.63                      | 13026.08        | -173.38   | 462.35    | 2859.75   |
| Confections    | 82657.78                      | 19316.93        | 2086.40   | -1126.50  | 1383.86   |
| Dairy Products | 115387.66                     | 24380.14        | 286.84    | 5967.23   | 5072.12   |
| Grains/Cereals | 56871.83                      | 12409.10        | 2748.40   | 87.03     | -1183.83  |
| Meat/Poultry   | 80975.12                      | 17402.35        | -2469.90  | 5708.06   | 7359.30   |
| Produce        | 54940.77                      | 9061.32         | 5755.84   | -6055.88  | 13539.73  |
| Seafood        | 66959.24                      | 7306.15         | 6058.77   | 12247.64  | -4936.95  |