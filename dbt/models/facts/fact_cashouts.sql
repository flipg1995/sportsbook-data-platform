{{ config(materialized='table') }}

select
    c.cashout_id,
    c.bet_id,
    c.customer_id,
    c.amount,
    c.created_at as cashout_created_at
from {{ ref('stg_cashouts') }} c
