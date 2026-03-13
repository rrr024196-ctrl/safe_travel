with 

source as (

    select * from {{ source('safetravel', 'world_development_scored_') }}

),

renamed as (

    select
        country,
        year,
        indice_exposition,
        indice_economie,
        indice_resilience,
        indice_risque_catastrophe,
        indice_risque_catastrophe_100

    from source

)

select * from renamed