with base as (
  select
    r.country,
    r.year,
    r.indice_exposition,
    r.indice_economie,
    r.indice_resilience,
    e.final_score,

    (coalesce(r.indice_exposition, 0) + coalesce(r.indice_economie, 0)) as score_structurel
  from {{ ref('stg_safetravel__world_development_scored_') }} as r
  left join {{ ref('stg_safetravel__emergency') }} as e
    on r.country = e.country
    and r.year = e.year
),

scored as (
  select
    *,
    ntile(5) over (order by score_structurel asc) as score_structurel_quintile,
    ntile(5) over (order by indice_resilience asc) as score_resilience_quintile
  from base
)

select
  country,
  year,
  indice_exposition,
  indice_economie,
  indice_resilience,
  final_score,
  score_structurel,

  case score_structurel_quintile
    when 1 then 'A'
    when 2 then 'B'
    when 3 then 'C'
    when 4 then 'D'
    when 5 then 'E'
  end as lettre_structurale,

  case score_resilience_quintile
    when 1 then 1
    when 2 then 2
    when 3 then 3
    when 4 then 4
    when 5 then 5
  end as note_resilience,

  case external_risk_score
    when 1 then 'vert'
    when 2 then 'jaune'
    when 3 then 'orange'
    when 4 then 'rouge'
    when 5 then 'rouge fonce'
    else 'gris'
  end as couleur_risque_externe,

  concat(
    case score_structurel_quintile
      when 1 then 'A'
      when 2 then 'B'
      when 3 then 'C'
      when 4 then 'D'
      when 5 then 'E'
    end,
    cast(
      case score_resilience_quintile
        when 1 then 1
        when 2 then 2
        when 3 then 3
        when 4 then 4
        when 5 then 5
      end as string
    ),
    ' ',
    case final_score
      when 1 then 'vert'
      when 2 then 'jaune'
      when 3 then 'orange'
      when 4 then 'rouge'
      when 5 then 'rouge fonce'
      else 'gris'
    end
  ) as color_score

from scored;