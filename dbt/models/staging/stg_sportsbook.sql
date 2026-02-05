select
    sportbetsettled_bet_id,
    sportbetsettled_customer_id,
    sportbetsettled_event_id,
    bettype_name,
    market_template_name,
    channel_name,
    sportbetsettled_placed,
    sportbetsettled_settled,
    turnover,
    winnings
from {{ source('bets', 'sportsbook') }}
