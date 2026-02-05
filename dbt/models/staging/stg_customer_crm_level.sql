{{ config(materialized='view') }}

select
    cast(customer_id as bigint)       as customer_id,
    cast(crm_level as text)            as crm_level,
    cast(updated_at as timestamp)     as updated_at
from {{ source('raw', 'customer_crm_level') }}
