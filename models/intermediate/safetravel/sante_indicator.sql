select *
        
from {{ ref('stg_safetravel__world_development_indicators') }}
    where indicator_label = "Life expectancy at birth, total (years)"