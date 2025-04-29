/* Calculate revenue by category and total revenue for all orders in 2017 */

WITH all_categories AS 
	(SELECT SUM(amount) AS total_sum
  	FROM orders
  	WHERE order_date >= '2017-01-01' AND order_date < '2018-01-01')
SELECT
	categories.category_name,
  	SUM(oi.amount) AS category_revenue, 
  	ac.total_sum
FROM all_categories AS ac, order_items AS oi
JOIN products
	ON oi.product_id = products.product_id
JOIN orders
  	ON oi.order_id = orders.order_id
JOIN categories
	ON products.category_id = categories.category_id
WHERE order_date >= '2017-01-01' AND order_date < '2018-01-01'
GROUP BY categories.category_name, total_sum;


| category_name  | category_revenue | total_sum |
| -------------- | ---------------- | --------- |
| Beverages      | 103924.32        | 617085.35 |
| Condiments     | 55368.63         | 617085.35 |
| Confections    | 82657.78         | 617085.35 |
| Dairy Products | 115387.66        | 617085.35 |
| Grains/Cereals | 56871.83         | 617085.35 |
| Meat/Poultry   | 80975.12         | 617085.35 |
| Produce        | 54940.77         | 617085.35 |
| Seafood        | 66959.24         | 617085.35 |