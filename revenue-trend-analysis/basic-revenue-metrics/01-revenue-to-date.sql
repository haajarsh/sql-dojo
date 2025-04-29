/*Total revenue to date for all beverages (i.e., products with category_id = 1).*/

SELECT
  SUM(amount) AS total_revenue
FROM orders;


| total_revenue |
|:--------------|
| 267868.20     |