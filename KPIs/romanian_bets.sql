select
    fb.*,
    ev.*,
    dc.*,
    crm.*,
    case
        when fc.bet_id is not null then 'cashout'
        else 'no_cashout'
    end as cashout_flag
from dw.fact_bets fb
join dw.dim_events ev
    on fb.event_id = ev.event_id
join dw.dim_customer dc
    on fb.customer_id = dc.customer_id
join dw.dim_customer_crm_level crm
    on fb.customer_id = crm.customer_id
left join dw.fact_cashouts fc
    on fb.bet_id = fc.bet_id
where ev.event_class_name = 'Romania'
  and fb.sportbetsettled_placed >= '2018-09-01'
