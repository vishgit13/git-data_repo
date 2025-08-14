{{ config(materialized='table') }}

with source_product as (
    select * 
    from {{ ref('stg_product') }}
),
source_customer as (
    select * 
    from {{ ref('stg_customer') }}
),
joined_custpro as (
    select
        c.customer_id,
        c.full_name,
        c.email,
        c.created_at,
        c.address,
        c.state,
        c.total_amount,
        c.discount,
        c.net_amount,
        c.total_amount_purchase,
        c.CLV,
        p.product_id,
        p.product_name,
        p.category,
        p.brand,
        p.is_active,
        p.release_date
    from source_customer c
    inner join source_product p
        on c.customer_id = p.customer_id
)

select * 
from joined_custpro
