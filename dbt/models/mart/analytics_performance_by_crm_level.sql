select
    ccl.crm_level,
    sum(fb.turnover::numeric) as total_turnover,
    sum(fb.winnings::numeric) as total_winnings,
    sum(fb.turnover::numeric - fb.winnings::numeric) as ggr,
    count(distinct fb.bet_id) as bets_count
from {{ ref('fact_bets') }} fb
join {{ ref('dim_customer_crm_level') }} ccl
    on fb.customer_id = ccl.customer_id
where to_char(fb.sportbetsettled_placed::timestamp, 'YYYYMM')
      = ccl.date_yearmonth
group by 1