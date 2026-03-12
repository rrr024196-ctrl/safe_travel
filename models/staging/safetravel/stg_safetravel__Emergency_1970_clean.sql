with 

source as (

    select * from {{ source('safetravel', 'Emergency_1970_clean') }}

),

renamed as (

    select
        year,
        country,
        disaster_group,
        disaster_type,
        total_events,
        total_affected,
        total_deaths,
        total_damage__usd__adjusted_

    from source

)

select * from renamed