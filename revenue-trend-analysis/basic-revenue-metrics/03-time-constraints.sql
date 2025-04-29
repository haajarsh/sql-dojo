/*Total revenue from all orders in 2017*/

SELECT 
	SUM(amount) AS total_revenue
FROM orders
WHERE order_date BETWEEN '2017-01-01' AND '2017-12-31';


| total_revenue |
|:--------------|
| 617085.35     |



/*Total revenue for all orders in 2018*/

SELECT 
	SUM(amount) AS total_revenue
FROM orders
WHERE order_date >= '2018-01-01' AND order_date < '2018-01-01'::DATE + INTERVAL '12' month;

--alternative
SELECT 
	SUM(amount) AS total_revenue 
FROM orders
WHERE order_date >= '2018-01-01' AND order_date < '2019-01-01';