select
    SportBetSettled_Bet_ID as bet_id,
    SportBetSettled_Customer_ID as customer_id,
    SportBetSettled_Event_ID as event_id,
    datetime(SportBetSettled_Placed) as placed_at,
    datetime(SportBetSettled_Settled) as settled_at,
    Channel_Name as channel,
    BetType_Name as bet_type,
    Market_Template_Name as market,
    Turnover,
    Winnings,
    (Turnover - Winnings) as gross_revenue
from raw_sportsbook
