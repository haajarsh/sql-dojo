
/*Identify the top 10 ratings received by quarterbacks. Your output should include the quarterback's name and their corresponding rating.*/

-- very simple solution
SELECT
    qb,
    rate
FROM qbstats_2015_2016
ORDER BY rate DESC
LIMIT 10;

-- alternative, using CTE, rank
WITH raterank AS
(SELECT
    qb,
    rate,
    DENSE_RANK() OVER(ORDER BY rate DESC) as rate_rank
FROM qbstats_2015_2016
ORDER BY rate DESC)
SELECT qb, rate
FROM raterank
WHERE rate_rank <= 10;
