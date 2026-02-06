select
    count(distinct fb.customer_id) as active_customers,
    count(distinct fb.bet_id) as total_bets,
    sum(fb.turnover::numeric) as total_turnover,
	ev.event_class_name,
	ev.event_sport_name,
	ev.event_name,
	c.customer_gender_name as gender,
	
	sportbetsettled_placed::date as date
from dw.fact_bets fb
join dw.dim_events ev
    on fb.event_id = ev.event_id
join dw.dim_customer c on fb.customer_id = c.customer_id
where ev.event_class_name = 'Romania'
  and fb.sportbetsettled_placed >= '2018-09-01'
	  group by 	ev.event_class_name,
	ev.event_sport_name,
	ev.event_name,
	sportbetsettled_placed::date,
	c.customer_gender_name