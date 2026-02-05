{{ config(materialized='table') }}

select
    event_id,
    event_name,
    sport,
    event_date
from {{ ref('stg_events') }}
