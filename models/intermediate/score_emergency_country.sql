SELECT 
    country,
    ROUND(SUM(final_score * rs) / NULLIF(SUM(rs), 0),2) AS global_country_score,
    -- Calcul de la moyenne pondérée
    ROUND(SUM(final_score * rs) / NULLIF(SUM(rs), 0), 2) AS global_country_score,
    -- Nombre total d'événements par pays
    COUNT(*) AS total_events_count
FROM {{ ref('score_emergency') }}
GROUP BY country
ORDER BY global_country_score DESC