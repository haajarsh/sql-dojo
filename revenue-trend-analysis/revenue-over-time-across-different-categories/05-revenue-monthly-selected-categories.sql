/* Calculate total revenue, and revenue for 'Dairy Products' and 'Seafood' categories in each month in 2017.*/

SELECT 
  DATE_TRUNC('month', order_date) AS revenue_month,
  SUM(oi.amount) AS total_revenue, 
  SUM(CASE
    WHEN c.category_name = 'Dairy Products'
      THEN oi.amount
    ELSE 0.0
  END) AS dairy_revenue,
  SUM(CASE
    WHEN c.category_name = 'Seafood'
      THEN oi.amount
    ELSE 0.0
  END) AS seafood_revenue 
FROM order_items oi 
JOIN orders o
  ON oi.order_id = o.order_id
JOIN products p
  ON p.product_id = oi.product_id
JOIN categories c
  ON c.category_id = p.category_id
WHERE order_date >= '2017-01-01'
  AND order_date < '2018-01-01'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);

| revenue_month          | total_revenue | dairy_revenue | seafood_revenue |
| ---------------------- | ------------- | ------------- | --------------- |
| 2017-01-01 00:00:00+00 | 61258.08      | 9066.40       | 1811.75         |
| 2017-02-01 00:00:00+00 | 38483.64      | 5584.84       | 2010.90         |
| 2017-03-01 00:00:00+00 | 38547.23      | 9728.90       | 3483.50         |
| 2017-04-01 00:00:00+00 | 53032.95      | 5775.60       | 4048.29         |
| 2017-05-01 00:00:00+00 | 53781.30      | 10435.58      | 6018.26         |
| 2017-06-01 00:00:00+00 | 36362.82      | 8455.80       | 3298.37         |
| 2017-07-01 00:00:00+00 | 51020.88      | 12387.36      | 7847.75         |
| 2017-08-01 00:00:00+00 | 47287.68      | 6826.55       | 8711.05         |
| 2017-09-01 00:00:00+00 | 55629.27      | 11420.30      | 9053.76         |
| 2017-10-01 00:00:00+00 | 66749.24      | 12869.00      | 6886.68         |
| 2017-11-01 00:00:00+00 | 43533.81      | 12992.48      | 7881.75         |
| 2017-12-01 00:00:00+00 | 71398.45      | 9844.85       | 5907.18         |