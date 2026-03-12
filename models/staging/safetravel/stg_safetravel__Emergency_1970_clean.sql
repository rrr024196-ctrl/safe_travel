with 

source as (

    select * from {{ source('safetravel', 'Emergency_1970_clean') }}

),

renamed as (

    select
        year,
        country,
        disaster group,
        disaster type,
        total events,
        total affected,
        total deaths,
        total_damage_usd_adjusted

    from source

)

select * from renamed