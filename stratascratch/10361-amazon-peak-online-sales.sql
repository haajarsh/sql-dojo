/*You are given a dataset from Amazon that tracks and aggregates user activity on their platform in certain time periods. For each device type, find the time period with the highest number of active users.
The output should contain 'user_count', 'time_period', and 'device_type', where 'time_period' is a concatenation of 'start_timestamp' and 'end_timestamp', like ; "start_timestamp to end_timestamp".*/

-- Calculate time period and ranking
-- Selecting top performing time-periods

WITH user_activity AS
(SELECT 
    user_count, 
    CONCAT(start_timestamp, ' to ', end_timestamp) AS time_period,
    device_type,
    DENSE_RANK() OVER(PARTITION BY device_type ORDER BY user_count DESC) AS rank_device_user
FROM user_activity)
SELECT 
    user_count,
    time_period,
    device_type
FROM user_activity
WHERE rank_device_user = 1;