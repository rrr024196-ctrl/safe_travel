with 

source as (

    select * from {{ source('safetravel', 'Health') }}

),

renamed as (

    select
        int64_field_0,
        country,
        year,
        disease name,
        disease category,
        prevalence rate __,
        incidence rate __,
        mortality rate __,
        age group,
        gender,
        population affected,
        healthcare access __,
        doctors per 1000,
        hospital beds per 1000,
        treatment type,
        average treatment cost _usd_,
        availability of vaccines_treatment,
        recovery rate __,
        dalys,
        improvement in 5 years __,
        per capita income _usd_,
        education index,
        urbanization rate __

    from source

)

select * from renamed