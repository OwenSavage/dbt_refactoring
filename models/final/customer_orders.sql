with customer_orders as (
    select * from {{ ref('new_stg_customer_orders')}}
)

select * from customer_orders