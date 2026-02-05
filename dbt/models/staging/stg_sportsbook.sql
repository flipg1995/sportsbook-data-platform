{{ config(materialized='view') }}

select
    cast(bet_id as bigint)            as bet_id,
    cast(customer_id as bigint)       as customer_id,
    cast(event_id as bigint)          as event_id,
    cast(stake as numeric)            as stake,
    cast(payout as numeric)           as payout,
    cast(status as text)              as status,
    cast(created_at as timestamp)     as created_at
from {{ source('raw', 'sportsbook') }}
