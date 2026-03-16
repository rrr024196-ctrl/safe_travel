with base as ( 
select
r.*,
e.disaster, 
e.tot_events, 
e.tot_affected,
e.tot_deaths, 
e.damage_usd,

from {{ ref('stg_safetravel__world_development_short') }} as r
left join {{ ref('stg_safetravel__emergency') }} as e
    on r.year = e.year
    and r.country = e.country
)

select count (distinct country)
from base