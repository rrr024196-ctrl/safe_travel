with 

source as (

    select * from {{ source('safetravel', 'Emergencytest') }}

),

renamed as (

    select
        'year' as date_year,
        country,
        disaster_type,
        total_events,
        total_affected,
        total_deaths,
        total_damage__usd__original_,
        total_damage__usd__adjusted_,
        cpi

    from source

)

select * from renamed
