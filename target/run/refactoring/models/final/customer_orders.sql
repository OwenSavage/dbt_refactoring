

      create or replace transient table RAW.refactoring.customer_orders  as
      (with customer_orders as (
    select * from RAW.refactoring.new_stg_customer_orders
)

select * from customer_orders
      );
    