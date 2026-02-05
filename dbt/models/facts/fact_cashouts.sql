
{{ config(materialized='table') }}

select
    cashoutattempt_bet_cashout_id as cashout_id,
    cashoutattempt_bet_id as bet_id,
    cashoutattempt_bet_cashout_created,
    cashoutattempt_bet_cashout_status,
    cashoutattempt_cashout_amount
from {{ ref('stg_cashouts') }}


