WITH base_impact AS (
    -- Étape 1 : Calcul de l'impact brut (SIB)
    SELECT 
        *,
        (tot_deaths * 0.5) + (tot_affected * 0.3) + (damage_usd * 0.2) AS sib
    FROM {{ ref('stg_safetravel__emergency') }}
),

normalized_impact AS (
    -- Étape 2 : Normalisation du SIB entre 0 et 1
    SELECT 
        *,
        -- On garde la logique de normalisation pour le SIB
        (sib - MIN(sib) OVER()) / NULLIF(MAX(sib) OVER() - MIN(sib) OVER(), 0) AS sib_n
    FROM base_impact
),

risk_calculation AS (
    -- Étape 3 : Calcul du score de risque (RS)
    SELECT 
        *,
        (tot_events * sib_n) AS rs
    FROM normalized_impact
)

-- Étape 4 : Mise à l'échelle finale (1 à 5) via les Centiles
-- Cette méthode garantit une répartition parfaite sur toute l'échelle
SELECT 
    *,
    ROUND(1 + 4 * PERCENT_RANK() OVER(ORDER BY rs),2) AS final_score
FROM risk_calculation