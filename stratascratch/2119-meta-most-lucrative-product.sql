/*You have been asked to find the 5 most lucrative products in terms of total revenue for the first half of 2022 (from January to June inclusive).
Output their IDs and the total revenue.*/

-- Aggregate the total revenue for each product in the first half of 2022
-- Rank the products by total revenue

WITH product_rank
AS
    (SELECT 
        product_id,
        SUM(cost_in_dollars * units_sold) AS total_revenue,
        DENSE_RANK() OVER(ORDER BY SUM(cost_in_dollars * units_sold) DESC) AS rank_product
    FROM online_orders
    WHERE MONTH(date) BETWEEN 1 AND 6
    GROUP BY product_id)
SELECT 
    product_id,
    total_revenue
FROM product_rank
WHERE rank_product <= 5;    