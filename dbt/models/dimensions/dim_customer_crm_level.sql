{{ config(materialized='table') }}

select
    customer_id,
    date_yearmonth,
    crm_level
from {{ ref('stg_customer_crm_level') }}
