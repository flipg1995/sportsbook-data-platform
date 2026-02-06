select
    fb.market_template_name as market,

	sum(fb.winnings::numeric) as winnings
from dw.fact_bets fb
join dw.dim_events ev
    on fb.event_id = ev.event_id
where ev.event_class_name = 'Romania'
group by fb.market_template_name
order by 2 desc
