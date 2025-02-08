
/*Amazon's information technology department is looking for information on employees' most recent logins. */

-- Using CTE, ranking
-- include explicit ordering for final

WITH rank_login AS
    (SELECT 
        id, worker_id, login_timestamp, ip_address, country, region, city, device_type,
        RANK() OVER(PARTITION BY worker_id ORDER BY login_timestamp DESC) AS rank_login
    FROM worker_logins)
SELECT 
    id, worker_id, login_timestamp, ip_address, country, region, city, device_type
FROM rank_login
WHERE rank_login = 1
ORDER BY login_timestamp, worker_id;