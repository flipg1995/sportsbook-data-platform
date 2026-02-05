select
    new_customer_id as customer_id,
    date_yearmonth,
    crm_level
from {{ source('bets', 'customer_crm_level') }}
