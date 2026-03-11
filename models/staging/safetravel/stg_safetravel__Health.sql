with 

source as (

    select * from {{ source('safetravel', 'Health') }}

),

renamed as (

    select
        int64_field_0 AS pk,
        country,
       date(year,1,1) as year_date,
       `disease name` as disease_name,
       `disease category` as disease_catg,
       `prevalence rate __`as prevalence_rate,
       `incidence rate __` as incidence_rate,
        `mortality rate __`as mortality_rate,
        `age group` as age_group,
        gender,
        `population affected` as population_affected,
        `healthcare access __` as healthcare_access,
        `doctors per 1000` as doctors_per_mille,
        `hospital beds per 1000` as hospital_beds_per_mille,
        `treatment type` as tretment_type,
        `average treatment cost _usd_` as avg_tretment_cost,
        `availability of vaccines_treatment` as availability_vacc,
        `recovery rate __` as recovery_rate,
        dalys,
        `improvement in 5 years __` as improvement_in5years,
        `per capita income _usd_` as per_capita_icome_usd,
        `education index` as education_index,
        `urbanization rate __` as urbanization_rate

    from source

)

select * from renamed