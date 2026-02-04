select
    Event_ID as event_id,
    Event_Sport_Name as sport,
    Event_Class_Name as class,
    Event_Type_Name as league,
    Event_Name as event_name,
    datetime(Event_Start_Time) as start_time,
    datetime(Event_End_Time) as end_time
from raw_events
