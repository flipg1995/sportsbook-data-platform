select
    SportBetSettled_Bet_ID as bet_id,
    SportBetSettled_Customer_ID as customer_id,
    Turnover,
    Winnings,
    (Turnover - Winnings) as gross_revenue
from raw.sportsbook
