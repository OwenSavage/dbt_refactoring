
  create or replace  view RAW.refactoring.two  as (
    with two as(
    select *
    from raw.jaffle_shop.orders
)

select * from two
  );
