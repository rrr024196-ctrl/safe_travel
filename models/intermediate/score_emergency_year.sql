SELECT 
    country,
    "year",
    -- Calcul de la moyenne pondérée
    ROUND(SUM(final_score * rs) / NULLIF(SUM(rs), 0), 2) AS global_country_score,
    -- Nombre total d'événements par pays
    COUNT(*) AS total_events_count
FROM {{ ref('score_emergency') }}
GROUP BY 1,2
ORDER BY global_country_score DESC