{{
    config(
        materialized='view',
        alias='partsupp'
    )

}}

select * from {{ source('tpch_sf1','partsupp') }}