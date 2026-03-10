select *,

lower()


from {{ ref('stg_safetravel__Development_indicators') }}