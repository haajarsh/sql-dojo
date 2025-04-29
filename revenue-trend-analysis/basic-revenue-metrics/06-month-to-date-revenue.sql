/*Calculate month to date revenue */

SELECT
  c.customer_id,
  company_name,
  SUM(amount) AS total_revenue 
FROM orders o
JOIN customers c
  ON o.customer_id = c.customer_id
WHERE order_date >= DATE_TRUNC('month', CURRENT_TIMESTAMP)
GROUP BY c.customer_id, company_name;


| customer_id | company_name               | total_revenue |
| ----------- | -------------------------- | ------------- |
| ERNSH       | Ernst Handel               | 5218.00       |
| SIMOB       | Simons bistro              | 232.09        |
| PERIC       | Pericles Comidas clásicas  | 300.00        |
| RATTC       | Rattlesnake Canyon Grocery | 1255.72       |
| RICSU       | Richter Supermarkt         | 498.10        |
| LEHMS       | Lehmanns Marktstand        | 1629.98       |
| TORTU       | Tortuga Restaurante        | 360.00        |
| LILAS       | LILA-Supermercado          | 484.50        |
| BONAP       | Bon app'                   | 792.75        |