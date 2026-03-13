SELECT 
    country,
    "year",
    ROUND(SUM(final_score * rs) / NULLIF(SUM(rs), 0), 2) AS global_country_score,
    COUNT(*) AS total_events_count
FROM {{ ref('score_emergency') }}
GROUP BY 1,2
ORDER BY global_country_score DESC