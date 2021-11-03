













with a as (

    
select
    "ID", "USER_ID", "ORDER_DATE", "STATUS", "_ETL_LOADED_AT", "USER_1"

from RAW.refactoring.one


),

b as (

    
select
    "ID", "USER_ID", "ORDER_DATE", "STATUS", "_ETL_LOADED_AT", "USER_1"

from RAW.refactoring.two


),

a_intersect_b as (

    select * from a
    

    intersect


    select * from b

),

a_except_b as (

    select * from a
    

    except


    select * from b

),

b_except_a as (

    select * from b
    

    except


    select * from a

),

all_records as (

    select
        *,
        true as in_a,
        true as in_b
    from a_intersect_b

    union all

    select
        *,
        true as in_a,
        false as in_b
    from a_except_b

    union all

    select
        *,
        false as in_a,
        true as in_b
    from b_except_a

),

summary_stats as (
    select
        in_a,
        in_b,
        count(*) as count
    from all_records

    group by 1, 2
)
-- select * from all_records
-- where not (in_a and in_b)
-- order by  in_a desc, in_b desc

select
    *,
    round(100.0 * count / sum(count) over (), 2) as percent_of_total

from summary_stats
order by in_a desc, in_b desc



