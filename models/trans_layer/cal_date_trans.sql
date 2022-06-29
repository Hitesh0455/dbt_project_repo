{{
    config(
        materialized = 'table',
        alias= 'date_details'
    )
}}

with orders as(
    select * from {{ ref('orders_stg') }}
)

select 
    o_orderdate as date,
    year(o_orderdate) as year,
    month(o_orderdate) as month,
    day(o_orderdate) as day
from orders

