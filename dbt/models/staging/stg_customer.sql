{{ config(materialized='view') }}

select
    cast(customer_id as bigint)       as customer_id,
    cast(name as text)                as customer_name,
    cast(email as text)               as email,
    cast(created_at as timestamp)     as created_at
from {{ source('raw', 'customer') }}
