select
    CashoutAttempt_Bet_Cashout_ID as cashout_id,
    CashoutAttempt_Bet_ID as bet_id,
    datetime(CashoutAttempt_Bet_Cashout_Created) as created_at,
    CashoutAttempt_Bet_Cashout_Status as status,
    CashoutAttempt_Cashout_Amount as cashout_amount
from raw_cashouts
