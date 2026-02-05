{{ config(materialized='view') }}

select
    cast(event_id as bigint)          as event_id,
    cast(event_name as text)          as event_name,
    cast(sport as text)               as sport,
    cast(event_date as timestamp)     as event_date
from {{ source('raw', 'events') }}
