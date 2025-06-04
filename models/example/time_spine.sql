with calendar as (
    select
        dateadd(day, seq4(), date'2020-01-01') as date_day
    from table(generator(rowcount => 10000))  -- generates ~27 years of dates
)

select * from calendar
