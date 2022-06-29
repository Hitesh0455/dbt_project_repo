{{
    config(
        materialized='view',
        alias='lineitem'
    )

}}

select * from {{ source('tpch_sf1','lineitem') }}