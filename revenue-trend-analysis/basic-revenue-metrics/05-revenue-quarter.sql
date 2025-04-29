/* This query calculates the total revenue by shipping country in the first quarter of 2018.*/

SELECT
	ship_country,
  	SUM(amount) AS total_revenue
FROM orders
WHERE order_date >= '2018-01-01' AND order_date < '2018-01-01'::DATE + INTERVAL '3' month
GROUP BY ship_country;

| ship_country | total_revenue |
| ------------ | ------------- |
| Argentina    | 2275.70       |
| Austria      | 14786.40      |
| Belgium      | 9742.50       |
| Brazil       | 17196.94      |
| Canada       | 187.00        |
| Finland      | 1401.00       |
| France       | 9657.39       |
| Germany      | 44599.09      |
| Ireland      | 17035.79      |
| Italy        | 3188.90       |
| Mexico       | 2174.50       |
| Norway       | 3354.40       |
| Poland       | 587.50        |
| Spain        | 3901.46       |
| Sweden       | 7532.70       |
| UK           | 4607.50       |
| USA          | 44083.02      |
| Venezuela    | 7325.63       |