/* Calculate total revenue by category and percentages for 2017 and later */

WITH all_categories AS (
  SELECT SUM(amount) AS total_sum
  FROM orders
  WHERE order_date >= '2017-01-01'
)

SELECT
  category_name,
  SUM(oi.amount) AS category_revenue,
  ROUND(100.0 * SUM(oi.amount) / ac.total_sum, 2) AS total_revenue_percentage
FROM all_categories ac, order_items oi
JOIN orders o
  ON o.order_id = oi.order_id
JOIN products p
  ON oi.product_id = p.product_id
JOIN categories c
  ON p.category_id = c.category_id
WHERE order_date >= '2017-01-01'
GROUP BY
  category_name,
  ac.total_sum;

| category_name  | category_revenue | total_revenue_percentage |
| -------------- | ---------------- | ------------------------ |
| Seafood        | 111870.54        | 10.58                    |
| Meat/Poultry   | 134208.72        | 12.69                    |
| Beverages      | 219949.20        | 20.79                    |
| Dairy Products | 193526.87        | 18.30                    |
| Condiments     | 88146.76         | 8.33                     |
| Produce        | 86098.80         | 8.14                     |
| Grains/Cereals | 86236.68         | 8.15                     |
| Confections    | 137671.73        | 13.02                    |


/* Calculate total revenue by categories and ratio of category revenue to total revenue generated for all orders shipped to Germany. */


WITH all_categories AS (
  SELECT SUM(amount) AS total_sum
  FROM orders
  WHERE ship_country = 'Germany'
)
SELECT 
  category_name,
  SUM(oi.amount) AS category_revenue,
  1.0 * SUM(oi.amount) / ac.total_sum AS total_revenue_ratio
FROM all_categories ac, order_items oi
JOIN orders o
  ON o.order_id = oi.order_id
JOIN products p
  ON oi.product_id = p.product_id
JOIN categories c
  ON p.category_id = c.category_id
WHERE ship_country = 'Germany'
GROUP BY
  category_name,
  ac.total_sum;


| category_name  | category_revenue | total_revenue_ratio    |
| -------------- | ---------------- | ---------------------- |
| Beverages      | 54634.12         | 0.23724599320953555358 |
| Condiments     | 16736.55         | 0.07267764956497976483 |
| Confections    | 35878.62         | 0.15580115204358570255 |
| Dairy Products | 49640.96         | 0.21556344019222467633 |
| Grains/Cereals | 13639.81         | 0.05923020761823115553 |
| Meat/Poultry   | 21455.80         | 0.09317076180791697442 |
| Produce        | 16013.11         | 0.06953614675817137474 |
| Seafood        | 22285.72         | 0.09677464880535479801 |
