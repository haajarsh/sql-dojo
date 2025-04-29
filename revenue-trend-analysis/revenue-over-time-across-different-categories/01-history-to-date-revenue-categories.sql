/* Calculate history to-date revenue by category.*/

SELECT 
  category_name,
  SUM(amount) AS total_revenue 
FROM order_items oi
JOIN products p
  ON oi.product_id = p.product_id
JOIN categories c
  ON p.category_id = c.category_id
GROUP BY category_name;

| category_name  | total_revenue |
| -------------- | ------------- |
| Grains/Cereals | 95744.60      |
| Seafood        | 131261.77     |
| Meat/Poultry   | 163022.38     |
| Beverages      | 267868.20     |
| Dairy Products | 234507.32     |
| Produce        | 99984.58      |
| Condiments     | 106047.15     |
| Confections    | 167357.29     |

/* Calculate history to-date revenue by category for orders shipped to USA. */


SELECT
	category_name,
  	SUM(order_items.amount) AS total_revenue
FROM order_items
JOIN orders
  ON order_items.order_id = orders.order_id
JOIN products
  ON order_items.product_id = products.product_id
JOIN categories 
  ON products.category_id = categories.category_id
WHERE ship_country = 'USA'
GROUP BY category_name;

| category_name  | total_revenue |
| -------------- | ------------- |
| Beverages      | 60520.98      |
| Condiments     | 16597.53      |
| Confections    | 36314.95      |
| Dairy Products | 37902.05      |
| Grains/Cereals | 19290.57      |
| Meat/Poultry   | 41635.04      |
| Produce        | 9816.33       |
| Seafood        | 23507.20      |


/* Calculate total revenue for all categories for orders placed in the first six months of 2017. */

SELECT
	category_name,
  	SUM(order_items.amount) AS total_revenue
FROM order_items
JOIN orders
  ON order_items.order_id = orders.order_id
JOIN products
  ON order_items.product_id = products.product_id
JOIN categories
  ON products.category_id = categories.category_id
WHERE order_date >= '2017-01-01' AND order_date < '2017-07-01'
GROUP BY category_name;

| category_name  | total_revenue |
| -------------- | ------------- |
| Beverages      | 61368.91      |
| Condiments     | 25878.78      |
| Confections    | 40720.26      |
| Dairy Products | 49047.12      |
| Grains/Cereals | 27566.60      |
| Meat/Poultry   | 32334.80      |
| Produce        | 23878.48      |
| Seafood        | 20671.07      |