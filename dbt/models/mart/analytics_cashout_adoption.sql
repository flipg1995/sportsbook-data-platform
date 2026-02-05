select
    fb.customer_id,
    count(distinct fc.cashout_id) as cashout_attempts,
    sum(fc.cashoutattempt_cashout_amount::numeric) as total_cashout_amount
from {{ ref('fact_cashouts') }} fc
join {{ ref('fact_bets') }} fb
    on fb.bet_id = fc.bet_id
group by fb.customer_id
