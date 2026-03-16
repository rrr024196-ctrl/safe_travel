with 

source as (

    select * from {{ source('safetravel', 'catastrophe_naturelle') }}

),

renamed as (

    select
        année,
        pays,
        phénomène,
        catastrophe_naturelle,
        total_évènements,
        total_population_affectée,
        total_morts,
        coût_dollars

    from source

)

select * from renamed