select distinct
    event_id,
    sport,
    class,
    league,
    event_name,
    start_time,
    end_time
from stg_events
