with dates as (
    select distinct
        cast("Placed_At" as date) as date
    from {{ ref('stg_sportsbook') }}
)
select
    cast(to_char(date, 'YYYYMMDD') as int) as date_key,
    date,
    extract(year  from date)::int as year,
    extract(month from date)::int as month,
    extract(day   from date)::int as day,
    extract(dow   from date)::int as weekday
from dates
