{{
    config(
        materialized='view',
        alias='orders'
        )

}}

select * from {{ source('tpch_sf1','orders') }}