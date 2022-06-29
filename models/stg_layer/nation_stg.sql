{{
    config(
        materialized='view',
        alias='nation'
    )

}}

select * from {{ source('tpch_sf1','nation') }}