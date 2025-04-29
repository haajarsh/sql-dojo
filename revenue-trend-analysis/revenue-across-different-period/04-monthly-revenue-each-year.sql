/*Total monthly revenue processed for each year by employee ID 5. */


SELECT
	EXTRACT(year FROM order_date) AS revenue_year,
  	EXTRACT(month FROM order_date) AS revenue_month,
  	SUM(amount) AS total_revenue
FROM orders
WHERE employee_id = '5'
GROUP BY 
  	EXTRACT(year FROM order_date), EXTRACT(month FROM order_date)
ORDER BY
	EXTRACT(year FROM order_date),EXTRACT(month FROM order_date);


| revenue_year | revenue_month | total_revenue |
| ------------ | ------------- | ------------- |
| 2016         | 7             | 1638.82       |
| 2016         | 9             | 1420.00       |
| 2016         | 10            | 1393.20       |
| 2016         | 11            | 3901.08       |
| 2016         | 12            | 10030.82      |
| 2017         | 3             | 2520.40       |
| 2017         | 5             | 4500.28       |
| 2017         | 6             | 3037.40       |
| 2017         | 7             | 6475.40       |
| 2017         | 8             | 3585.58       |
| 2017         | 9             | 2024.83       |
| 2017         | 10            | 7581.33       |
| 2017         | 11            | 484.27        |
| 2017         | 12            | 507.00        |
| 2018         | 1             | 11702.80      |
| 2018         | 2             | 5377.06       |
| 2021         | 6             | 742.50        |
| 2022         | 6             | 1659.54       |
| 2024         | 8             | 210.00        |