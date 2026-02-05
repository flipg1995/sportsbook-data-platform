{{ config(materialized='table') }}

select
    c.customer_id,
    c.customer_name,
    c.email,
    crm.crm_level,
    c.created_at as customer_created_at
from {{ ref('stg_customer') }} c
left join {{ ref('stg_customer_crm_level') }} crm
    on c.customer_id = crm.customer_id
