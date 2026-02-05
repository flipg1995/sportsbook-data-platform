
select
    customer_id,
    sum(turnover::numeric) as total_turnover,
    sum(winnings::numeric) as total_winnings,
    count(distinct bet_id) as total_bets,
     sum(turnover::numeric - winnings::numeric) as ggr
from {{ ref('fact_bets') }}
group by customer_id
