with 

source as (

    select * from {{ source('safetravel', 'Emergencytest') }}

),

renamed as (

    select
        year,
        country,
        iso,
        disaster_group,
        disaster_subroup,
        disaster_type,
        disaster_subtype,
        total_events,
        total_affected,
        total_deaths,
        total_damage__usd__original_,
        total_damage__usd__adjusted_,
        cpi,
        _file_name

    from source

)

select * from renamed