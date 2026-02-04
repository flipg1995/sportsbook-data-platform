select
    c.cashout_id,
    c.bet_id,
    b.customer_id,
    c.created_at,
    c.status,
    c.cashout_amount
from stg_cashouts c
left join fact_bets b
    on c.bet_id = b.bet_id
