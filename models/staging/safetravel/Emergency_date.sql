select
    Cast('date_year' as DATE) as date_year, 
    country, 
    disaster_type,
    total_events, 
    total_affected, 
    total_deaths, 
    total_damage__usd__original_, 
    total_damage__usd__adjusted_, 
    cpi

from {{ ref('stg_safetravel__Emergencytest') }}
