select
    customer_id,
    bettype_name,
    channel_name,
    market_template_name,
    count(*) as bets_count,
    sum(turnover::numeric) as total_turnover
from {{ ref('fact_bets') }}
group by
    customer_id,
    bettype_name,
    channel_name,
    market_template_name
