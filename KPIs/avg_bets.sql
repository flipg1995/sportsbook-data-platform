select
    count(distinct fb.bet_id) / count(distinct fb.customer_id) as Avg_Bets_by_customers

from dw.fact_bets fb
join dw.dim_events ev

    on fb.event_id = ev.event_id
where ev.event_class_name = 'Romania'
  and fb.sportbetsettled_placed >= '2018-09-01'
