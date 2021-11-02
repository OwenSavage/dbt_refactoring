with customer_orders as (
    select * from {{ref('stg_customer_orders')}}
)

select * from customer_orders