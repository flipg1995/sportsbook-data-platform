select
    fb.market_template_name,
    count(distinct fb.bet_id) as bets,
    sum(fb.turnover::numeric) as turnover
from dw.fact_bets fb
join dw.dim_events ev
    on fb.event_id = ev.event_id
where ev.event_class_name = 'Romania'
group by fb.market_template_name
order by turnover desc;
