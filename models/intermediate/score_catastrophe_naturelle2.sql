SELECT 
    *,
    -- Calcul de l'impact logarithmique (base de calcul stable)
    -- On ajoute +1 pour éviter le LOG(0)
    ROUND((LOG10(total_morts + 1) * 0.5) + 
    (LOG10(total_population_affectee + 1) * 0.3) + 
    (LOG10(cout_dollars + 1) * 0.2), 2) AS score_unitaire
FROM {{ ref('stg_safetravel__catastrophe_naturelle') }}