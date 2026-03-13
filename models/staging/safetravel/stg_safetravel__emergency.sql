with 

source as (

    select * from {{ source('safetravel', 'emergency') }}

),

renamed as (

    select
        year,
        country,
        pheno,
        disaster,
        tot_events,
        tot_affected,
        tot_deaths,
        damage_usd

    from source

)

select * from renamed