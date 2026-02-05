select
    cashout_flag,
    count(*) as bets,
    sum(turnover::numeric) as total_turnover

from (
    select
        fb.turnover,
        case
            when fc.bet_id is not null then 'cashout'
            else 'no_cashout'
        end as cashout_flag
    from dw.fact_bets fb
    left join dw.fact_cashouts fc
        on fb.bet_id = fc.bet_id
    join dw.dim_events ev
    on fb.event_id = ev.event_id

where ev.event_class_name = 'Romania'
  and fb.sportbetsettled_placed >= '2018-09-01'
) t


group by cashout_flag;
