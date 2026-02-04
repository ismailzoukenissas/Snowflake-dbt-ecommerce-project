{{ config(
    materialized='table',
    schema='MARTS'
) }}

select
    oi.order_id,
    o.customer_id,
    oi.product_id,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) as total_amount,
    o.order_date
from {{ ref('stg_order_items') }} oi
join {{ ref('stg_orders') }} o
  on oi.order_id = o.order_id
