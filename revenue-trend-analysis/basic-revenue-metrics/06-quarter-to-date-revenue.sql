/*Calculate quarter to date revenue for each employee */

SELECT
	employees.employee_id,
  	employees.last_name,
  	SUM(amount) AS total_revenue
FROM orders
JOIN employees
	ON orders.employee_id = employees.employee_id
WHERE order_date >= DATE_TRUNC('quarter', current_timestamp)
GROUP BY employees.employee_id, employees.last_name;


| employee_id | last_name | total_revenue |
| ----------- | --------- | ------------- |
| 4           | Peacock   | 6010.75       |
| 2           | Fuller    | 1929.98       |
| 7           | King      | 232.09        |
| 1           | Davolio   | 2100.22       |
| 8           | Callahan  | 498.10        |