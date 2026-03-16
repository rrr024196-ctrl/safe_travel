with 

source as (

    select * from {{ source('safetravel', 'catastrophe_naturelle') }}

),

renamed as (

    select
        `annee` as annee_catastrophe,
        pays,
        `phenomene`,
        catastrophe_naturelle,
        total_evenements,
        total_population_affectee,
        total_morts,
        cout_dollars

    from source

)

select * from renamed