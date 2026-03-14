with base as (

select
    r.country,
    r.year,
    e.didsater,
    r.indice_exposition,
    r.indice_economie,
    r.indice_resilience,
    r.indice_structurel,
    e.rs as indice_risk_cata,
    e.final_score as classe_risk_cata,

    coalesce(r.indice_exposition,0)
    + coalesce(r.indice_economie,0) as indice_structurel_2

from {{ ref('stg_safetravel__world_development_scores') }} r
left join {{ ref('score_emergency') }} e
on r.country = e.country
and r.year = e.year

),

scored as (

select
    *,

    ntile(5) over (
        partition by year
        order by indice_structurel asc
    ) as classe_structurale,

    ntile(5) over (
        partition by year
        order by indice_resilience asc
    ) as classe_resilience

from base

)

select
    country,
    year,
    indice_exposition,
    indice_economie,
    indice_resilience,
    indice_structurel,
    indice_structurel_2
    classe_structurale,
    classe_resilience,
    classe_risk_cata,

case classe_structurale
    when 1 then 'A'
    when 2 then 'B'
    when 3 then 'C'
    when 4 then 'D'
    when 5 then 'E'
end as lettre_structurale,

case classe_risk_cata
    when 1 then 'vert'
    when 2 then 'jaune'
    when 3 then 'orange'
    when 4 then 'rouge'
    when 5 then 'rouge fonce'
end as couleur_risque,

concat(
    case classe_structurale
        when 1 then 'A'
        when 2 then 'B'
        when 3 then 'C'
        when 4 then 'D'
        when 5 then 'E'
    end,
    cast(classe_resilience as string),
    ' ',
    case classe_risk_cata
        when 1 then 'vert'
        when 2 then 'jaune'
        when 3 then 'orange'
        when 4 then 'rouge'
        when 5 then 'rouge fonce'
    end
) as score_dashboard

from scored
