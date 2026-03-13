SELECT 
    country,
    ROUND(SUM(final_score * rs) / NULLIF(SUM(rs), 0),2) AS global_country_score,
    COUNT(*) AS total_events_count
FROM {{ ref('score_emergency') }}
GROUP BY country
ORDER BY global_country_score DESC