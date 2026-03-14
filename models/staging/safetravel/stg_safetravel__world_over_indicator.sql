with 

source as (

    select * from {{ source('safetravel', 'world_over_indicator') }}

),

renamed as (

    select
        country,
        year,
        access_to_electricity_pct_of_population,
        access_to_electricity_rural_pct_of_rural_population,
        access_to_electricity_urban_pct_of_urban_population,
        agriculture_forestry_and_fishing_value_added_pct_of_gdp,
        employment_in_agriculture_pct_of_total_employment_modeled_ilo_estimate,
        employment_in_agriculture_female_pct_of_female_employment_modeled_ilo_estimate,
        employment_in_agriculture_male_pct_of_male_employment_modeled_ilo_estimate,
        gdp_current_ususd,
        gdp_per_capita_current_ususd,
        gdp_per_capita_growth_annual_pct,
        hospital_beds_per_1000_people,
        life_expectancy_at_birth_female_years,
        life_expectancy_at_birth_male_years,
        life_expectancy_at_birth_total_years,
        net_oda_received_pct_of_gni,
        nurses_and_midwives_per_1000_people,
        people_using_at_least_basic_drinking_water_services_pct_of_population,
        people_using_at_least_basic_sanitation_services_pct_of_population,
        people_using_at_least_basic_sanitation_services_rural_pct_of_rural_population,
        people_using_at_least_basic_sanitation_services_urban_pct_of_urban_population,
        physicians_per_1000_people,
        population_density_people_per_sq_km_of_land_area,
        population_in_urban_agglomerations_of_more_than_1_million,
        population_in_urban_agglomerations_of_more_than_1_million_pct_of_total_population,
        population_living_in_areas_where_elevation_is_below_5_meters_pct_of_total_population,
        population_female,
        population_female_pct_of_total_population,
        population_male,
        population_male_pct_of_total_population,
        population_total,
        poverty_headcount_ratio_at_usd2_15_a_day_2017_ppp_pct_of_population,
        poverty_headcount_ratio_at_usd4_20_a_day_2021_ppp_pct_of_population,
        poverty_headcount_ratio_at_usd6_85_a_day_2017_ppp_pct_of_population,
        poverty_headcount_ratio_at_national_poverty_lines_pct_of_population,
        poverty_headcount_ratio_at_societal_poverty_line_pct_of_population,
        rural_population,
        rural_population_pct_of_total_population,
        rural_population_growth_annual_pct,
        rural_population_living_in_areas_where_elevation_is_below_5_meters_pct_of_total_population,
        urban_population,
        urban_population_pct_of_total_population,
        urban_population_growth_annual_pct,
        urban_population_living_in_areas_where_elevation_is_below_5_meters_pct_of_total_population

    from source

)

select * from renamed