with 

source as (

    select * from {{ source('safetravel', 'world_indicators_scores') }}

),

renamed as (

    select
        year,
        country,
        indice_exposition,
        indice_economie,
        indice_resilience,
        indice_structurel

    from source

)

select * from renamed