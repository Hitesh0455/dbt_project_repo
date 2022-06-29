{{
    config(
        materialized='view',
        alias='part'
    )

}}

select * from {{ source('tpch_sf1','part') }}