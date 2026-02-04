with dates as (
    select distinct date(placed_at) as date from stg_sportsbook
)
select
    cast(strftime('%Y%m%d', date) as int) as date_key,
    date,
    cast(strftime('%Y', date) as int) as year,
    cast(strftime('%m', date) as int) as month,
    cast(strftime('%d', date) as int) as day,
    strftime('%w', date) as weekday
from dates
