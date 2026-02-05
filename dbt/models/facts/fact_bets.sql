{{ config(materialized='table') }}

select
    b.bet_id,
    b.customer_id,
    b.event_id,
    b.stake,
    b.payout,
    b.status,
    b.created_at as bet_created_at
from {{ ref('stg_sportsbook') }} b
