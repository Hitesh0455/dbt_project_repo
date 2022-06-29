{{
    config(
        materialized = 'table',
        alias= 'customer_seg'
    )
}}

select 
    c_custkey,
    c_name,
    c_address,
    c_MKTSEGMENT,
    {{ chk_seg(c_MKTSEGMENT) }} as segments
    from
    {{ ref('customer_stg') }} c