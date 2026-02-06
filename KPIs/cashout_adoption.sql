select
    round(
        count(distinct fc.bet_id)::numeric
        / count(distinct fb.bet_id) * 100, 2
    ) as cashout_rate_pct
from dw.fact_bets fb
left join dw.fact_cashouts fc
    on fb.bet_id = fc.bet_id
join dw.dim_events ev
    on fb.event_id = ev.event_id
where ev.event_class_name = 'Romania';
