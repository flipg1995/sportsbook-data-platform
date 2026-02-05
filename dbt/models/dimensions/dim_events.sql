{{ config(materialized='table') }}

select
    event_id,
    event_sport_name,
    event_class_name,
    event_type_name,
    event_name,
    event_start_time,
    event_end_time

from {{ ref('stg_events') }}
