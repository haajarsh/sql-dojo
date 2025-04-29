/* Calculate the revenue changes by quarter in year 2017 for 'Produce' and 'Confections' categories.*/

SELECT 
  DATE_TRUNC('quarter', order_date) AS revenue_quarter,
  SUM(oi.amount) - LAG(SUM(oi.amount)) OVER (ORDER BY DATE_TRUNC('quarter', order_date)) AS total_revenue_delta, 
  SUM(CASE WHEN c.category_name='Produce' THEN oi.amount ELSE 0.0 END) - 
  LAG(SUM(CASE WHEN c.category_name='Produce' THEN oi.amount ELSE 0.0 END)) OVER(
    ORDER BY DATE_TRUNC('quarter', order_date)) AS produce_revenue_delta,
  SUM(CASE WHEN c.category_name='Confections' THEN oi.amount ELSE 0.0 END) - LAG(SUM(
    CASE WHEN c.category_name='Confections' THEN oi.amount ELSE 0.0 END)) OVER(
      ORDER BY DATE_TRUNC('quarter', order_date)) AS confections_revenue_delta 
FROM order_items oi 
JOIN orders o
  ON oi.order_id = o.order_id
JOIN products p
  ON p.product_id = oi.product_id
JOIN categories c
  ON c.category_id = p.category_id
WHERE order_date >= '2017-01-01'
  AND order_date < '2018-01-01' 
GROUP BY DATE_TRUNC('quarter', order_date)
ORDER BY DATE_TRUNC('quarter', order_date);


| revenue_quarter        | total_revenue_delta | produce_revenue_delta | confections_revenue_delta |
| ---------------------- | ------------------- | --------------------- | ------------------------- |
| 2017-01-01 00:00:00+00 | null                | null                  | null                      |
| 2017-04-01 00:00:00+00 | 4888.12             | 5755.84               | 2086.40                   |
| 2017-07-01 00:00:00+00 | 10760.76            | -6055.88              | -1126.50                  |
| 2017-10-01 00:00:00+00 | 27743.67            | 13539.73              | 1383.86                   |