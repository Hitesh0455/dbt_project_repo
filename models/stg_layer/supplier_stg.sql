{{
    config(
        materialized='view',
        alias='supplier'
    )

}}

select * from {{ source('tpch_sf1','supplier') }}