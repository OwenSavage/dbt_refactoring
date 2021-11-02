
  create or replace  view RAW.refactoring.stg_customers  as (
    with customers as (
    select * from raw.jaffle_shop.customers
)

select * from customers
  );
