with 

source as (

    select * from {{ source('safetravel', 'world_development_short') }}

),

renamed as (

    select
        country,
        year,
        access_to_electricity_pct_of_population,
        agriculture_forestry_and_fishing_value_added_pct_of_gdp,
        employment_in_agriculture_pct_of_total_employment_modeled_ilo_estimate,
        gdp_per_capita_current_ususd,
        gdp_per_capita_growth_annual_pct,
        hospital_beds_per_1000_people,
        life_expectancy_at_birth_total_years,
        net_oda_received_pct_of_gni,
        people_using_at_least_basic_drinking_water_services_pct_of_population,
        people_using_at_least_basic_sanitation_services_pct_of_population,
        physicians_per_1000_people,
        population_density_people_per_sq_km_of_land_area,
        population_in_urban_agglomerations_of_more_than_1_million_pct_of_total_population,
        population_living_in_areas_where_elevation_is_below_5_meters_pct_of_total_population,
        population_total,
        poverty_headcount_ratio_at_usd2_15_a_day_2017_ppp_pct_of_population,
        urban_population_pct_of_total_population

    from source

)

select* from renamed