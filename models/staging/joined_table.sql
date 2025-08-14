{{ config(
    materialized='table'
) }}

with source_product as (
    select * 
    from {{ ref('stg_product') }}
),
source_customer as (
    select * 
    from {{ ref('stg_customer') }}
),
joined_custpro as (
    select*
    from source_customer c
    inner join source_product p
        on c.customer_id = p.customer_id
)

select * from joined_custpro
