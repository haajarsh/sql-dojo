/*Calculate year-to-date revenue for each customer. */

SELECT
	customer_id,
  	SUM(amount) AS total_revenue
FROM orders
WHERE order_date >= DATE_TRUNC('year', CURRENT_TIMESTAMP)
GROUP BY customer_id;


customer_id | total_revenue |
| ----------- | ------------- |
| QUEEN       | 2027.08       |
| TORTU       | 360.00        |
| FRANS       | 266.00        |
| LEHMS       | 1629.98       |
| RICAR       | 1838.00       |
| HUNGO       | 1342.95       |
| BONAP       | 792.75        |
| ERNSH       | 5218.00       |
| GREAL       | 510.00        |
| SIMOB       | 232.09        |
| LILAS       | 673.92        |
| RICSU       | 498.10        |
| WHITC       | 928.75        |
| RATTC       | 1255.72       |
| PERIC       | 300.00        |
| BLAUS       | 858.00        |
| DRACD       | 86.85         |
| SAVEA       | 4330.40       |
| REGGC       | 406.40        |