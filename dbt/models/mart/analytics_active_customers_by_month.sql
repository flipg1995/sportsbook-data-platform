select
    to_char(sportbetsettled_placed::timestamp, 'YYYYMM') as yearmonth,
    count(distinct customer_id) as active_customers
from {{ ref('fact_bets') }} 
group by to_char(sportbetsettled_placed::timestamp, 'YYYYMM')
