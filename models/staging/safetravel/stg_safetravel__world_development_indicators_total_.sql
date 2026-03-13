with 

source as (

    select * from {{ source('safetravel', 'world_development_indicators_total_') }}

),

renamed as (

    select
        country,
        indicator_label,
        year,
        value

    from source

)

select * from renamed