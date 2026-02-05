{{ config(materialized='view') }}

select
    cast(cashout_id as bigint)        as cashout_id,
    cast(bet_id as bigint)            as bet_id,
    cast(customer_id as bigint)       as customer_id,
    cast(amount as numeric)           as amount,
    cast(created_at as timestamp)     as created_at
from {{ source('raw', 'cashouts') }}

