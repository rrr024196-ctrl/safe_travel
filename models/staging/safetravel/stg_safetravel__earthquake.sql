with 

source as (

    select * from {{ source('safetravel', 'earthquake') }}

),

renamed as (

    select
        time,
        latitude,
        longitude,
        depth,
        mag,
        magtype,
        nst,
        gap,
        dmin,
        rms,
        net,
        id,
        updated,
        place,
        type,
        horizontalerror,
        deptherror,
        magerror,
        magnst,
        status,
        locationsource,
        magsource

    from source

)

select * from renamed