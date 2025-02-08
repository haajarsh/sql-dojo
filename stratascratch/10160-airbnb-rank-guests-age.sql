/*Rank guests based on their ages.
Output the guest id along with the corresponding rank.
Order records by the age in descending order.*/


SELECT
    guest_id,
    RANK() OVER (ORDER BY age DESC) AS `rank`
FROM airbnb_guests;