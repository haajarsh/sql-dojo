/*Get the job titles of the 3 employees who received the most overtime pay
Output the job title of selected records.*/

WITH rankot AS
    (SELECT
        jobtitle,
        COALESCE(overtimepay, 0) AS overtimepay,
        RANK() OVER(ORDER BY COALESCE(overtimepay, 0)DESC) AS rank_ot
    FROM sf_public_salaries)
SELECT
    jobtitle
FROM rankot
WHERE rank_ot <= 3;
