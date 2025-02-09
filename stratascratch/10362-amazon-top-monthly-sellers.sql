
/* You are provided with an already aggregated dataset from Amazon that contains detailed information about sales across different products and marketplaces. Your task is to list the top 3 sellers in each product category for January. In case of ties, rank them the same and include all sellers tied for that position.*/

-- Use CTE, filter sales data for January 2024.
-- Rank sellers within each product category based on total sales.
-- Extract the top three sellers for each category.
-- Display the output, sorted by product_category and their sales rank.

WITH january_sales AS
  (SELECT *
   FROM sales_data
   WHERE MONTH(sales_date) = 1
     AND YEAR(sales_date) = 2024),
     ranked_sales AS
  (SELECT *,
          DENSE_RANK() OVER (PARTITION BY product_category
                             ORDER BY total_sales DESC) AS sales_rank
   FROM january_sales)
SELECT product_category,
       seller_id,
       total_sales,
       market_place,
       sales_date
FROM ranked_sales
WHERE sales_rank <= 3
ORDER BY product_category,
         sales_rank;