
/*You've been asked by Amazon to find the shipment_id and weight of the third heaviest shipment.
Output the shipment_id, and total_weight for that shipment_id.
In the event of a tie, do not skip ranks.*/

-- Aggregate total weight by shipment_id
-- Add ranking by total weight - `DENSE_RANK` - In the event of a tie, do not skip ranks.
-- Filter the rank = 3 as for 3rd heaviest shipment

WITH rank_weight AS
    (SELECT
        shipment_id,
        SUM(weight) AS total_weight,
        DENSE_RANK() OVER(ORDER BY SUM(weight) DESC) AS rank_weight
    FROM amazon_shipment
    GROUP BY shipment_id)
SELECT 
    shipment_id, total_weight
FROM rank_weight
WHERE rank_weight = 3;