
{{ config(
    materialized='table' 
) }}

SELECT
    country,
    year_date,
    AVG(healthcare_access) AS health_access_par_an
FROM {{ ref('stg_safetravel__Health') }}
WHERE year_date IN (
    DATE '2020-01-01', DATE '2010-01-01', DATE '2024-01-01'
)
GROUP BY country, year_date
ORDER BY health_access_par_an DESC