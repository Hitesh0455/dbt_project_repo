{{
    config(
        materialized = 'table',
        alias= 'order_details'
    )
}}

with customer as(
    select * from {{ ref('customer_stg') }}
),
orders as(
    select * from {{ ref('orders_stg') }}
),
lineitem as(
    select * from {{ ref('lineitem_stg') }}
),
part as(
    select * from {{ ref('part_stg') }}
)

select 
        sha2(array_to_string(array_construct(o.o_orderkey,p.p_partkey,c.c_custkey,c.c_name,c.c_address,c.c_phone,p.p_name,p.p_brand,o.o_orderdate,l.l_quantity,
            p.p_retailprice,l.l_extendedprice,l.l_discount,l.l_linestatus,l.l_shipdate,l.l_shipmode),'^^^^')) as dwhash_all,
        o.o_orderkey,
        p.p_partkey,
        c.c_custkey,
        c.c_name,
        c.c_address,
        p.p_name,
        p.p_brand,
        o.o_orderdate,
        l.l_quantity,
        p.p_retailprice,
        l.l_extendedprice,
        ( l.l_quantity * p.p_retailprice) as calc_price,
        case 
            when calc_price= l.l_extendedprice then 'Matching'
            else 'Not matching'
        end as price_check_flag,
        l.l_discount,
        l.l_linestatus,
        l.l_shipdate,
        l.l_shipmode
from customer c 
        inner join orders o on (c.c_custkey=o.o_custkey)
        inner join lineitem l on (l.l_orderkey = o.o_orderkey)
        inner join part p on (p.p_partkey=l.l_partkey)

