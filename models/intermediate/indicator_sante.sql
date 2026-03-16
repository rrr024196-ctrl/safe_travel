select *
        
from {{ ref('sante_indicator') }}
    where indicator_label = "Life expectancy at birth, total (years)"