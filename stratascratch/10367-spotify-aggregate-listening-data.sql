--Aggregate Listening Data

SELECT
    user_id,
    ROUND(SUM(COALESCE(listen_duration, 0)) /60.0) AS total_listen_duration,
    COUNT (DISTINCT song_id) AS unique_song_count
FROM listening_habits
GROUP BY user_id;