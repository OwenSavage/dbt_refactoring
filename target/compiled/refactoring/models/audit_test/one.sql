with one as(
    select *,
        user_id +1 as user_1
    from raw.jaffle_shop.orders
    order by
        order_date desc
)

select * from one