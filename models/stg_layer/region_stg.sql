{{
    config(
        materialized='view',
        alias='region'
    )

}}

select * from {{ source('tpch_sf1','region') }}