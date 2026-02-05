{{ config(materialized='table') }}

select
    sportbetsettled_bet_id as bet_id,
    sportbetsettled_customer_id as customer_id,
    sportbetsettled_event_id as event_id,
    bettype_name,
    market_template_name,
    channel_name,
    sportbetsettled_placed,
    sportbetsettled_settled,
    turnover,
    winnings
from {{ ref('stg_sportsbook') }}
