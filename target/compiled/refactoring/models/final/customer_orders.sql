with customer_orders as (
    select * from RAW.refactoring.new_stg_customer_orders
)

select * from customer_orders