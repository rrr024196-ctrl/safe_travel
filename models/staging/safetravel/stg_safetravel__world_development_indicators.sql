with 

source as (

    select * from {{ source('safetravel', 'world_development_indicators') }}

),

renamed as (

    select
        country,
        indicator_label,
        `year` AS year_wdi,
        `value` AS value_wdi

    from source

)

select * from renamed