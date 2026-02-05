select
    cashoutattempt_bet_cashout_id,
    cashoutattempt_bet_id,
    cashoutattempt_bet_cashout_created,
    cashoutattempt_bet_cashout_status,
    cashoutattempt_cashout_amount
from {{ source('bets', 'cashouts') }}
