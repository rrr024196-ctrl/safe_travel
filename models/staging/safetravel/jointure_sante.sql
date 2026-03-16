select 
h.year_date,
h.country,
h.healthcare_access,
h.doctors_per_mille,
s.value_wdi
        
from {{ ref('stg_safetravel__Health_source') }} h
LEFT JOIN {{ ref('sante_indicator') }} s
    ON h.year_date =s.year_wdi
    AND h.country = s.country