SELECT 
    country,
<<<<<<< HEAD
    ROUND(SUM(final_score * rs) / NULLIF(SUM(rs), 0),2) AS global_country_score,
=======
    -- Calcul de la moyenne pondérée
    ROUND(SUM(final_score * rs) / NULLIF(SUM(rs), 0), 2) AS global_country_score,
    -- Nombre total d'événements par pays
>>>>>>> 806f2875685606979cb5d68c9270e81fc3c7428f
    COUNT(*) AS total_events_count
FROM {{ ref('score_emergency') }}
GROUP BY country
ORDER BY global_country_score DESC