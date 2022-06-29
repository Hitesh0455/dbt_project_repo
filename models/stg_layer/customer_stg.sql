{{
    config(
        materialized='view',
        alias='customer'
    )

}}

select * from {{ source('tpch_sf1','customer') }}