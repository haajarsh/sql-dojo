/*Calculate month to date revenue by shipping country */

SELECT
	ship_country,
  	SUM(amount) AS total_revenue
FROM orders
WHERE order_date >= DATE_TRUNC('month', CURRENT_TIMESTAMP)
GROUP BY ship_country;

|ship_country | total_revenue |
| ------------ | ------------- |
| Venezuela    | 484.50        |
| France       | 792.75        |
| USA          | 1255.72       |
| Germany      | 1629.98       |
| Denmark      | 232.09        |
| Switzerland  | 498.10        |
| Austria      | 5218.00       |
| Mexico       | 660.00        |